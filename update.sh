#!/bin/bash
version=$(cat kernel_version)

sudo mount ${DISK}1 /media/boot/
sudo mount ${DISK}2 /media/rootfs/
sudo tar xfv ./deploy/${version}-modules.tar.gz -C /media/rootfs/
sudo cp -v KERNEL/arch/arm64/boot/dts/apm/apm-mustang.dtb  /media/boot/boot/
sudo cp -v ./deploy/${version}.Image /media/boot/boot/vmlinuz

