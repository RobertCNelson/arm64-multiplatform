#!/bin/sh
#
# Copyright (c) 2009-2015 Robert Nelson <robertcnelson@gmail.com>
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

. ${DIR}/version.sh
if [ -f ${DIR}/system.sh ] ; then
	. ${DIR}/system.sh
fi

#Debian 7 (Wheezy): git version 1.7.10.4 and later needs "--no-edit"
unset git_opts
git_no_edit=$(LC_ALL=C git help pull | grep -m 1 -e "--no-edit" || true)
if [ ! "x${git_no_edit}" = "x" ] ; then
	git_opts="--no-edit"
fi

git="git am"
#git_patchset=""
#git_opts

if [ "${RUN_BISECT}" ] ; then
	git="git apply"
fi

echo "Starting patch.sh"

git_add () {
	git add .
	git commit -a -m 'testing patchset'
}

start_cleanup () {
	git="git am --whitespace=fix"
}

cleanup () {
	if [ "${number}" ] ; then
		git format-patch -${number} -o ${DIR}/patches/
	fi
	exit 2
}

pick () {
	if [ ! -d ../patches/${pick_dir} ] ; then
		mkdir -p ../patches/${pick_dir}
	fi
	git format-patch -1 ${SHA} --start-number ${num} -o ../patches/${pick_dir}
	num=$(($num+1))
}

external_git () {
	git_tag=""
	echo "pulling: ${git_tag}"
	git pull ${git_opts} ${git_patchset} ${git_tag}
}

rt_cleanup () {
	echo "rt: needs fixup"
	exit 2
}

rt () {
	echo "dir: rt"
	rt_patch="${KERNEL_REL}${kernel_rt}"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		wget -c https://www.kernel.org/pub/linux/kernel/projects/rt/${KERNEL_REL}/patch-${rt_patch}.patch.xz
		xzcat patch-${rt_patch}.patch.xz | patch -p1 || rt_cleanup
		rm -f patch-${rt_patch}.patch.xz
		rm -f localversion-rt
		git add .
		git commit -a -m 'merge: CONFIG_PREEMPT_RT Patch Set' -s
		git format-patch -1 -o ../patches/rt/

		exit 2
	fi

	${git} "${DIR}/patches/rt/0001-merge-CONFIG_PREEMPT_RT-Patch-Set.patch"
}

local_patch () {
	echo "dir: dir"
	${git} "${DIR}/patches/dir/0001-patch.patch"
}

#external_git
#rt
#local_patch

xgene () {
	echo "dir: xgene"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		start_cleanup
	fi

	${git} "${DIR}/patches/xgene/0001-MAINTAINERS-Add-Applied-Micro-APM-X-Gene-Device-Tree.patch"
	${git} "${DIR}/patches/xgene/0002-Documentation-arm64-add-SCU-dts-binding-documentatio.patch"
	${git} "${DIR}/patches/xgene/0003-arm64-dts-Add-X-Gene-reboot-driver-dts-node.patch"
	${git} "${DIR}/patches/xgene/0004-power-reset-Add-syscon-poweroff-device-node-for-APM-.patch"
	${git} "${DIR}/patches/xgene/0005-arm64-dts-add-APM-Merlin-Board-device-tree.patch"
	${git} "${DIR}/patches/xgene/0006-arm64-dts-Add-X-Gene-v2-reboot-driver-dts-node.patch"
	${git} "${DIR}/patches/xgene/0007-Documentation-arm-pmu-Add-Potenza-PMU-binding.patch"
	${git} "${DIR}/patches/xgene/0008-arm64-dts-Add-PMU-node-for-APM-X-Gene-Storm-SOC.patch"
	${git} "${DIR}/patches/xgene/0009-arm64-dts-Add-APM-X-Gene-2-standby-GPIO-controller-D.patch"
	${git} "${DIR}/patches/xgene/0010-arm64-dts-Add-poweroff-device-nodes-for-APM-X-Gene-2.patch"
	${git} "${DIR}/patches/xgene/0011-arm64-dts-Add-the-arasan-mmc-DTS-entries-for-APM-X-G.patch"
	${git} "${DIR}/patches/xgene/0012-arm64-dts-Add-the-arasan-mmc-DTS-entries-for-APm-X-G.patch"
	${git} "${DIR}/patches/xgene/0013-arm64-dts-X-Gene-Do-not-reset-or-enable-disable-cloc.patch"
	${git} "${DIR}/patches/xgene/0014-arm64-dts-Add-RNG-device-tree-nodes-for-APM-X-Gene-v.patch"
	${git} "${DIR}/patches/xgene/0015-arm64-dts-Add-v2m-MSI-frame-nodes-for-APM-X-Gene-v2-.patch"
	${git} "${DIR}/patches/xgene/0016-arm64-dts-Add-PCIe-node-for-APM-X-Gene-v2-platforms.patch"
	${git} "${DIR}/patches/xgene/0017-arm64-dts-Add-USB-nodes-for-APM-X-Gene-v1-platforms.patch"
	${git} "${DIR}/patches/xgene/0018-arm64-dts-Add-USB-nodes-for-APM-X-Gene-v2-platforms.patch"
	${git} "${DIR}/patches/xgene/0019-arm64-dts-Add-APM-X-Gene-v1-SoC-GFC-GPIO-controller-.patch"
	${git} "${DIR}/patches/xgene/0020-arm64-dts-Add-APM-X-Gene-v2-SoC-GFC-GPIO-controller-.patch"
	${git} "${DIR}/patches/xgene/0021-arm64-dts-Add-Designware-GPIO-dts-binding-for-APM-X-.patch"
	${git} "${DIR}/patches/xgene/0022-arm64-dts-Add-APM-X-Gene-v2-SoC-Designware-GPIO-cont.patch"
	${git} "${DIR}/patches/xgene/0023-arm64-dts-Add-APM-X-Gene-v2-SoC-EDAC-DTS-entries.patch"
	${git} "${DIR}/patches/xgene/0024-arm64-dts-Add-Designware-I2C-controller-DTS-entries-.patch"
	${git} "${DIR}/patches/xgene/0025-arm64-dts-Add-Designware-I2C-controller-DTS-entries-.patch"
	${git} "${DIR}/patches/xgene/0026-arm64-dts-Add-RTC-DTS-entry-for-X-Gene-v2-SoC-platfo.patch"
	${git} "${DIR}/patches/xgene/0027-arm64-dts-Add-L2-cache-topology-for-APM-X-Gene-SoC.patch"

	if [ "x${regenerate}" = "xenable" ] ; then
		number=9
		cleanup
	fi
}

#
xgene

packaging () {
	echo "dir: packaging"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		cp -v "${DIR}/3rdparty/packaging/builddeb" "${DIR}/KERNEL/scripts/package"
		git commit -a -m 'packaging: sync builddeb changes' -s
		git format-patch -1 -o "${DIR}/patches/packaging"
		exit 2
	else
		${git} "${DIR}/patches/packaging/0001-packaging-sync-builddeb-changes.patch"
	fi
}

packaging
echo "patch.sh ran successfully"
