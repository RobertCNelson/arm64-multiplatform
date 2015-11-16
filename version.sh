#!/bin/sh
#
ARCH=$(uname -m)

config="defconfig"

toolchain="gcc_linaro_aarch64_gnu_5"

#Kernel/Build
KERNEL_REL=4.4
KERNEL_TAG=${KERNEL_REL}-rc1
BUILD=aarch64-x0
kernel_rt=".X-rtY"

#v4.X-rcX + upto SHA
#prev_KERNEL_SHA=""
#KERNEL_SHA=""

#git branch
BRANCH="v4.4.x"

DISTRO=cross
DEBARCH=arm64
KERNEL_ARCH=arm64
#
