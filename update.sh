#!/bin/bash

sudo mount ${DISK}1 /media/boot/
sudo mount ${DISK}2 /media/rootfs/
sudo tar xfv ./deploy/4.4.0-rc1-aarch64-x0-modules.tar.gz -C /media/rootfs/
sudo cp -v KERNEL/arch/arm64/boot/dts/apm/apm-mustang.dtb  /media/boot/boot/
sudo cp -v ./deploy/4.4.0-rc1-aarch64-x0.Image /media/boot/boot/vmlinuz

