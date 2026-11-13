#!/bin/sh

# SPDX-FileCopyrightText: Robert Nelson <robertcnelson@gmail.com>
# SPDX-License-Identifier: MIT

#
ARCH=$(uname -m)

config="defconfig"

build_prefix="-arm64-k3-r"
branch_prefix="v"
branch_postfix=".x-arm64-k3"

#Changes
#https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/process/changes.rst?h=v6.18-rc1
#
#Cross Compilers
#https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/

# Options: arm, arm64, riscv
KERNEL_ARCH=arm64

# Options: 8, 9, 10, 11, 12, 13, 14, 15, 16
toolchain_version="15"

#Wireless:
#https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git
WIRELESS_REGDB="2026-09-03"
#regenerate_wireless_regdb=enable

#Linux Firmware
#https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/?h=main
#https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/?h=20260916
#https://packages.debian.org/source/sid/firmware-nonfree
FIRMWARE_TAG="20260916"
#regenerate_linux_firmware=enable

#Kernel
linux_repo="https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git"
linux_stable_repo="https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux.git"
#
KERNEL_REL=6.18
KERNEL_TAG=${KERNEL_REL}.63
#https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/x.y/
kernel_rt=".X-rtY"
#Kernel Build
BUILD=${build_prefix}66.1

#git branch
BRANCH="${branch_prefix}${KERNEL_REL}${branch_postfix}"

DISTRO=xross

# Patch Updates:
BeagleBoard_DeviceTrees_branch="v6.18.x"
#regenerate_BeagleBoard_DeviceTrees=enable
rpi_backports="rpi-6.18.y"
#regenerate_rpi_backports=enable
uio_backports="v6.6.162"
#regenerate_uio_backports=enable
#
