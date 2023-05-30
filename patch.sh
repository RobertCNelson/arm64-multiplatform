#!/bin/bash -e
#
# Copyright (c) 2009-2022 Robert Nelson <robertcnelson@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Split out, so build_kernel.sh and build_deb.sh can share..

shopt -s nullglob

. ${DIR}/version.sh
if [ -f ${DIR}/system.sh ] ; then
	. ${DIR}/system.sh
fi
git_bin=$(which git)
#git hard requirements:
#git: --no-edit

git="${git_bin} am"
#git_patchset=""
#git_opts

if [ "${RUN_BISECT}" ] ; then
	git="${git_bin} apply"
fi

echo "Starting patch.sh"

git_add () {
	${git_bin} add .
	${git_bin} commit -a -m 'testing patchset'
}

start_cleanup () {
	git="${git_bin} am --whitespace=fix"
}

cleanup () {
	if [ "${number}" ] ; then
		if [ "x${wdir}" = "x" ] ; then
			${git_bin} format-patch -${number} -o ${DIR}/patches/
		else
			if [ ! -d ${DIR}/patches/${wdir}/ ] ; then
				mkdir -p ${DIR}/patches/${wdir}/
			fi
			${git_bin} format-patch -${number} -o ${DIR}/patches/${wdir}/
			unset wdir
		fi
	fi
	exit 2
}

dir () {
	wdir="$1"
	if [ -d "${DIR}/patches/$wdir" ]; then
		echo "dir: $wdir"

		if [ "x${regenerate}" = "xenable" ] ; then
			start_cleanup
		fi

		number=
		for p in "${DIR}/patches/$wdir/"*.patch; do
			${git} "$p"
			number=$(( $number + 1 ))
		done

		if [ "x${regenerate}" = "xenable" ] ; then
			cleanup
		fi
	fi
	unset wdir
}

cherrypick () {
	if [ ! -d ../patches/${cherrypick_dir} ] ; then
		mkdir -p ../patches/${cherrypick_dir}
	fi
	${git_bin} format-patch -1 ${SHA} --start-number ${num} -o ../patches/${cherrypick_dir}
	num=$(($num+1))
}

external_git () {
	git_tag=""
	echo "pulling: ${git_tag}"
	${git_bin} pull --no-edit ${git_patchset} ${git_tag}
	${git_bin} describe
}

aufs_fail () {
	echo "aufs failed"
	exit 2
}

aufs () {
	#https://github.com/sfjro/aufs-standalone/tree/aufs6.3
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		KERNEL_REL=6.3
		wget https://raw.githubusercontent.com/sfjro/aufs-standalone/aufs${KERNEL_REL}/aufs6-kbuild.patch
		patch -p1 < aufs6-kbuild.patch || aufs_fail
		rm -rf aufs6-kbuild.patch
		${git_bin} add .
		${git_bin} commit -a -m 'merge: aufs-kbuild' -s

		wget https://raw.githubusercontent.com/sfjro/aufs-standalone/aufs${KERNEL_REL}/aufs6-base.patch
		patch -p1 < aufs6-base.patch || aufs_fail
		rm -rf aufs6-base.patch
		${git_bin} add .
		${git_bin} commit -a -m 'merge: aufs-base' -s

		wget https://raw.githubusercontent.com/sfjro/aufs-standalone/aufs${KERNEL_REL}/aufs6-mmap.patch
		patch -p1 < aufs6-mmap.patch || aufs_fail
		rm -rf aufs6-mmap.patch
		${git_bin} add .
		${git_bin} commit -a -m 'merge: aufs-mmap' -s

		wget https://raw.githubusercontent.com/sfjro/aufs-standalone/aufs${KERNEL_REL}/aufs6-standalone.patch
		patch -p1 < aufs6-standalone.patch || aufs_fail
		rm -rf aufs6-standalone.patch
		${git_bin} add .
		${git_bin} commit -a -m 'merge: aufs-standalone' -s

		${git_bin} format-patch -4 -o ../patches/external/aufs/

		cd ../
		if [ -d ./aufs-standalone ] ; then
			rm -rf ./aufs-standalone || true
		fi

		${git_bin} clone -b aufs${KERNEL_REL} https://github.com/sfjro/aufs-standalone --depth=1
		cd ./aufs-standalone/
			aufs_hash=$(git rev-parse HEAD)
		cd -

		cd ./KERNEL/
		KERNEL_REL=6.3

		cp -v ../aufs-standalone/Documentation/ABI/testing/*aufs ./Documentation/ABI/testing/
		mkdir -p ./Documentation/filesystems/aufs/
		cp -rv ../aufs-standalone/Documentation/filesystems/aufs/* ./Documentation/filesystems/aufs/
		mkdir -p ./fs/aufs/
		cp -v ../aufs-standalone/fs/aufs/* ./fs/aufs/
		cp -v ../aufs-standalone/include/uapi/linux/aufs_type.h ./include/uapi/linux/

		${git_bin} add .
		${git_bin} commit -a -m 'merge: aufs' -m "https://github.com/sfjro/aufs-standalone/commit/${aufs_hash}" -s

		${git_bin} format-patch -5 -o ../patches/external/aufs/
		echo "AUFS: https://github.com/sfjro/aufs-standalone/commit/${aufs_hash}" > ../patches/external/git/AUFS

		rm -rf ../aufs-standalone/ || true

		${git_bin} reset --hard HEAD~5

		start_cleanup

		${git} "${DIR}/patches/external/aufs/0001-merge-aufs-kbuild.patch"
		${git} "${DIR}/patches/external/aufs/0002-merge-aufs-base.patch"
		${git} "${DIR}/patches/external/aufs/0003-merge-aufs-mmap.patch"
		${git} "${DIR}/patches/external/aufs/0004-merge-aufs-standalone.patch"
		${git} "${DIR}/patches/external/aufs/0005-merge-aufs.patch"

		wdir="external/aufs"
		number=5
		cleanup
	fi

	dir 'external/aufs'
}

wpanusb () {
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		cd ../
		if [ -d ./wpanusb ] ; then
			rm -rf ./wpanusb || true
		fi

		${git_bin} clone https://git.beagleboard.org/beagleconnect/linux/wpanusb --depth=1
		cd ./wpanusb
			wpanusb_hash=$(git rev-parse HEAD)
		cd -

		cd ./KERNEL/

		cp -v ../wpanusb/wpanusb.h drivers/net/ieee802154/
		cp -v ../wpanusb/wpanusb.c drivers/net/ieee802154/

		${git_bin} add .
		${git_bin} commit -a -m 'merge: wpanusb: https://git.beagleboard.org/beagleconnect/linux/wpanusb' -m "https://git.beagleboard.org/beagleconnect/linux/wpanusb/-/commit/${wpanusb_hash}" -s
		${git_bin} format-patch -1 -o ../patches/wpanusb/
		echo "WPANUSB: https://git.beagleboard.org/beagleconnect/linux/wpanusb/-/commit/${wpanusb_hash}" > ../patches/git/WPANUSB

		rm -rf ../wpanusb/ || true

		${git_bin} reset --hard HEAD~1

		start_cleanup

		${git} "${DIR}/patches/wpanusb/0001-merge-wpanusb-https-git.beagleboard.org-beagleconnec.patch"

		wdir="wpanusb"
		number=1
		cleanup

		exit 2
	fi
	dir 'wpanusb'
}

bcfserial () {
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		cd ../
		if [ -d ./bcfserial ] ; then
			rm -rf ./bcfserial || true
		fi

		${git_bin} clone https://git.beagleboard.org/beagleconnect/linux/bcfserial.git --depth=1
		cd ./bcfserial
			bcfserial_hash=$(git rev-parse HEAD)
		cd -

		cd ./KERNEL/

		cp -v ../bcfserial/bcfserial.c drivers/net/ieee802154/

		${git_bin} add .
		${git_bin} commit -a -m 'merge: bcfserial: https://git.beagleboard.org/beagleconnect/linux/bcfserial.git' -m "https://git.beagleboard.org/beagleconnect/linux/bcfserial/-/commit/${bcfserial_hash}" -s
		${git_bin} format-patch -1 -o ../patches/bcfserial/
		echo "BCFSERIAL: https://git.beagleboard.org/beagleconnect/linux/bcfserial/-/commit/${bcfserial_hash}" > ../patches/git/BCFSERIAL

		rm -rf ../bcfserial/ || true

		${git_bin} reset --hard HEAD~1

		start_cleanup

		${git} "${DIR}/patches/bcfserial/0001-merge-bcfserial-https-git.beagleboard.org-beagleconn.patch"

		wdir="bcfserial"
		number=1
		cleanup

		exit 2
	fi
	dir 'bcfserial'
}

rt_cleanup () {
	echo "rt: needs fixup"
	exit 2
}

rt () {
	rt_patch="${KERNEL_REL}${kernel_rt}"

	#${git_bin} revert --no-edit xyz

	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		wget -c https://www.kernel.org/pub/linux/kernel/projects/rt/${KERNEL_REL}/patch-${rt_patch}.patch.xz
		xzcat patch-${rt_patch}.patch.xz | patch -p1 || rt_cleanup
		rm -f patch-${rt_patch}.patch.xz
		rm -f localversion-rt
		${git_bin} add .
		${git_bin} commit -a -m 'merge: CONFIG_PREEMPT_RT Patch Set' -m "patch-${rt_patch}.patch.xz" -s
		${git_bin} format-patch -1 -o ../patches/external/rt/
		echo "RT: patch-${rt_patch}.patch.xz" > ../patches/external/git/RT

		exit 2
	fi

	dir 'external/rt'
}

wireless_regdb () {
	#https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		cd ../
		if [ -d ./wireless-regdb ] ; then
			rm -rf ./wireless-regdb || true
		fi

		${git_bin} clone git://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git --depth=1
		cd ./wireless-regdb
			wireless_regdb_hash=$(git rev-parse HEAD)
		cd -

		cd ./KERNEL/

		mkdir -p ./firmware/ || true
		cp -v ../wireless-regdb/regulatory.db ./firmware/
		cp -v ../wireless-regdb/regulatory.db.p7s ./firmware/
		${git_bin} add -f ./firmware/regulatory.*
		${git_bin} commit -a -m 'Add wireless-regdb regulatory database file' -m "https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/commit/?id=${wireless_regdb_hash}" -s

		${git_bin} format-patch -1 -o ../patches/external/wireless_regdb/
		echo "WIRELESS_REGDB: https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/commit/?id=${wireless_regdb_hash}" > ../patches/external/git/WIRELESS_REGDB

		rm -rf ../wireless-regdb/ || true

		${git_bin} reset --hard HEAD^

		start_cleanup

		${git} "${DIR}/patches/external/wireless_regdb/0001-Add-wireless-regdb-regulatory-database-file.patch"

		wdir="external/wireless_regdb"
		number=1
		cleanup
	fi

	dir 'external/wireless_regdb'
}

cleanup_dts_builds () {
	rm -rf arch/arm64/boot/dts/ti/modules.order || true
	rm -rf arch/arm64/boot/dts/ti/.*cmd || true
	rm -rf arch/arm64/boot/dts/ti/.*tmp || true
	rm -rf arch/arm64/boot/dts/ti/*dtb || true
	rm -rf arch/arm64/boot/dts/ti/*dtbo || true
}

beagleboard_dtbs () {
	branch="v6.3.x"
	https_repo="https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees.git"
	work_dir="BeagleBoard-DeviceTrees"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		cd ../
		if [ -d ./${work_dir} ] ; then
			rm -rf ./${work_dir} || true
		fi

		${git_bin} clone -b ${branch} ${https_repo} --depth=1
		cd ./${work_dir}
			git_hash=$(git rev-parse HEAD)
		cd -

		cd ./KERNEL/

		cleanup_dts_builds
		rm -rf arch/arm64/boot/dts/ti/overlays/ || true

		mkdir -p arch/arm64/boot/dts/ti/overlays/
		cp -vr ../${work_dir}/src/arm64/* arch/arm64/boot/dts/ti/
		cp -vr ../${work_dir}/include/dt-bindings/* ./include/dt-bindings/

		${git_bin} add -f arch/arm64/boot/dts/ti/
		${git_bin} add -f include/dt-bindings/
		${git_bin} commit -a -m "Add BeagleBoard.org Device Tree Changes" -m "https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees/-/tree/${branch}" -m "https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees/-/commit/${git_hash}" -s
		${git_bin} format-patch -1 -o ../patches/soc/ti/beagleboard_dtbs/
		echo "BBDTBS: https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees/-/commit/${git_hash}" > ../patches/external/git/BBDTBS

		rm -rf ../${work_dir}/ || true

		${git_bin} reset --hard HEAD^

		start_cleanup

		${git} "${DIR}/patches/soc/ti/beagleboard_dtbs/0001-Add-BeagleBoard.org-Device-Tree-Changes.patch"

		wdir="soc/ti/beagleboard_dtbs"
		number=1
		cleanup
	fi

	dir 'soc/ti/beagleboard_dtbs'
}

local_patch () {
	echo "dir: dir"
	${git} "${DIR}/patches/dir/0001-patch.patch"
}

#external_git
aufs
#wpanusb
#bcfserial
#rt
wireless_regdb
beagleboard_dtbs
dir 'next'
#local_patch

pre_backports () {
	echo "dir: backports/${subsystem}"

	cd ~/linux-src/
	${git_bin} pull --no-edit https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git master
	${git_bin} pull --no-edit https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git master --tags
	${git_bin} pull --no-edit https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master --tags
	if [ ! "x${backport_tag}" = "x" ] ; then
		${git_bin} checkout ${backport_tag} -b tmp
	fi
	cd -
}

post_backports () {
	if [ ! "x${backport_tag}" = "x" ] ; then
		cd ~/linux-src/
		${git_bin} checkout master -f ; ${git_bin} branch -D tmp
		cd -
	fi

	rm -f arch/arm/boot/dts/overlays/*.dtbo || true
	${git_bin} add .
	${git_bin} commit -a -m "backports: ${subsystem}: from: linux.git" -m "Reference: ${backport_tag}" -s
	if [ ! -d ../patches/backports/${subsystem}/ ] ; then
		mkdir -p ../patches/backports/${subsystem}/
	fi
	${git_bin} format-patch -1 -o ../patches/backports/${subsystem}/
}

patch_backports (){
	echo "dir: backports/${subsystem}"
	${git} "${DIR}/patches/backports/${subsystem}/0001-backports-${subsystem}-from-linux.git.patch"
}

backports () {
	backport_tag="v5.10.180"

	subsystem="uio"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		pre_backports

		cp -v ~/linux-src/drivers/uio/uio_pruss.c ./drivers/uio/

		post_backports
		exit 2
	else
		patch_backports
		dir 'drivers/ti/uio'
	fi
}

drivers () {
	#https://github.com/raspberrypi/linux/branches
	#exit 2
	#dir 'RPi'
	dir 'soc/ti/pcie'
	dir 'boris'
	dir 'powervr'
}

###
backports
drivers

packaging () {
	#do_backport="enable"
	if [ "x${do_backport}" = "xenable" ] ; then
		backport_tag="v6.3.5"

		subsystem="bindeb-pkg"
		#regenerate="enable"
		if [ "x${regenerate}" = "xenable" ] ; then
			pre_backports

			cp -v ~/linux-src/scripts/package/* ./scripts/package/

			post_backports
			exit 2
		else
			patch_backports
		fi
	fi

	${git} "${DIR}/patches/backports/bindeb-pkg/0002-builddeb-Install-our-dtbs-under-boot-dtbs-version.patch"
}

packaging
echo "patch.sh ran successfully"
#
