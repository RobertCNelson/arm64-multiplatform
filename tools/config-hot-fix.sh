#!/bin/sh -e

DIR=$PWD

cd ${DIR}/KERNEL/

# end of BPF subsystem
./scripts/config --enable CONFIG_PREEMPT
./scripts/config --enable CONFIG_PREEMPT_RT
./scripts/config --enable CONFIG_PREEMPT_DYNAMIC

# end of RCU Subsystem
./scripts/config --enable CONFIG_IKCONFIG
./scripts/config --enable CONFIG_IKCONFIG_PROC
./scripts/config --module CONFIG_IKHEADERS
./scripts/config --enable CONFIG_PRINTK_INDEX

#
# Kernel Performance Events And Counters
#
./scripts/config --enable CONFIG_RUST

#
# Platform selection
#
./scripts/config --disable CONFIG_ARCH_SUNXI
./scripts/config --disable CONFIG_ARCH_BCM
./scripts/config --disable CONFIG_ARCH_EXYNOS
./scripts/config --disable CONFIG_ARCH_HISI
./scripts/config --disable CONFIG_ARCH_MEDIATEK
./scripts/config --disable CONFIG_ARCH_MESON
./scripts/config --disable CONFIG_ARCH_MVEBU
./scripts/config --disable CONFIG_ARCH_NXP
./scripts/config --disable CONFIG_ARCH_QCOM
./scripts/config --disable CONFIG_ARCH_RENESAS
./scripts/config --disable CONFIG_ARCH_ROCKCHIP
./scripts/config --disable CONFIG_ARCH_SEATTLE
./scripts/config --disable CONFIG_ARCH_SYNQUACER
./scripts/config --disable CONFIG_ARCH_TEGRA
./scripts/config --disable CONFIG_ARCH_THUNDER
./scripts/config --disable CONFIG_ARCH_THUNDER2
./scripts/config --disable CONFIG_ARCH_VEXPRESS
./scripts/config --disable CONFIG_ARCH_XGENE
./scripts/config --disable CONFIG_ARCH_ZYNQMP

#
# ARM errata workarounds via the alternatives framework
#
./scripts/config --disable CONFIG_AMPERE_ERRATUM_AC03_CPU_38
./scripts/config --disable CONFIG_AMPERE_ERRATUM_AC04_CPU_23
./scripts/config --disable CONFIG_CAVIUM_ERRATUM_22375
./scripts/config --disable CONFIG_CAVIUM_ERRATUM_23154
./scripts/config --disable CONFIG_CAVIUM_ERRATUM_27456
./scripts/config --disable CONFIG_CAVIUM_ERRATUM_30115
./scripts/config --disable CONFIG_CAVIUM_TX2_ERRATUM_219
./scripts/config --disable CONFIG_FUJITSU_ERRATUM_010001
./scripts/config --disable CONFIG_HISILICON_ERRATUM_161600802
./scripts/config --disable CONFIG_HISILICON_ERRATUM_162100801
./scripts/config --disable CONFIG_QCOM_FALKOR_ERRATUM_1003
./scripts/config --disable CONFIG_QCOM_FALKOR_ERRATUM_1009
./scripts/config --disable CONFIG_QCOM_QDF2400_ERRATUM_0065
./scripts/config --disable CONFIG_QCOM_FALKOR_ERRATUM_E1041
./scripts/config --disable CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
./scripts/config --disable CONFIG_ROCKCHIP_ERRATUM_3568002
./scripts/config --disable CONFIG_ROCKCHIP_ERRATUM_3588001
./scripts/config --disable CONFIG_SOCIONEXT_SYNQUACER_PREITS

./scripts/config --disable CONFIG_ARM64_ERRATUM_832075
./scripts/config --disable CONFIG_ARM64_ERRATUM_1024718
./scripts/config --disable CONFIG_ARM64_ERRATUM_1418040
./scripts/config --disable CONFIG_ARM64_ERRATUM_1165522
./scripts/config --disable CONFIG_ARM64_ERRATUM_1530923
./scripts/config --disable CONFIG_ARM64_ERRATUM_1463225
./scripts/config --disable CONFIG_ARM64_ERRATUM_1508412
./scripts/config --disable CONFIG_ARM64_ERRATUM_2051678
./scripts/config --disable CONFIG_ARM64_ERRATUM_2077057
./scripts/config --disable CONFIG_ARM64_ERRATUM_2658417
./scripts/config --disable CONFIG_ARM64_ERRATUM_2054223
./scripts/config --disable CONFIG_ARM64_ERRATUM_2067961
./scripts/config --disable CONFIG_ARM64_ERRATUM_2645198
./scripts/config --disable CONFIG_ARM64_ERRATUM_3194386

# end of ARM errata workarounds via the alternatives framework
./scripts/config --enable CONFIG_ARM64_VA_BITS_48
./scripts/config --disable CONFIG_ARM64_VA_BITS_52

./scripts/config --set-val CONFIG_NR_CPUS 256
./scripts/config --disable CONFIG_NUMA
./scripts/config --disable CONFIG_XEN

#
# Power management options
#
./scripts/config --enable CONFIG_PM_AUTOSLEEP
./scripts/config --enable CONFIG_PM_WAKELOCKS

#
# CPU Frequency scaling
#
./scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
./scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL

#
# CPU frequency scaling drivers
#
./scripts/config --module CONFIG_CPUFREQ_DT_RUST

# end of General architecture-dependent options
./scripts/config --disable CONFIG_MODVERSIONS
./scripts/config --disable CONFIG_MODULE_SIG
./scripts/config --disable CONFIG_MODULE_DECOMPRESS
./scripts/config --enable CONFIG_BLK_CGROUP_IOPRIO

#
# Networking options
#
./scripts/config --enable CONFIG_IP_PNP
./scripts/config --enable CONFIG_IP_PNP_DHCP
./scripts/config --enable CONFIG_IP_PNP_BOOTP
./scripts/config --enable CONFIG_IP_PNP_RARP
./scripts/config --enable CONFIG_NET_IP_TUNNEL
./scripts/config --enable CONFIG_NET_UDP_TUNNEL

#
# Core Netfilter Configuration
#
./scripts/config --enable CONFIG_NETFILTER_XTABLES
./scripts/config --enable CONFIG_NETFILTER_XTABLES_COMPAT

#
# IP: Netfilter Configuration
#
./scripts/config --enable CONFIG_IP_NF_IPTABLES

./scripts/config --disable CONFIG_NET_DSA

#
# Classification
#
./scripts/config --enable CONFIG_NET_CLS_CGROUP
./scripts/config --enable CONFIG_DNS_RESOLVER

#
# Bluetooth device drivers
#
./scripts/config --disable CONFIG_BT_HCIBTUSB_AUTOSUSPEND

# end of Bluetooth device drivers
./scripts/config --disable CONFIG_CFG80211_DEFAULT_PS
./scripts/config --enable CONFIG_RFKILL
./scripts/config --enable CONFIG_RFKILL_GPIO

#
# Device Drivers
#
./scripts/config --disable CONFIG_PCI_DOE
./scripts/config --disable CONFIG_PCI_P2PDMA
./scripts/config --disable CONFIG_PCI_HYPERV
./scripts/config --disable CONFIG_HOTPLUG_PCI_ACPI_IBM
./scripts/config --disable CONFIG_HOTPLUG_PCI_CPCI
./scripts/config --disable CONFIG_HOTPLUG_PCI_SHPC

#
# PCI controller drivers
#
./scripts/config --disable CONFIG_PCI_HOST_THUNDER_PEM
./scripts/config --disable CONFIG_PCI_HOST_THUNDER_ECAM
./scripts/config --disable CONFIG_PCI_HYPERV_INTERFACE
./scripts/config --disable CONFIG_PCI_XGENE

#
# DesignWare-based PCIe controllers
#
./scripts/config --disable CONFIG_PCI_MESON
./scripts/config --disable CONFIG_PCI_HISI
./scripts/config --disable CONFIG_PCIE_KIRIN
./scripts/config --enable CONFIG_PCI_KEYSTONE
./scripts/config --enable CONFIG_PCI_KEYSTONE_HOST

#
# PCI Endpoint
#
./scripts/config --enable CONFIG_PCI_ENDPOINT_CONFIGFS
./scripts/config --module CONFIG_PCI_EPF_TEST
./scripts/config --module CONFIG_PCI_EPF_NTB
./scripts/config --module CONFIG_PCI_EPF_VNTB

#
# PCI switch controller drivers
#
./scripts/config --disable CONFIG_CXL_BUS

#
# Generic Driver Options
#
./scripts/config --enable CONFIG_DEVTMPFS_MOUNT

#
# Firmware loader
#
./scripts/config --enable CONFIG_FW_LOADER_SYSFS
./scripts/config --set-str CONFIG_EXTRA_FIRMWARE "regulatory.db regulatory.db.p7s cadence/mhdp8546.bin"
./scripts/config --set-str CONFIG_EXTRA_FIRMWARE_DIR "firmware"
./scripts/config --enable CONFIG_FW_LOADER_USER_HELPER
./scripts/config --disable CONFIG_FW_LOADER_USER_HELPER_FALLBACK
./scripts/config --enable CONFIG_FW_UPLOAD

#
# Bus devices
#
./scripts/config --disable CONFIG_VEXPRESS_CONFIG

#
# ARM SCMI NXP i.MX Vendor Protocols
#
./scripts/config --disable CONFIG_IMX_SCMI_BBM_EXT

# end of ARM System Control and Management Interface Protocol
./scripts/config --disable CONFIG_GOOGLE_FIRMWARE

# end of Firmware Drivers
./scripts/config --module CONFIG_FWCTL

# end of LPDDR & LPDDR2 PCM memory drivers
./scripts/config --enable CONFIG_OF_OVERLAY
./scripts/config --disable CONFIG_PARPORT
./scripts/config --enable CONFIG_ZRAM_BACKEND_LZO

#
# NVME Support
#
./scripts/config --enable CONFIG_NVME_KEYRING
./scripts/config --enable CONFIG_NVME_AUTH
./scripts/config --enable CONFIG_NVME_CORE
./scripts/config --enable CONFIG_BLK_DEV_NVME
./scripts/config --enable CONFIG_NVME_TARGET_PCI_EPF

#
# Misc devices
#
./scripts/config --enable CONFIG_RPMB
./scripts/config --disable CONFIG_ENCLOSURE_SERVICES
./scripts/config --module CONFIG_PCI_ENDPOINT_TEST
./scripts/config --module CONFIG_NTSYNC
./scripts/config --module CONFIG_NSM
./scripts/config --enable CONFIG_MSPM0_I2C
./scripts/config --disable CONFIG_C2PORT

#
# EEPROM support
#
./scripts/config --module CONFIG_EEPROM_93XX46

# end of EEPROM support
./scripts/config --disable CONFIG_CB710_CORE
./scripts/config --disable CONFIG_SENSORS_LIS3_I2C
./scripts/config --disable CONFIG_ALTERA_STAPL
./scripts/config --disable CONFIG_MISC_RTSX_USB

#
# SCSI device support
#
./scripts/config --disable CONFIG_SCSI

#
# SCSI support type (disk, tape, CD-ROM)
#
./scripts/config --enable CONFIG_BLK_DEV_SD

# end of SCSI Transports
./scripts/config --disable CONFIG_SCSI_CXGB3_ISCSI
./scripts/config --disable CONFIG_SCSI_CXGB4_ISCSI
./scripts/config --disable CONFIG_SCSI_BNX2_ISCSI
./scripts/config --disable CONFIG_BE2ISCSI
./scripts/config --disable CONFIG_BLK_DEV_3W_XXXX_RAID
./scripts/config --disable CONFIG_SCSI_HPSA
./scripts/config --disable CONFIG_SCSI_3W_9XXX
./scripts/config --disable CONFIG_SCSI_3W_SAS
./scripts/config --disable CONFIG_SCSI_ACARD
./scripts/config --disable CONFIG_SCSI_AACRAID
./scripts/config --disable CONFIG_SCSI_AIC7XXX
./scripts/config --disable CONFIG_SCSI_AIC79XX
./scripts/config --disable CONFIG_SCSI_AIC94XX
./scripts/config --disable CONFIG_SCSI_HISI_SAS
./scripts/config --disable CONFIG_SCSI_MVSAS
./scripts/config --disable CONFIG_SCSI_MVUMI
./scripts/config --disable CONFIG_SCSI_ADVANSYS
./scripts/config --disable CONFIG_SCSI_ESAS2R
./scripts/config --disable CONFIG_MEGARAID_SAS
./scripts/config --disable CONFIG_SCSI_MPT3SAS
./scripts/config --disable CONFIG_SCSI_MPT2SAS
./scripts/config --disable CONFIG_SCSI_MPI3MR
./scripts/config --disable CONFIG_SCSI_SMARTPQI
./scripts/config --disable CONFIG_SCSI_HPTIOP
./scripts/config --disable CONFIG_HYPERV_STORAGE
./scripts/config --disable CONFIG_LIBFC
./scripts/config --disable CONFIG_SCSI_SNIC
./scripts/config --disable CONFIG_SCSI_DMX3191D
./scripts/config --disable CONFIG_SCSI_STEX
./scripts/config --disable CONFIG_SCSI_SYM53C8XX_2
./scripts/config --disable CONFIG_SCSI_QLA_FC
./scripts/config --disable CONFIG_SCSI_QLA_ISCSI
./scripts/config --disable CONFIG_QEDI
./scripts/config --disable CONFIG_SCSI_LPFC
./scripts/config --disable CONFIG_SCSI_WD719X
./scripts/config --disable CONFIG_SCSI_PMCRAID
./scripts/config --disable CONFIG_SCSI_PM8001
./scripts/config --disable CONFIG_SCSI_BFA_FC
./scripts/config --disable CONFIG_SCSI_VIRTIO
./scripts/config --disable CONFIG_SCSI_CHELSIO_FCOE
./scripts/config --disable CONFIG_SCSI_DH

# end of SCSI device support
./scripts/config --disable CONFIG_ATA

./scripts/config --disable CONFIG_MD_RAID456
./scripts/config --disable CONFIG_DM_CLONE
./scripts/config --disable CONFIG_DM_RAID

./scripts/config --enable CONFIG_MII
./scripts/config --enable CONFIG_IPVLAN
./scripts/config --enable CONFIG_VXLAN

./scripts/config --disable CONFIG_NETKIT
./scripts/config --disable CONFIG_MHI_NET

./scripts/config --disable CONFIG_ATM_DRIVERS
./scripts/config --disable CONFIG_ATM_DUMMY

./scripts/config --disable CONFIG_NET_VENDOR_3COM
./scripts/config --disable CONFIG_NET_VENDOR_ADAPTEC
./scripts/config --disable CONFIG_NET_VENDOR_AGERE
./scripts/config --disable CONFIG_NET_VENDOR_ALACRITECH
./scripts/config --disable CONFIG_NET_VENDOR_ALTEON
./scripts/config --disable CONFIG_NET_VENDOR_AMAZON
./scripts/config --disable CONFIG_NET_VENDOR_AMD
./scripts/config --disable CONFIG_NET_VENDOR_AQUANTIA
./scripts/config --disable CONFIG_NET_VENDOR_ARC
./scripts/config --disable CONFIG_NET_VENDOR_ASIX
./scripts/config --disable CONFIG_NET_VENDOR_ATHEROS
./scripts/config --disable CONFIG_NET_VENDOR_BROADCOM
./scripts/config --disable CONFIG_NET_VENDOR_CADENCE
./scripts/config --disable CONFIG_NET_VENDOR_CAVIUM
./scripts/config --disable CONFIG_NET_VENDOR_CHELSIO
./scripts/config --disable CONFIG_NET_VENDOR_CISCO
./scripts/config --disable CONFIG_NET_VENDOR_CORTINA
./scripts/config --disable CONFIG_NET_VENDOR_DAVICOM
./scripts/config --disable CONFIG_NET_VENDOR_DEC
./scripts/config --disable CONFIG_NET_VENDOR_DLINK
./scripts/config --disable CONFIG_NET_VENDOR_EMULEX
./scripts/config --disable CONFIG_NET_VENDOR_ENGLEDER
./scripts/config --disable CONFIG_NET_VENDOR_EZCHIP
./scripts/config --disable CONFIG_NET_VENDOR_FUNGIBLE
./scripts/config --disable CONFIG_NET_VENDOR_GOOGLE
./scripts/config --disable CONFIG_NET_VENDOR_HISILICON
./scripts/config --disable CONFIG_NET_VENDOR_HUAWEI
./scripts/config --disable CONFIG_NET_VENDOR_I825XX
./scripts/config --disable CONFIG_NET_VENDOR_INTEL
./scripts/config --disable CONFIG_JME
./scripts/config --disable CONFIG_NET_VENDOR_ADI
./scripts/config --disable CONFIG_NET_VENDOR_LITEX
./scripts/config --disable CONFIG_NET_VENDOR_MARVELL
./scripts/config --disable CONFIG_NET_VENDOR_MELLANOX
./scripts/config --disable CONFIG_NET_VENDOR_META
./scripts/config --disable CONFIG_NET_VENDOR_MICREL
./scripts/config --disable CONFIG_NET_VENDOR_MICROCHIP
./scripts/config --disable CONFIG_NET_VENDOR_MICROSEMI
./scripts/config --disable CONFIG_NET_VENDOR_MICROSOFT
./scripts/config --disable CONFIG_NET_VENDOR_MYRI
./scripts/config --disable CONFIG_NET_VENDOR_NI
./scripts/config --disable CONFIG_NET_VENDOR_NATSEMI
./scripts/config --disable CONFIG_NET_VENDOR_NETERION
./scripts/config --disable CONFIG_NET_VENDOR_NETRONOME
./scripts/config --disable CONFIG_NET_VENDOR_8390
./scripts/config --disable CONFIG_NET_VENDOR_NVIDIA
./scripts/config --disable CONFIG_NET_VENDOR_OKI
./scripts/config --disable CONFIG_NET_VENDOR_PACKET_ENGINES
./scripts/config --disable CONFIG_NET_VENDOR_PENSANDO
./scripts/config --disable CONFIG_NET_VENDOR_QLOGIC
./scripts/config --disable CONFIG_NET_VENDOR_BROCADE
./scripts/config --disable CONFIG_NET_VENDOR_QUALCOMM
./scripts/config --disable CONFIG_NET_VENDOR_RDC
./scripts/config --disable CONFIG_NET_VENDOR_REALTEK
./scripts/config --disable CONFIG_NET_VENDOR_RENESAS
./scripts/config --disable CONFIG_NET_VENDOR_ROCKER
./scripts/config --disable CONFIG_NET_VENDOR_SAMSUNG
./scripts/config --disable CONFIG_NET_VENDOR_SILAN
./scripts/config --disable CONFIG_NET_VENDOR_SIS
./scripts/config --disable CONFIG_NET_VENDOR_SOLARFLARE
./scripts/config --disable CONFIG_NET_VENDOR_SMSC
./scripts/config --disable CONFIG_NET_VENDOR_SOCIONEXT
./scripts/config --disable CONFIG_NET_VENDOR_STMICRO
./scripts/config --disable CONFIG_NET_VENDOR_SUN
./scripts/config --disable CONFIG_NET_VENDOR_SYNOPSYS
./scripts/config --disable CONFIG_NET_VENDOR_TEHUTI
./scripts/config --disable CONFIG_NET_VENDOR_VERTEXCOM
./scripts/config --disable CONFIG_NET_VENDOR_VIA
./scripts/config --disable CONFIG_NET_VENDOR_WANGXUN
./scripts/config --disable CONFIG_VIA_VELOCITY
./scripts/config --disable CONFIG_NET_VENDOR_XILINX

./scripts/config --enable CONFIG_NET_VENDOR_TI
./scripts/config --enable CONFIG_TI_DAVINCI_MDIO
./scripts/config --enable CONFIG_TI_K3_CPPI_DESC_POOL
./scripts/config --enable CONFIG_TI_K3_AM65_CPSW_NUSS
./scripts/config --enable CONFIG_TI_K3_AM65_CPSW_SWITCHDEV
./scripts/config --enable CONFIG_TI_K3_AM65_CPTS

./scripts/config --module CONFIG_WIZNET_W5100
./scripts/config --enable CONFIG_WIZNET_BUS_ANY
./scripts/config --module CONFIG_WIZNET_W5100_SPI

./scripts/config --enable CONFIG_PHYLINK
./scripts/config --enable CONFIG_PHYLIB
./scripts/config --enable CONFIG_FIXED_PHY
./scripts/config --disable CONFIG_SFP

#
# MII PHY device drivers
#

./scripts/config --disable CONFIG_AMD_PHY
./scripts/config --disable CONFIG_ADIN_PHY

./scripts/config --disable CONFIG_BROADCOM_PHY
./scripts/config --disable CONFIG_BCM54140_PHY
./scripts/config --disable CONFIG_BCM7XXX_PHY
./scripts/config --disable CONFIG_BCM87XX_PHY
./scripts/config --disable CONFIG_BCM_NET_PHYLIB
./scripts/config --disable CONFIG_BCM_NET_PHYPTP
./scripts/config --disable CONFIG_CICADA_PHY
./scripts/config --disable CONFIG_CORTINA_PHY
./scripts/config --disable CONFIG_DAVICOM_PHY
./scripts/config --disable CONFIG_ICPLUS_PHY
./scripts/config --disable CONFIG_LXT_PHY

./scripts/config --disable CONFIG_LSI_ET1011C_PHY
./scripts/config --disable CONFIG_MARVELL_PHY
./scripts/config --disable CONFIG_MARVELL_10G_PHY
./scripts/config --disable CONFIG_MEDIATEK_GE_PHY
./scripts/config --disable CONFIG_MOTORCOMM_PHY
./scripts/config --disable CONFIG_NATIONAL_PHY
./scripts/config --disable CONFIG_QSEMI_PHY
./scripts/config --disable CONFIG_RENESAS_PHY
./scripts/config --disable CONFIG_ROCKCHIP_PHY
./scripts/config --disable CONFIG_VITESSE_PHY

./scripts/config --enable CONFIG_REALTEK_PHY
./scripts/config --enable CONFIG_DP83867_PHY

./scripts/config --disable CONFIG_CAN_VCAN
./scripts/config --disable CONFIG_CAN_VXCAN
./scripts/config --disable CONFIG_CAN_CAN327
./scripts/config --disable CONFIG_CAN_SLCAN
./scripts/config --disable CONFIG_CAN_C_CAN
./scripts/config --disable CONFIG_CAN_M_CAN
./scripts/config --disable CONFIG_CAN_PEAK_PCIEFD
./scripts/config --disable CONFIG_CAN_SJA1000
./scripts/config --disable CONFIG_CAN_SOFTING

# end of CAN USB interfaces
./scripts/config --disable CONFIG_MDIO_CAVIUM
./scripts/config --disable CONFIG_MDIO_BCM_UNIMAC
./scripts/config --enable CONFIG_MDIO_GPIO
./scripts/config --disable CONFIG_MDIO_HISI_FEMAC
./scripts/config --disable CONFIG_MDIO_THUNDER

#
# MDIO Multiplexers
#
./scripts/config --enable CONFIG_MDIO_BUS_MUX
./scripts/config --enable CONFIG_MDIO_BUS_MUX_GPIO
./scripts/config --enable CONFIG_MDIO_BUS_MUX_MULTIPLEXER
./scripts/config --enable CONFIG_MDIO_BUS_MUX_MMIOREG

#
# PCS device drivers
#
./scripts/config --disable CONFIG_PCS_XPCS

./scripts/config --module CONFIG_ATH12K

./scripts/config --disable CONFIG_B43
./scripts/config --disable CONFIG_B43LEGACY
./scripts/config --disable CONFIG_BRCMSMAC
./scripts/config --disable CONFIG_BRCMFMAC_SDIO
scripts/config --module CONFIG_LIBERTAS_SPI
./scripts/config --disable CONFIG_LIBERTAS_SDIO

./scripts/config --disable CONFIG_MWIFIEX_SDIO
./scripts/config --module CONFIG_MWIFIEX_USB

./scripts/config --module CONFIG_MT7603E
./scripts/config --module CONFIG_MT7921S

./scripts/config --module CONFIG_WILC1000_SDIO
./scripts/config --module CONFIG_WILC1000_SPI

./scripts/config --module CONFIG_RTL8192DU

./scripts/config --disable CONFIG_RTW88_SDIO
./scripts/config --disable CONFIG_RTW88_8822BS
./scripts/config --disable CONFIG_RTW88_8822CS
./scripts/config --disable CONFIG_RTW88_8723DS
./scripts/config --disable CONFIG_RTW88_8723CS
./scripts/config --disable CONFIG_RTW88_8821CS

./scripts/config --module CONFIG_RTW88_8821AU
./scripts/config --module CONFIG_RTW88_8812AU
./scripts/config --module CONFIG_RTW88_8814AE
./scripts/config --module CONFIG_RTW88_8814AU

./scripts/config --module CONFIG_RTW89_8851BE
./scripts/config --module CONFIG_RTW89_8852BTE

./scripts/config --module CONFIG_WFX

./scripts/config --disable CONFIG_MAC80211_HWSIM
./scripts/config --disable CONFIG_IEEE802154_FAKELB

#
# Wireless WAN
#
./scripts/config --disable CONFIG_WWAN

#
# Userland interfaces
#
./scripts/config --disable CONFIG_INPUT_MOUSEDEV

./scripts/config --disable CONFIG_KEYBOARD_ATKBD
./scripts/config --disable CONFIG_KEYBOARD_OPENCORES
./scripts/config --disable CONFIG_KEYBOARD_OMAP4
./scripts/config --disable CONFIG_MOUSE_PS2

./scripts/config --module CONFIG_TOUCHSCREEN_AR1021_I2C
./scripts/config --module CONFIG_TOUCHSCREEN_ILI210X

./scripts/config --module CONFIG_INPUT_AD714X
./scripts/config --module CONFIG_INPUT_AD714X_I2C
./scripts/config --module CONFIG_INPUT_AD714X_SPI

./scripts/config --module CONFIG_INPUT_GPIO_BEEPER
./scripts/config --module CONFIG_INPUT_GPIO_DECODER

./scripts/config --module CONFIG_INPUT_PWM_BEEPER

#
# Hardware I/O ports
#
./scripts/config --disable CONFIG_SERIO_LIBPS2
./scripts/config --disable CONFIG_SERIO_ALTERA_PS2

#
# Serial drivers
#
./scripts/config --enable CONFIG_SERIAL_8250_DEPRECATED_OPTIONS
./scripts/config --disable CONFIG_SERIAL_8250_EXAR
./scripts/config --set-val CONFIG_SERIAL_8250_NR_UARTS 10
./scripts/config --set-val CONFIG_SERIAL_8250_RUNTIME_UARTS 10
./scripts/config --disable CONFIG_SERIAL_8250_FSL
./scripts/config --disable CONFIG_SERIAL_8250_DW

./scripts/config --enable CONFIG_SERIAL_8250_OMAP
./scripts/config --enable CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP

#
# Non-8250 serial port support
#
./scripts/config --disable CONFIG_SERIAL_AMBA_PL010
./scripts/config --disable CONFIG_SERIAL_AMBA_PL011
./scripts/config --module CONFIG_SERIAL_MAX3100
./scripts/config --module CONFIG_SERIAL_MAX310X
./scripts/config --disable CONFIG_SERIAL_XILINX_PS_UART
./scripts/config --disable CONFIG_SERIAL_RP2
./scripts/config --disable CONFIG_SERIAL_FSL_LPUART

# end of Serial drivers
./scripts/config --module CONFIG_RPMSG_TTY
./scripts/config --disable CONFIG_IPMI_HANDLER
./scripts/config --enable CONFIG_HW_RANDOM_OMAP

#
# I2C support
#
./scripts/config --enable CONFIG_I2C_CHARDEV
./scripts/config --enable CONFIG_I2C_MUX

#
# Multiplexer I2C Chip support
#
./scripts/config --enable CONFIG_I2C_MUX_GPIO
./scripts/config --enable CONFIG_I2C_MUX_PINCTRL

#
# PC SMBus host controller drivers
#
./scripts/config --disable CONFIG_I2C_ISCH

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
./scripts/config --disable CONFIG_I2C_DESIGNWARE_CORE
./scripts/config --enable CONFIG_I2C_GPIO
./scripts/config --disable CONFIG_I2C_OCORES
./scripts/config --enable CONFIG_I2C_OMAP
./scripts/config --disable CONFIG_I2C_PCA_PLATFORM
./scripts/config --disable CONFIG_I2C_RK3X
./scripts/config --disable CONFIG_I2C_SIMTEC
./scripts/config --disable CONFIG_I2C_THUNDERX

# end of I2C Hardware Bus support
./scripts/config --enable CONFIG_I2C_SLAVE_EEPROM

#
# SPI Master Controller Drivers
#
./scripts/config --enable CONFIG_SPI_BITBANG
./scripts/config --disable CONFIG_SPI_CADENCE_QUADSPI
./scripts/config --enable CONFIG_SPI_GPIO
./scripts/config --enable CONFIG_SPI_OMAP24XX
./scripts/config --disable CONFIG_SPI_THUNDERX

#
# SPI Protocol Masters
#
./scripts/config --module CONFIG_SPI_SPIDEV
./scripts/config --enable CONFIG_SPI_SLAVE
./scripts/config --module CONFIG_SPI_SLAVE_TIME
./scripts/config --module CONFIG_SPI_SLAVE_SYSTEM_CONTROL

#
# SPI Offload triggers
#
./scripts/config --module CONFIG_SPI_OFFLOAD_TRIGGER_PWM
./scripts/config --disable CONFIG_SPMI

#
# PPS clients support
#
./scripts/config --module CONFIG_PPS_GENERATOR

# end of PTP clock support
./scripts/config --disable CONFIG_PINCTRL_AMD
./scripts/config --module CONFIG_PINCTRL_MCP23S08_I2C
./scripts/config --module CONFIG_PINCTRL_MCP23S08_SPI
./scripts/config --module CONFIG_PINCTRL_MCP23S08

#
# Memory mapped GPIO drivers
#
./scripts/config --disable CONFIG_GPIO_MB86S7X
./scripts/config --enable CONFIG_GPIO_SYSCON

#
# I2C GPIO expanders
#
./scripts/config --module CONFIG_GPIO_ADNP
./scripts/config --module CONFIG_GPIO_MAX7300
./scripts/config --module CONFIG_GPIO_MAX732X
./scripts/config --module CONFIG_GPIO_PCA9570
./scripts/config --module CONFIG_GPIO_PCF857X
./scripts/config --module CONFIG_GPIO_TPIC2810

#
# SPI GPIO expanders
#
./scripts/config --module CONFIG_GPIO_74X164
./scripts/config --module CONFIG_GPIO_MAX3191X
./scripts/config --module CONFIG_GPIO_MAX7301
./scripts/config --module CONFIG_GPIO_MC33880
./scripts/config --module CONFIG_GPIO_PISOSR
./scripts/config --module CONFIG_GPIO_XRA1403

#
# USB GPIO expanders
#
./scripts/config --disable CONFIG_GPIO_MPSSE
./scripts/config --disable CONFIG_GPIO_PCI_IDIO_16
./scripts/config --disable CONFIG_GPIO_PCIE_IDIO_24

#
# Virtual GPIO drivers
#
./scripts/config --enable CONFIG_GPIO_AGGREGATOR

# end of GPIO Debugging utilities
./scripts/config --enable CONFIG_W1

#
# 1-wire Slaves
#
./scripts/config --module CONFIG_W1_SLAVE_DS2430
./scripts/config --enable CONFIG_W1_SLAVE_DS2433_CRC
./scripts/config --module CONFIG_W1_SLAVE_DS250X

# end of 1-wire Slaves
./scripts/config --enable CONFIG_POWER_RESET_GPIO
./scripts/config --enable CONFIG_POWER_RESET_GPIO_RESTART
./scripts/config --enable CONFIG_POWER_RESET_RESTART
./scripts/config --module CONFIG_POWER_SEQUENCING
./scripts/config --module CONFIG_GENERIC_ADC_BATTERY
./scripts/config --module CONFIG_CHARGER_BQ2415X
./scripts/config --disable CONFIG_POWER_RESET_XGENE

#
# Native drivers
#
./scripts/config --module CONFIG_SENSORS_AD7314
./scripts/config --module CONFIG_SENSORS_ADM1025
./scripts/config --module CONFIG_SENSORS_ADM1026
./scripts/config --module CONFIG_SENSORS_ADM1031
./scripts/config --module CONFIG_SENSORS_ADM1177
./scripts/config --module CONFIG_SENSORS_ADT7X10
./scripts/config --module CONFIG_SENSORS_ADT7310
./scripts/config --module CONFIG_SENSORS_ADT7410
./scripts/config --module CONFIG_SENSORS_AHT10
./scripts/config --module CONFIG_SENSORS_AQUACOMPUTER_D5NEXT
./scripts/config --module CONFIG_SENSORS_AXI_FAN_CONTROL
./scripts/config --module CONFIG_SENSORS_CORSAIR_CPRO
./scripts/config --module CONFIG_SENSORS_CORSAIR_PSU
./scripts/config --module CONFIG_SENSORS_AS370
./scripts/config --module CONFIG_SENSORS_DS1621
./scripts/config --module CONFIG_SENSORS_F71805F
./scripts/config --module CONFIG_SENSORS_GL518SM
./scripts/config --module CONFIG_SENSORS_GL520SM
./scripts/config --enable CONFIG_SENSORS_GPIO_FAN
./scripts/config --module CONFIG_SENSORS_HIH6130
./scripts/config --module CONFIG_SENSORS_HTU31
./scripts/config --module CONFIG_SENSORS_ISL28022
./scripts/config --module CONFIG_SENSORS_IT87
./scripts/config --module CONFIG_SENSORS_POWR1220
./scripts/config --module CONFIG_SENSORS_LTC2945
./scripts/config --module CONFIG_SENSORS_LTC2947
./scripts/config --module CONFIG_SENSORS_LTC2947_I2C
./scripts/config --module CONFIG_SENSORS_LTC2947_SPI
./scripts/config --module CONFIG_SENSORS_LTC2990
./scripts/config --module CONFIG_SENSORS_LTC2992
./scripts/config --module CONFIG_SENSORS_LTC4222
./scripts/config --module CONFIG_SENSORS_LTC4260
./scripts/config --module CONFIG_SENSORS_MAX127
./scripts/config --module CONFIG_SENSORS_MAX1619
./scripts/config --module CONFIG_SENSORS_MAX197
./scripts/config --module CONFIG_SENSORS_MAX31722
./scripts/config --module CONFIG_SENSORS_MAX31730
./scripts/config --module CONFIG_SENSORS_MAX31760
./scripts/config --module CONFIG_SENSORS_MAX6620
./scripts/config --module CONFIG_SENSORS_MAX6621
./scripts/config --module CONFIG_SENSORS_MAX6697
./scripts/config --module CONFIG_SENSORS_MAX31790
./scripts/config --module CONFIG_SENSORS_MC34VR500
./scripts/config --module CONFIG_SENSORS_MCP3021
./scripts/config --module CONFIG_SENSORS_TC654
./scripts/config --module CONFIG_SENSORS_TPS23861
./scripts/config --module CONFIG_SENSORS_MR75203
./scripts/config --module CONFIG_SENSORS_LM63
./scripts/config --module CONFIG_SENSORS_LM77
./scripts/config --module CONFIG_SENSORS_LM78
./scripts/config --module CONFIG_SENSORS_LM80
./scripts/config --module CONFIG_SENSORS_LM83
./scripts/config --module CONFIG_SENSORS_LM85
./scripts/config --module CONFIG_SENSORS_LM87
./scripts/config --module CONFIG_SENSORS_LM92
./scripts/config --module CONFIG_SENSORS_LM95234
./scripts/config --module CONFIG_SENSORS_PC87360
./scripts/config --module CONFIG_SENSORS_NCT6775_CORE
./scripts/config --module CONFIG_SENSORS_NCT6775_I2C
./scripts/config --module CONFIG_SENSORS_NCT7363
./scripts/config --module CONFIG_SENSORS_NZXT_KRAKEN2
./scripts/config --module CONFIG_SENSORS_NZXT_KRAKEN3
./scripts/config --module CONFIG_SENSORS_NZXT_SMART2
./scripts/config --module CONFIG_SENSORS_OCC_P8_I2C
./scripts/config --module CONFIG_SENSORS_PCF8591
./scripts/config --module CONFIG_SENSORS_ACBEL_FSG032
./scripts/config --module CONFIG_SENSORS_ADM1266
./scripts/config --module CONFIG_SENSORS_ADM1275
./scripts/config --module CONFIG_SENSORS_ADP1050
./scripts/config --module CONFIG_SENSORS_BEL_PFE
./scripts/config --module CONFIG_SENSORS_BPA_RS600
./scripts/config --module CONFIG_SENSORS_CRPS
./scripts/config --module CONFIG_SENSORS_DELTA_AHE50DC_FAN
./scripts/config --module CONFIG_SENSORS_FSP_3Y
./scripts/config --module CONFIG_SENSORS_DPS920AB
./scripts/config --module CONFIG_SENSORS_INA233
./scripts/config --module CONFIG_SENSORS_INSPUR_IPSPS
./scripts/config --module CONFIG_SENSORS_IR35221
./scripts/config --module CONFIG_SENSORS_IR36021
./scripts/config --module CONFIG_SENSORS_IR38064
./scripts/config --enable CONFIG_SENSORS_IR38064_REGULATOR
./scripts/config --module CONFIG_SENSORS_IRPS5401
./scripts/config --module CONFIG_SENSORS_ISL68137
./scripts/config --module CONFIG_SENSORS_LM25066
./scripts/config --enable CONFIG_SENSORS_LM25066_REGULATOR
./scripts/config --module CONFIG_SENSORS_LT7182S
./scripts/config --module CONFIG_SENSORS_LTC2978
./scripts/config --enable CONFIG_SENSORS_LTC2978_REGULATOR
./scripts/config --module CONFIG_SENSORS_LTC3815
./scripts/config --module CONFIG_SENSORS_MAX15301
./scripts/config --module CONFIG_SENSORS_MAX16064
./scripts/config --module CONFIG_SENSORS_MAX16601
./scripts/config --module CONFIG_SENSORS_MAX20730
./scripts/config --module CONFIG_SENSORS_MAX20751
./scripts/config --module CONFIG_SENSORS_MAX31785
./scripts/config --module CONFIG_SENSORS_MAX34440
./scripts/config --module CONFIG_SENSORS_MAX8688
./scripts/config --module CONFIG_SENSORS_MP2856
./scripts/config --module CONFIG_SENSORS_MP2888
./scripts/config --module CONFIG_SENSORS_MP2891
./scripts/config --module CONFIG_SENSORS_MP2975
./scripts/config --module CONFIG_SENSORS_MP2993
./scripts/config --module CONFIG_SENSORS_MP5023
./scripts/config --module CONFIG_SENSORS_MP5920
./scripts/config --module CONFIG_SENSORS_MP5990
./scripts/config --module CONFIG_SENSORS_MP9941
./scripts/config --module CONFIG_SENSORS_MPQ7932
./scripts/config --module CONFIG_SENSORS_MPQ8785
./scripts/config --module CONFIG_SENSORS_PIM4328
./scripts/config --module CONFIG_SENSORS_PLI1209BC
./scripts/config --enable CONFIG_SENSORS_PLI1209BC_REGULATOR
./scripts/config --module CONFIG_SENSORS_PM6764TR
./scripts/config --module CONFIG_SENSORS_PXE1610
./scripts/config --module CONFIG_SENSORS_Q54SJ108A2
./scripts/config --module CONFIG_SENSORS_STPDDC60
./scripts/config --module CONFIG_SENSORS_TDA38640
./scripts/config --module CONFIG_SENSORS_TPS25990
./scripts/config --enable CONFIG_SENSORS_TPS25990_REGULATOR
./scripts/config --module CONFIG_SENSORS_TPS40422
./scripts/config --module CONFIG_SENSORS_TPS53679
./scripts/config --module CONFIG_SENSORS_TPS546D24
./scripts/config --module CONFIG_SENSORS_UCD9000
./scripts/config --module CONFIG_SENSORS_UCD9200
./scripts/config --module CONFIG_SENSORS_XDP710
./scripts/config --module CONFIG_SENSORS_XDPE152
./scripts/config --module CONFIG_SENSORS_XDPE122
./scripts/config --enable CONFIG_SENSORS_XDPE122_REGULATOR
./scripts/config --module CONFIG_SENSORS_ZL6100
./scripts/config --module CONFIG_SENSORS_PT5161L
./scripts/config --module CONFIG_SENSORS_SBTSI
./scripts/config --module CONFIG_SENSORS_SHT15
./scripts/config --module CONFIG_SENSORS_SHTC1
./scripts/config --module CONFIG_SENSORS_SIS5595
./scripts/config --module CONFIG_SENSORS_EMC2305
./scripts/config --module CONFIG_SENSORS_SMSC47M1
./scripts/config --module CONFIG_SENSORS_SMSC47B397
./scripts/config --module CONFIG_SENSORS_SCH5636
./scripts/config --module CONFIG_SENSORS_STTS751
./scripts/config --module CONFIG_SENSORS_ADC128D818
./scripts/config --module CONFIG_SENSORS_INA209
./scripts/config --module CONFIG_SENSORS_INA2XX
./scripts/config --module CONFIG_SENSORS_INA238
./scripts/config --module CONFIG_SENSORS_INA3221
./scripts/config --module CONFIG_SENSORS_TC74
./scripts/config --module CONFIG_SENSORS_TMP103
./scripts/config --module CONFIG_SENSORS_TMP108
./scripts/config --module CONFIG_SENSORS_TMP464
./scripts/config --module CONFIG_SENSORS_TMP513
./scripts/config --module CONFIG_SENSORS_W83781D
./scripts/config --enable CONFIG_SENSORS_W83795_FANCTRL
./scripts/config --module CONFIG_SENSORS_W83L785TS
./scripts/config --module CONFIG_SENSORS_W83627HF
./scripts/config --disable CONFIG_SENSORS_XGENE

#
# ACPI drivers
#
./scripts/config --enable CONFIG_THERMAL_NETLINK
./scripts/config --enable CONFIG_PCIE_THERMAL
./scripts/config --enable CONFIG_THERMAL_EMULATION
./scripts/config --enable CONFIG_K3_THERMAL

#
# Watchdog Device Drivers
#
./scripts/config --disable CONFIG_SOFT_WATCHDOG
./scripts/config --disable CONFIG_GPIO_WATCHDOG
./scripts/config --disable CONFIG_WDAT_WDT
./scripts/config --disable CONFIG_ARM_SP805_WATCHDOG
./scripts/config --disable CONFIG_ARM_SBSA_WATCHDOG
./scripts/config --disable CONFIG_DW_WATCHDOG
./scripts/config --disable CONFIG_ARM_SMC_WATCHDOG
./scripts/config --disable CONFIG_I6300ESB_WDT

./scripts/config --enable CONFIG_K3_RTI_WATCHDOG

#
# USB-based Watchdog Cards
#
./scripts/config --disable CONFIG_SSB
./scripts/config --disable CONFIG_BCMA

#
# Multifunction device drivers
#
./scripts/config --disable CONFIG_MFD_AXP20X
./scripts/config --disable CONFIG_MFD_AXP20X_I2C
./scripts/config --disable CONFIG_MFD_CROS_EC_DEV
./scripts/config --disable CONFIG_MFD_HI6421_PMIC
./scripts/config --disable CONFIG_LPC_SCH
./scripts/config --disable CONFIG_MFD_MT6360
./scripts/config --disable CONFIG_MFD_MT6397
./scripts/config --disable CONFIG_MFD_VIPERBOARD
./scripts/config --disable CONFIG_MFD_RK8XX
./scripts/config --disable CONFIG_MFD_RK8XX_I2C
./scripts/config --disable CONFIG_MFD_RK8XX_SPI
./scripts/config --disable CONFIG_MFD_WM8994
./scripts/config --disable CONFIG_MFD_ROHM_BD718XX
./scripts/config --disable CONFIG_MFD_WCD934X
./scripts/config --disable CONFIG_MFD_QCOM_PM8008
./scripts/config --disable CONFIG_MFD_QNAP_MCU

./scripts/config --enable CONFIG_MFD_TI_AM335X_TSCADC
./scripts/config --enable CONFIG_MFD_TPS65219

# end of Multifunction device drivers
./scripts/config --disable CONFIG_REGULATOR_CROS_EC
./scripts/config --disable CONFIG_REGULATOR_DA9211
./scripts/config --disable CONFIG_REGULATOR_FAN53555
./scripts/config --disable CONFIG_REGULATOR_MAX77620
./scripts/config --disable CONFIG_REGULATOR_MP8859
./scripts/config --disable CONFIG_REGULATOR_PCA9450
./scripts/config --disable CONFIG_REGULATOR_PFUZE100
./scripts/config --disable CONFIG_REGULATOR_TPS6286X

./scripts/config --enable CONFIG_REGULATOR_FIXED_VOLTAGE
./scripts/config --enable CONFIG_REGULATOR_USERSPACE_CONSUMER
./scripts/config --enable CONFIG_REGULATOR_GPIO
./scripts/config --enable CONFIG_REGULATOR_PWM
./scripts/config --enable CONFIG_REGULATOR_TPS65219

./scripts/config --disable CONFIG_RC_CORE
./scripts/config --enable CONFIG_CEC_CORE

#
# Cadence media platform drivers
#
./scripts/config --module CONFIG_VIDEO_CADENCE_CSI2RX
./scripts/config --module CONFIG_VIDEO_CADENCE_CSI2TX

#
# Chips&Media media platform drivers
#
./scripts/config --module CONFIG_VIDEO_WAVE_VPU
./scripts/config --module CONFIG_VIDEO_E5010_JPEG_ENC

#
# Texas Instruments drivers
#
./scripts/config --module CONFIG_VIDEO_TI_CAL
./scripts/config --module CONFIG_VIDEO_TI_J721E_CSI2RX

#
# MMC/SDIO DVB adapters
#
./scripts/config --disable CONFIG_V4L_TEST_DRIVERS

#
# Graphics support
#
./scripts/config --enable CONFIG_AUXDISPLAY
./scripts/config --module CONFIG_HD44780
./scripts/config --module CONFIG_LCD2S
./scripts/config --module CONFIG_IMG_ASCII_LCD
./scripts/config --module CONFIG_HT16K33
./scripts/config --module CONFIG_SEG_LED_GPIO
./scripts/config --enable CONFIG_DRM
./scripts/config --enable CONFIG_DRM_KMS_HELPER

# end of Supported DRM clients
./scripts/config --enable CONFIG_DRM_DISPLAY_DP_AUX_BUS
./scripts/config --enable CONFIG_DRM_DISPLAY_HELPER
./scripts/config --enable CONFIG_DRM_GEM_DMA_HELPER
./scripts/config --enable CONFIG_DRM_PANIC
./scripts/config --enable CONFIG_DRM_PANIC_SCREEN_QR_CODE

#
# Drivers for system framebuffers
#
./scripts/config --enable CONFIG_DRM_SIMPLEDRM

#
# ARM devices
#
./scripts/config --disable CONFIG_DRM_HDLCD
./scripts/config --disable CONFIG_DRM_MALI_DISPLAY

# end of ARM devices
./scripts/config --disable CONFIG_DRM_RADEON
./scripts/config --disable CONFIG_HSA_AMD
./scripts/config --disable CONFIG_DRM_XE
./scripts/config --disable CONFIG_DRM_VMWGFX
./scripts/config --disable CONFIG_DRM_UDL
./scripts/config --disable CONFIG_DRM_AST
./scripts/config --disable CONFIG_DRM_QXL
./scripts/config --disable CONFIG_DRM_VIRTIO_GPU

./scripts/config --module CONFIG_DRM_GM12U320
./scripts/config --module CONFIG_TINYDRM_HX8357D
./scripts/config --module CONFIG_TINYDRM_ILI9163
./scripts/config --module CONFIG_TINYDRM_ILI9225
./scripts/config --module CONFIG_TINYDRM_ILI9341
./scripts/config --module CONFIG_TINYDRM_ILI9486
./scripts/config --module CONFIG_TINYDRM_MI0283QT
./scripts/config --module CONFIG_TINYDRM_REPAPER

#
# Backlight & LCD device support
#
./scripts/config --enable CONFIG_BACKLIGHT_PWM
./scripts/config --enable CONFIG_BACKLIGHT_GPIO
./scripts/config --enable CONFIG_BACKLIGHT_LED

#
# Console display driver support
#
./scripts/config --enable CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION

# end of Console display driver support
./scripts/config --enable CONFIG_LOGO
./scripts/config --enable CONFIG_LOGO_LINUX_MONO
./scripts/config --enable CONFIG_LOGO_LINUX_VGA16
./scripts/config --disable CONFIG_LOGO_LINUX_CLUT224
./scripts/config --enable CONFIG_LOGO_BEAGLE_CLUT224

# end of Graphics support
./scripts/config --enable CONFIG_SOUND_OSS_CORE_PRECLAIM

# end of HID-BPF support
./scripts/config --enable CONFIG_I2C_HID

#
# USB HID support
#
./scripts/config --enable CONFIG_USB_HID

# end of USB HID support
./scripts/config --enable CONFIG_USB_COMMON
./scripts/config --enable CONFIG_USB

#
# Miscellaneous USB options
#
./scripts/config --enable CONFIG_USB_OTG

#
# USB Miscellaneous drivers
#
./scripts/config --enable CONFIG_USB_ONBOARD_DEV

# end of USB Physical Layer drivers
./scripts/config --enable CONFIG_USB_GADGET
./scripts/config --set-val CONFIG_USB_GADGET_VBUS_DRAW 500

#
# USB Peripheral Controller
#
./scripts/config --enable CONFIG_USB_LIBCOMPOSITE
./scripts/config --enable CONFIG_USB_F_ACM
./scripts/config --enable CONFIG_USB_F_SS_LB
./scripts/config --enable CONFIG_USB_U_SERIAL
./scripts/config --enable CONFIG_USB_U_ETHER
./scripts/config --enable CONFIG_USB_F_SERIAL
./scripts/config --enable CONFIG_USB_F_OBEX
./scripts/config --enable CONFIG_USB_F_NCM
./scripts/config --enable CONFIG_USB_F_ECM
./scripts/config --enable CONFIG_USB_F_EEM
./scripts/config --enable CONFIG_USB_F_SUBSET
./scripts/config --enable CONFIG_USB_F_RNDIS
./scripts/config --enable CONFIG_USB_F_MASS_STORAGE
./scripts/config --enable CONFIG_USB_F_FS
./scripts/config --enable CONFIG_USB_F_HID
./scripts/config --enable CONFIG_USB_F_PRINTER
./scripts/config --enable CONFIG_USB_CONFIGFS

#
# RGB LED drivers
#
./scripts/config --module CONFIG_LEDS_GROUP_MULTICOLOR
./scripts/config --module CONFIG_LEDS_PWM_MULTICOLOR

#
# LED Triggers
#
./scripts/config --enable CONFIG_LEDS_TRIGGER_TIMER
./scripts/config --enable CONFIG_LEDS_TRIGGER_ONESHOT
./scripts/config --enable CONFIG_LEDS_TRIGGER_BACKLIGHT
./scripts/config --enable CONFIG_LEDS_TRIGGER_ACTIVITY
./scripts/config --enable CONFIG_LEDS_TRIGGER_DEFAULT_ON

#
# Simatic LED drivers
#
./scripts/config --disable CONFIG_ACCESSIBILITY
./scripts/config --disable CONFIG_INFINIBAND
./scripts/config --disable CONFIG_EDAC
./scripts/config --disable CONFIG_EDAC_THUNDERX
./scripts/config --disable CONFIG_EDAC_XGENE

#
# I2C RTC drivers
#
./scripts/config --enable CONFIG_RTC_DRV_ABB5ZES3
./scripts/config --enable CONFIG_RTC_DRV_ABEOZ9
./scripts/config --enable CONFIG_RTC_DRV_ABX80X
./scripts/config --enable CONFIG_RTC_DRV_DS1374
./scripts/config --enable CONFIG_RTC_DRV_DS1374_WDT
./scripts/config --enable CONFIG_RTC_DRV_DS1672
./scripts/config --enable CONFIG_RTC_DRV_HYM8563
./scripts/config --enable CONFIG_RTC_DRV_MAX6900
./scripts/config --enable CONFIG_RTC_DRV_NCT3018Y
./scripts/config --enable CONFIG_RTC_DRV_RS5C372
./scripts/config --enable CONFIG_RTC_DRV_ISL1208
./scripts/config --enable CONFIG_RTC_DRV_ISL12022
./scripts/config --enable CONFIG_RTC_DRV_ISL12026
./scripts/config --enable CONFIG_RTC_DRV_X1205
./scripts/config --enable CONFIG_RTC_DRV_PCF85063
./scripts/config --enable CONFIG_RTC_DRV_PCF85363
./scripts/config --enable CONFIG_RTC_DRV_PCF8583
./scripts/config --enable CONFIG_RTC_DRV_M41T80
./scripts/config --enable CONFIG_RTC_DRV_M41T80_WDT
./scripts/config --enable CONFIG_RTC_DRV_BQ32K
./scripts/config --enable CONFIG_RTC_DRV_S35390A
./scripts/config --enable CONFIG_RTC_DRV_FM3130
./scripts/config --enable CONFIG_RTC_DRV_RX8010
./scripts/config --enable CONFIG_RTC_DRV_RX8581
./scripts/config --enable CONFIG_RTC_DRV_RX8025
./scripts/config --enable CONFIG_RTC_DRV_EM3027
./scripts/config --module CONFIG_RTC_DRV_RV3028
./scripts/config --enable CONFIG_RTC_DRV_RV8803

#
# SPI RTC drivers
#
./scripts/config --enable CONFIG_RTC_DRV_M41T93
./scripts/config --enable CONFIG_RTC_DRV_M41T94
./scripts/config --enable CONFIG_RTC_DRV_DS1302
./scripts/config --enable CONFIG_RTC_DRV_DS1305
./scripts/config --enable CONFIG_RTC_DRV_DS1343
./scripts/config --enable CONFIG_RTC_DRV_DS1347
./scripts/config --enable CONFIG_RTC_DRV_DS1390
./scripts/config --enable CONFIG_RTC_DRV_MAX6916
./scripts/config --enable CONFIG_RTC_DRV_R9701
./scripts/config --enable CONFIG_RTC_DRV_RX4581
./scripts/config --enable CONFIG_RTC_DRV_RS5C348
./scripts/config --enable CONFIG_RTC_DRV_MAX6902
./scripts/config --enable CONFIG_RTC_DRV_PCF2123
./scripts/config --enable CONFIG_RTC_DRV_MCP795

#
# SPI and I2C RTC drivers
#
./scripts/config --enable CONFIG_RTC_DRV_DS3232
./scripts/config --enable CONFIG_RTC_DRV_DS3232_HWMON
./scripts/config --enable CONFIG_RTC_DRV_PCF2127
./scripts/config --enable CONFIG_RTC_DRV_RV3029C2
./scripts/config --enable CONFIG_RTC_DRV_RV3029_HWMON
./scripts/config --enable CONFIG_RTC_DRV_RX6110

#
# Platform RTC drivers
#
./scripts/config --module CONFIG_RTC_DRV_DS1286
./scripts/config --module CONFIG_RTC_DRV_DS1511
./scripts/config --module CONFIG_RTC_DRV_DS1553
./scripts/config --module CONFIG_RTC_DRV_DS1685_FAMILY
./scripts/config --enable CONFIG_RTC_DRV_DS1685
./scripts/config --module CONFIG_RTC_DRV_DS1742
./scripts/config --module CONFIG_RTC_DRV_DS2404
./scripts/config --module CONFIG_RTC_DRV_STK17TA8
./scripts/config --module CONFIG_RTC_DRV_M48T86
./scripts/config --module CONFIG_RTC_DRV_M48T35
./scripts/config --module CONFIG_RTC_DRV_M48T59
./scripts/config --module CONFIG_RTC_DRV_MSM6242
./scripts/config --module CONFIG_RTC_DRV_RP5C01

#
# on-CPU RTC drivers
#
./scripts/config --disable CONFIG_RTC_DRV_PL031
./scripts/config --enable CONFIG_RTC_DRV_TI_K3

# end of Microsoft Hyper-V guest support
./scripts/config --module CONFIG_GREYBUS
./scripts/config --module CONFIG_GREYBUS_ES2

#
# Accelerometers
#
./scripts/config --module CONFIG_ADIS16203

#
# Analog to digital converters
#
./scripts/config --module CONFIG_AD7816

#
# Analog digital bi-direction converters
#
./scripts/config --module CONFIG_ADT7316
./scripts/config --module CONFIG_ADT7316_SPI
./scripts/config --module CONFIG_ADT7316_I2C

#
# Direct Digital Synthesis
#
./scripts/config --module CONFIG_AD9832
./scripts/config --module CONFIG_AD9834

#
# Network Analyzer, Impedance Converters
#
./scripts/config --module CONFIG_AD5933

#
# StarFive media platform drivers
#
./scripts/config --module CONFIG_FB_TFT
./scripts/config --module CONFIG_FB_TFT_AGM1264K_FL
./scripts/config --module CONFIG_FB_TFT_BD663474
./scripts/config --module CONFIG_FB_TFT_HX8340BN
./scripts/config --module CONFIG_FB_TFT_HX8347D
./scripts/config --module CONFIG_FB_TFT_HX8353D
./scripts/config --module CONFIG_FB_TFT_HX8357D
./scripts/config --module CONFIG_FB_TFT_ILI9163
./scripts/config --module CONFIG_FB_TFT_ILI9320
./scripts/config --module CONFIG_FB_TFT_ILI9325
./scripts/config --module CONFIG_FB_TFT_ILI9340
./scripts/config --module CONFIG_FB_TFT_ILI9341
./scripts/config --module CONFIG_FB_TFT_ILI9481
./scripts/config --module CONFIG_FB_TFT_ILI9486
./scripts/config --module CONFIG_FB_TFT_PCD8544
./scripts/config --module CONFIG_FB_TFT_RA8875
./scripts/config --module CONFIG_FB_TFT_S6D02A1
./scripts/config --module CONFIG_FB_TFT_S6D1121
./scripts/config --module CONFIG_FB_TFT_SEPS525
./scripts/config --module CONFIG_FB_TFT_SH1106
./scripts/config --module CONFIG_FB_TFT_SSD1289
./scripts/config --module CONFIG_FB_TFT_SSD1305
./scripts/config --module CONFIG_FB_TFT_SSD1306
./scripts/config --module CONFIG_FB_TFT_SSD1331
./scripts/config --module CONFIG_FB_TFT_SSD1351
./scripts/config --module CONFIG_FB_TFT_ST7735R
./scripts/config --module CONFIG_FB_TFT_ST7789V
./scripts/config --module CONFIG_FB_TFT_TINYLCD
./scripts/config --module CONFIG_FB_TFT_TLS8204
./scripts/config --module CONFIG_FB_TFT_UC1611
./scripts/config --module CONFIG_FB_TFT_UC1701
./scripts/config --module CONFIG_FB_TFT_UPD161704
./scripts/config --module CONFIG_GREYBUS_AUDIO
./scripts/config --module CONFIG_GREYBUS_BOOTROM
./scripts/config --module CONFIG_GREYBUS_FIRMWARE
./scripts/config --module CONFIG_GREYBUS_HID
./scripts/config --module CONFIG_GREYBUS_LOG
./scripts/config --module CONFIG_GREYBUS_LOOPBACK
./scripts/config --module CONFIG_GREYBUS_POWER
./scripts/config --module CONFIG_GREYBUS_RAW
./scripts/config --module CONFIG_GREYBUS_VIBRATOR
./scripts/config --module CONFIG_GREYBUS_BRIDGED_PHY
./scripts/config --module CONFIG_GREYBUS_GPIO
./scripts/config --module CONFIG_GREYBUS_I2C
./scripts/config --module CONFIG_GREYBUS_PWM
./scripts/config --module CONFIG_GREYBUS_SDIO
./scripts/config --module CONFIG_GREYBUS_SPI
./scripts/config --module CONFIG_GREYBUS_UART
./scripts/config --module CONFIG_GREYBUS_USB

./scripts/config --disable CONFIG_CHROME_PLATFORMS

#
# Remoteproc drivers
#
./scripts/config --enable CONFIG_REMOTEPROC_CDEV
./scripts/config --module CONFIG_TI_K3_DSP_REMOTEPROC
./scripts/config --module CONFIG_TI_K3_M4_REMOTEPROC
./scripts/config --module CONFIG_TI_K3_R5_REMOTEPROC

#
# Rpmsg drivers
#
./scripts/config --enable CONFIG_RPMSG
./scripts/config --module CONFIG_RPMSG_CHAR
./scripts/config --module CONFIG_RPMSG_CTRL
./scripts/config --enable CONFIG_RPMSG_NS


# end of Rpmsg drivers
./scripts/config --disable CONFIG_SOUNDWIRE

#
# NXP/Freescale QorIQ SoC drivers
#
./scripts/config --disable CONFIG_FSL_RCPM

#
# Qualcomm SoC drivers
#
./scripts/config --disable CONFIG_QCOM_PDR_HELPERS
./scripts/config --disable CONFIG_QCOM_PDR_MSG
./scripts/config --disable CONFIG_QCOM_PMIC_GLINK
./scripts/config --disable CONFIG_QCOM_QMI_HELPERS

#
# DEVFREQ Governors
#
./scripts/config --enable CONFIG_DEVFREQ_GOV_PERFORMANCE
./scripts/config --enable CONFIG_DEVFREQ_GOV_POWERSAVE
./scripts/config --enable CONFIG_DEVFREQ_GOV_USERSPACE
./scripts/config --enable CONFIG_DEVFREQ_GOV_PASSIVE

#
# Extcon Device Drivers
#
./scripts/config --enable CONFIG_EXTCON_GPIO
./scripts/config --enable CONFIG_EXTCON_USB_GPIO
./scripts/config --enable CONFIG_IIO
./scripts/config --module CONFIG_IIO_BUFFER_CB
./scripts/config --module CONFIG_IIO_SW_DEVICE

#
# Accelerometers
#
./scripts/config --module CONFIG_ADXL313
./scripts/config --module CONFIG_ADXL313_I2C
./scripts/config --module CONFIG_ADXL313_SPI
./scripts/config --module CONFIG_ADXL345
./scripts/config --module CONFIG_ADXL345_I2C
./scripts/config --module CONFIG_ADXL345_SPI
./scripts/config --module CONFIG_ADXL355
./scripts/config --module CONFIG_ADXL355_I2C
./scripts/config --module CONFIG_ADXL355_SPI
./scripts/config --module CONFIG_ADXL367
./scripts/config --module CONFIG_ADXL367_SPI
./scripts/config --module CONFIG_ADXL367_I2C
./scripts/config --module CONFIG_ADXL380
./scripts/config --module CONFIG_ADXL380_SPI
./scripts/config --module CONFIG_ADXL380_I2C
./scripts/config --module CONFIG_BMI088_ACCEL
./scripts/config --module CONFIG_BMI088_ACCEL_I2C
./scripts/config --module CONFIG_BMI088_ACCEL_SPI
./scripts/config --module CONFIG_DMARD06
./scripts/config --module CONFIG_FXLS8962AF
./scripts/config --module CONFIG_FXLS8962AF_I2C
./scripts/config --module CONFIG_FXLS8962AF_SPI
./scripts/config --module CONFIG_IIO_KX022A
./scripts/config --module CONFIG_IIO_KX022A_SPI
./scripts/config --module CONFIG_IIO_KX022A_I2C
./scripts/config --module CONFIG_MSA311
./scripts/config --module CONFIG_SCA3300

#
# Analog to digital converters
#
./scripts/config --module CONFIG_AD4000
./scripts/config --module CONFIG_AD4030
./scripts/config --module CONFIG_AD4130
./scripts/config --module CONFIG_AD4695
./scripts/config --module CONFIG_AD4851
./scripts/config --module CONFIG_AD7091R8
./scripts/config --module CONFIG_AD7173
./scripts/config --module CONFIG_AD7191
./scripts/config --module CONFIG_AD7280
./scripts/config --module CONFIG_AD7380
./scripts/config --module CONFIG_AD7625
./scripts/config --module CONFIG_AD7779
./scripts/config --module CONFIG_AD7944
./scripts/config --module CONFIG_ENVELOPE_DETECTOR
./scripts/config --module CONFIG_GEHC_PMC_ADC
./scripts/config --module CONFIG_LTC2309
./scripts/config --module CONFIG_MAX11205
./scripts/config --module CONFIG_MAX11410
./scripts/config --module CONFIG_MAX34408
./scripts/config --module CONFIG_MCP3564
./scripts/config --module CONFIG_PAC1921
./scripts/config --module CONFIG_PAC1934
./scripts/config --module CONFIG_RICHTEK_RTQ6056
./scripts/config --module CONFIG_SD_ADC_MODULATOR
./scripts/config --module CONFIG_TI_ADS1100
./scripts/config --module CONFIG_TI_ADS1119
./scripts/config --module CONFIG_TI_ADS124S08
./scripts/config --module CONFIG_TI_ADS1298
./scripts/config --module CONFIG_TI_ADS131E08
./scripts/config --module CONFIG_TI_ADS7138
./scripts/config --module CONFIG_TI_ADS7924
./scripts/config --module CONFIG_TI_ADS8344
./scripts/config --module CONFIG_TI_ADS8688
./scripts/config --enable CONFIG_TI_AM335X_ADC
./scripts/config --module CONFIG_TI_TLC4541
./scripts/config --module CONFIG_TI_TSC2046

#
# Analog to digital and digital to analog converters
#
./scripts/config --module CONFIG_AD74115
./scripts/config --module CONFIG_AD74413R

#
# Analog Front Ends
#
./scripts/config --module CONFIG_IIO_RESCALE

#
# Amplifiers
#
./scripts/config --module CONFIG_AD8366
./scripts/config --module CONFIG_ADA4250
./scripts/config --module CONFIG_HMC425

#
# Capacitance to digital converters
#
./scripts/config --module CONFIG_AD7150
./scripts/config --module CONFIG_AD7746

#
# Chemical Sensors
#
./scripts/config --module CONFIG_AOSONG_AGS02MA
./scripts/config --module CONFIG_ATLAS_PH_SENSOR
./scripts/config --module CONFIG_ATLAS_EZO_SENSOR
./scripts/config --module CONFIG_BME680
./scripts/config --module CONFIG_BME680_I2C
./scripts/config --module CONFIG_BME680_SPI
./scripts/config --module CONFIG_CCS811
./scripts/config --module CONFIG_ENS160
./scripts/config --module CONFIG_ENS160_I2C
./scripts/config --module CONFIG_ENS160_SPI
./scripts/config --module CONFIG_IAQCORE

./scripts/config --module CONFIG_PMS7003
./scripts/config --module CONFIG_SCD30_CORE
./scripts/config --module CONFIG_SCD30_I2C
./scripts/config --module CONFIG_SCD30_SERIAL
./scripts/config --module CONFIG_SCD4X

./scripts/config --module CONFIG_SENSIRION_SGP30
./scripts/config --module CONFIG_SENSIRION_SGP40
./scripts/config --module CONFIG_SPS30
./scripts/config --module CONFIG_SPS30_I2C
./scripts/config --module CONFIG_SPS30_SERIAL
./scripts/config --module CONFIG_SENSEAIR_SUNRISE_CO2
./scripts/config --module CONFIG_VZ89X

#
# Digital to analog converters
#
./scripts/config --module CONFIG_AD3552R_HS
./scripts/config --module CONFIG_AD3552R_LIB
./scripts/config --module CONFIG_AD3552R
./scripts/config --module CONFIG_AD9739A
./scripts/config --module CONFIG_LTC2688
./scripts/config --module CONFIG_AD5766
./scripts/config --module CONFIG_AD7293
./scripts/config --module CONFIG_AD8460
./scripts/config --module CONFIG_BD79703
./scripts/config --module CONFIG_DPOT_DAC
./scripts/config --module CONFIG_LTC2664
./scripts/config --module CONFIG_MAX5522
./scripts/config --module CONFIG_MAX5821
./scripts/config --module CONFIG_MCP4728
./scripts/config --module CONFIG_MCP4821

#
# Clock Generator/Distribution
#
./scripts/config --module CONFIG_AD9523

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
./scripts/config --module CONFIG_ADF4350
./scripts/config --module CONFIG_ADF4371
./scripts/config --module CONFIG_ADF4377
./scripts/config --module CONFIG_ADMFM2000
./scripts/config --module CONFIG_ADMV1013
./scripts/config --module CONFIG_ADMV4420
./scripts/config --module CONFIG_ADRF6780

#
# Heart Rate Monitors
#
./scripts/config --module CONFIG_AFE4403
./scripts/config --module CONFIG_AFE4404
./scripts/config --module CONFIG_MAX30100
./scripts/config --module CONFIG_MAX30102

#
# Humidity sensors
#
./scripts/config --module CONFIG_AM2315
./scripts/config --module CONFIG_ENS210
./scripts/config --module CONFIG_HDC100X
./scripts/config --module CONFIG_HDC2010
./scripts/config --module CONFIG_HDC3020
./scripts/config --module CONFIG_HID_SENSOR_HUMIDITY
./scripts/config --module CONFIG_HTS221
./scripts/config --module CONFIG_HTS221_I2C
./scripts/config --module CONFIG_HTS221_SPI
./scripts/config --module CONFIG_HTU21
./scripts/config --module CONFIG_SI7005
./scripts/config --module CONFIG_SI7020

#
# Inertial measurement units
#
./scripts/config --module CONFIG_ADIS16400
./scripts/config --module CONFIG_ADIS16550
./scripts/config --module CONFIG_BMI270
./scripts/config --module CONFIG_BMI270_I2C
./scripts/config --module CONFIG_BMI270_SPI
./scripts/config --module CONFIG_BMI323
./scripts/config --module CONFIG_BMI323_I2C
./scripts/config --module CONFIG_BMI323_SPI
./scripts/config --module CONFIG_BOSCH_BNO055
./scripts/config --module CONFIG_BOSCH_BNO055_SERIAL
./scripts/config --module CONFIG_BOSCH_BNO055_I2C
./scripts/config --module CONFIG_SMI240
./scripts/config --module CONFIG_IIO_ST_LSM9DS0
./scripts/config --module CONFIG_IIO_ST_LSM9DS0_I2C
./scripts/config --module CONFIG_IIO_ST_LSM9DS0_SPI

#
# Light sensors
#
./scripts/config --module CONFIG_AL3000A
./scripts/config --module CONFIG_APDS9160
./scripts/config --module CONFIG_APDS9306
./scripts/config --module CONFIG_BH1745
./scripts/config --module CONFIG_CM3605
./scripts/config --module CONFIG_ISL76682
./scripts/config --module CONFIG_ROHM_BU27034
./scripts/config --module CONFIG_LTR390
./scripts/config --module CONFIG_LTRF216A
./scripts/config --module CONFIG_OPT4001
./scripts/config --module CONFIG_OPT4060
./scripts/config --module CONFIG_TSL2591
./scripts/config --module CONFIG_VEML3235
./scripts/config --module CONFIG_VEML6040
./scripts/config --module CONFIG_VEML6075

#
# Magnetometer sensors
#
./scripts/config --module CONFIG_AF8133J
./scripts/config --module CONFIG_AK8974
./scripts/config --module CONFIG_ALS31300
./scripts/config --module CONFIG_SI7210
./scripts/config --module CONFIG_TI_TMAG5273
./scripts/config --module CONFIG_YAMAHA_YAS530

#
# Multiplexers
#
./scripts/config --module CONFIG_IIO_MUX

#
# Triggers - standalone
#
./scripts/config --module CONFIG_IIO_TIGHTLOOP_TRIGGER

#
# Linear and angular position sensors
#
./scripts/config --module CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE

#
# Digital potentiometers
#
./scripts/config --module CONFIG_AD5110
./scripts/config --module CONFIG_AD5272
./scripts/config --module CONFIG_DS1803
./scripts/config --module CONFIG_MAX5432
./scripts/config --module CONFIG_MAX5481
./scripts/config --module CONFIG_MAX5487
./scripts/config --module CONFIG_MCP4018
./scripts/config --module CONFIG_MCP4131
./scripts/config --module CONFIG_MCP4531
./scripts/config --module CONFIG_MCP41010
./scripts/config --module CONFIG_TPL0102
./scripts/config --module CONFIG_X9250

#
# Digital potentiostats
#
./scripts/config --module CONFIG_LMP91000

#
# Pressure sensors
#
./scripts/config --module CONFIG_ROHM_BM1390
./scripts/config --module CONFIG_HSC030PA
./scripts/config --module CONFIG_HSC030PA_I2C
./scripts/config --module CONFIG_HSC030PA_SPI
./scripts/config --module CONFIG_MPRLS0025PA
./scripts/config --module CONFIG_MPRLS0025PA_I2C
./scripts/config --module CONFIG_MPRLS0025PA_SPI
./scripts/config --module CONFIG_MS5611_I2C
./scripts/config --module CONFIG_MS5611_SPI
./scripts/config --module CONFIG_SDP500

#
# Lightning sensors
#
./scripts/config --module CONFIG_AS3935

#
# Proximity and distance sensors
#
./scripts/config --module CONFIG_HX9023S
./scripts/config --module CONFIG_IRSD200
./scripts/config --module CONFIG_SX9324
./scripts/config --module CONFIG_SX9360
./scripts/config --module CONFIG_SX9500
./scripts/config --module CONFIG_AW96103

#
# Resolver to digital converters
#
./scripts/config --module CONFIG_AD2S90
./scripts/config --module CONFIG_AD2S1200
./scripts/config --module CONFIG_AD2S1210

#
# Temperature sensors
#
./scripts/config --module CONFIG_MLX90635
./scripts/config --module CONFIG_TMP117
./scripts/config --module CONFIG_MAX30208
./scripts/config --module CONFIG_MAX31865
./scripts/config --module CONFIG_MCP9600

# end of Temperature sensors
./scripts/config --module CONFIG_PWM_GPIO
./scripts/config --enable CONFIG_PWM_OMAP_DMTIMER
./scripts/config --enable CONFIG_PWM_PCA9685
./scripts/config --enable CONFIG_PWM_TIECAP
./scripts/config --enable CONFIG_PWM_TIEHRPWM

# end of IRQ chip support
./scripts/config --enable CONFIG_RESET_TI_SYSCON

#
# Layout Types
#
./scripts/config --enable CONFIG_NVMEM_LAYOUT_U_BOOT_ENV
./scripts/config --enable CONFIG_NVMEM_U_BOOT_ENV

#
# Multiplexer drivers
#
./scripts/config --module CONFIG_MUX_ADG792A
./scripts/config --module CONFIG_MUX_ADGS1408
./scripts/config --module CONFIG_MUX_GPIO

./scripts/config --disable CONFIG_SLIMBUS
./scripts/config --disable CONFIG_INTERCONNECT
./scripts/config --module CONFIG_COUNTER
./scripts/config --module CONFIG_INTERRUPT_CNT
./scripts/config --module CONFIG_TI_ECAP_CAPTURE
./scripts/config --module CONFIG_TI_EQEP

#
# File systems
#
./scripts/config --enable CONFIG_VALIDATE_FS_PARSER
./scripts/config --enable CONFIG_EXT4_FS
./scripts/config --disable CONFIG_XFS_FS
./scripts/config --disable CONFIG_OCFS2_FS
./scripts/config --enable CONFIG_BTRFS_FS
./scripts/config --disable CONFIG_NILFS2_FS
./scripts/config --enable CONFIG_F2FS_FS
./scripts/config --disable CONFIG_BCACHEFS_FS
./scripts/config --enable CONFIG_AUTOFS_FS
./scripts/config --enable CONFIG_OVERLAY_FS

#
# DOS/FAT/EXFAT/NT Filesystems
#
./scripts/config --enable CONFIG_FAT_FS
./scripts/config --enable CONFIG_MSDOS_FS
./scripts/config --enable CONFIG_VFAT_FS

#
# Pseudo filesystems
#
./scripts/config --enable CONFIG_CONFIGFS_FS
./scripts/config --disable CONFIG_ORANGEFS_FS
./scripts/config --disable CONFIG_ADFS_FS
./scripts/config --disable CONFIG_AFFS_FS
./scripts/config --disable CONFIG_HFS_FS
./scripts/config --disable CONFIG_HFSPLUS_FS
./scripts/config --disable CONFIG_BEFS_FS
./scripts/config --disable CONFIG_BFS_FS
./scripts/config --disable CONFIG_EFS_FS
./scripts/config --enable CONFIG_UBIFS_FS
./scripts/config --disable CONFIG_VXFS_FS
./scripts/config --disable CONFIG_MINIX_FS
./scripts/config --disable CONFIG_OMFS_FS
./scripts/config --disable CONFIG_HPFS_FS
./scripts/config --disable CONFIG_QNX4FS_FS
./scripts/config --disable CONFIG_QNX6FS_FS
./scripts/config --disable CONFIG_UFS_FS
./scripts/config --disable CONFIG_EROFS_FS
./scripts/config --enable CONFIG_NFS_FS
./scripts/config --enable CONFIG_NFS_V2
./scripts/config --enable CONFIG_NFS_V3
./scripts/config --enable CONFIG_NFS_V4
./scripts/config --enable CONFIG_ROOT_NFS

./scripts/config --enable CONFIG_NLS_CODEPAGE_437
./scripts/config --enable CONFIG_NLS_ASCII

#
# Security options
#
./scripts/config --disable CONFIG_PERSISTENT_KEYRINGS
./scripts/config --disable CONFIG_SECURITY_DMESG_RESTRICT
./scripts/config --disable CONFIG_SECURITY_LOCKDOWN_LSM
./scripts/config --disable CONFIG_SECURITY_IPE
./scripts/config --disable CONFIG_IMA_BLACKLIST_KEYRING
./scripts/config --disable CONFIG_IMA_LOAD_X509

#
# Certificates for signature checking
#
./scripts/config --disable CONFIG_SECONDARY_TRUSTED_KEYRING
./scripts/config --disable CONFIG_SYSTEM_BLACKLIST_KEYRING

#
# Library routines
#
./scripts/config --disable CONFIG_RAID6_PQ_BENCHMARK

#
# Compile-time checks and compiler options
#
./scripts/config --disable CONFIG_DEBUG_INFO
./scripts/config --enable CONFIG_DEBUG_INFO_NONE
./scripts/config --disable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
./scripts/config --enable CONFIG_HEADERS_INSTALL
./scripts/config --enable CONFIG_DEBUG_SECTION_MISMATCH

# end of RCU Debugging
./scripts/config --disable CONFIG_STRICT_DEVMEM

#
# arm Debugging
#
./scripts/config --disable CONFIG_CORESIGHT

#
# Kernel Testing and Coverage
#
./scripts/config --disable CONFIG_RUNTIME_TESTING_MENU

cd ${DIR}/

exit 2

#Docker.io
./scripts/config --enable CONFIG_NETFILTER_XT_MATCH_IPVS
./scripts/config --enable CONFIG_CGROUP_BPF
./scripts/config --enable CONFIG_BLK_DEV_THROTTLING
./scripts/config --enable CONFIG_NET_CLS_CGROUP
./scripts/config --enable CONFIG_CGROUP_NET_PRIO
./scripts/config --enable CONFIG_IP_NF_TARGET_REDIRECT
./scripts/config --enable CONFIG_IP_VS
./scripts/config --enable CONFIG_IP_VS_NFCT
./scripts/config --enable CONFIG_IP_VS_PROTO_TCP
./scripts/config --enable CONFIG_IP_VS_PROTO_UDP
./scripts/config --enable CONFIG_IP_VS_RR
./scripts/config --enable CONFIG_SECURITY_SELINUX
./scripts/config --enable CONFIG_SECURITY_APPARMOR
./scripts/config --enable CONFIG_VXLAN
./scripts/config --enable CONFIG_IPVLAN
./scripts/config --enable CONFIG_DUMMY
./scripts/config --enable CONFIG_NF_NAT_FTP
./scripts/config --enable CONFIG_NF_CONNTRACK_FTP
./scripts/config --enable CONFIG_NF_NAT_TFTP
./scripts/config --enable CONFIG_NF_CONNTRACK_TFTP
./scripts/config --enable CONFIG_DM_THIN_PROVISIONING

#abi="5.13.0-trunk"
#kernel="5.13.9-1~exp2"
./scripts/config --enable CONFIG_BPF_UNPRIV_DEFAULT_OFF
./scripts/config --enable CONFIG_CGROUP_MISC
./scripts/config --enable CONFIG_RESET_ATTACK_MITIGATION

# Extras
./scripts/config --module CONFIG_VIDEO_OV5647
./scripts/config --enable CONFIG_LED_TRIGGER_PHY
./scripts/config --module CONFIG_USB_LEDS_TRIGGER_USBPORT
./scripts/config --module CONFIG_LEDS_TRIGGER_TRANSIENT
./scripts/config --module CONFIG_LEDS_TRIGGER_CAMERA
./scripts/config --module CONFIG_LEDS_TRIGGER_NETDEV
./scripts/config --module CONFIG_LEDS_TRIGGER_PATTERN
./scripts/config --module CONFIG_LEDS_TRIGGER_AUDIO

#PRU
./scripts/config --module CONFIG_UIO_PDRV_GENIRQ

# We recommend to turn off Real-Time group scheduling in the
# kernel when using systemd. RT group scheduling effectively
# makes RT scheduling unavailable for most userspace, since it
# requires explicit assignment of RT budgets to each unit whose
# processes making use of RT. As there's no sensible way to
# assign these budgets automatically this cannot really be
# fixed, and it's best to disable group scheduling hence.
./scripts/config --disable CONFIG_RT_GROUP_SCHED

#iwd
./scripts/config --enable CONFIG_CRYPTO_USER_API_SKCIPHER
./scripts/config --enable CONFIG_CRYPTO_USER_API_HASH
./scripts/config --enable CONFIG_CRYPTO_HMAC
./scripts/config --enable CONFIG_CRYPTO_CMAC
./scripts/config --enable CONFIG_CRYPTO_MD4
./scripts/config --enable CONFIG_CRYPTO_MD5
./scripts/config --enable CONFIG_CRYPTO_SHA256
./scripts/config --enable CONFIG_CRYPTO_SHA512
./scripts/config --enable CONFIG_CRYPTO_AES
./scripts/config --enable CONFIG_CRYPTO_ECB
./scripts/config --enable CONFIG_CRYPTO_DES
./scripts/config --enable CONFIG_CRYPTO_CBC
./scripts/config --enable CONFIG_KEY_DH_OPERATIONS

#WiFi, removed in 6.7-rc1
./scripts/config --disable CONFIG_WLAN_VENDOR_CISCO
./scripts/config --disable CONFIG_HOSTAP
./scripts/config --disable CONFIG_HERMES
./scripts/config --disable CONFIG_USB_ZD1201
./scripts/config --disable CONFIG_RTL8192U

#removed in 6.7-rc1
./scripts/config --disable CONFIG_DEV_APPLETALK

#TI delta 09.01.00.004:
./scripts/config --enable CONFIG_APERTURE_HELPERS
./scripts/config --enable CONFIG_FB_CFB_FILLRECT
./scripts/config --enable CONFIG_FB_CFB_COPYAREA
./scripts/config --enable CONFIG_FB_CFB_IMAGEBLIT
./scripts/config --enable CONFIG_FB_SIMPLE
./scripts/config --module CONFIG_TI_EQEP

./scripts/config  --enable CONFIG_USB_CDNS_SUPPORT
./scripts/config  --enable CONFIG_USB_CDNS3
./scripts/config  --enable CONFIG_USB_CDNS3_TI
./scripts/config  --enable CONFIG_USB_ONBOARD_HUB

./scripts/config --module CONFIG_VIDEO_WAVE_VPU
./scripts/config --module CONFIG_VIDEO_CADENCE_CSI2RX
./scripts/config --module CONFIG_VIDEO_TI_J721E_CSI2RX
./scripts/config --module CONFIG_PHY_CADENCE_DPHY_RX
./scripts/config --module CONFIG_VIDEO_CADENCE_CSI2TX
./scripts/config --module CONFIG_VIDEO_OV2312
./scripts/config --module CONFIG_VIDEO_OV5640
./scripts/config --module CONFIG_VIDEO_OV5645
./scripts/config --module CONFIG_VIDEO_IMX219
./scripts/config --module CONFIG_VIDEO_IMX390
./scripts/config --module CONFIG_VIDEO_OX05B1S

#enable SPI/W1
./scripts/config --enable CONFIG_SPI_OMAP24XX
./scripts/config --enable CONFIG_W1
./scripts/config --enable CONFIG_MIKROBUS

#20240305: regression on discord, some systemd can no longer load *.xz modules...
./scripts/config --disable CONFIG_MODULE_DECOMPRESS

#enable CONFIG_DYNAMIC_FTRACE
./scripts/config --enable CONFIG_FUNCTION_TRACER
./scripts/config --enable CONFIG_DYNAMIC_FTRACE

./scripts/config --enable CONFIG_MODULE_COMPRESS
./scripts/config --disable CONFIG_MODULE_COMPRESS_GZIP
./scripts/config --enable CONFIG_MODULE_COMPRESS_XZ
./scripts/config --disable CONFIG_MODULE_COMPRESS_ZSTD
./scripts/config --enable CONFIG_MODULE_COMPRESS_ALL
./scripts/config --enable CONFIG_GPIO_AGGREGATOR
./scripts/config --module CONFIG_PWM_GPIO

#cc33xx ble
./scripts/config --disable CONFIG_BT_BNEP
./scripts/config --disable CONFIG_BT_HCIBTSDIO
./scripts/config --disable CONFIG_BT_TI

#Gone on Mainline, supporting 32bit only...
./scripts/config --disable CONFIG_UIO
./scripts/config --disable CONFIG_UIO_PRUSS

./scripts/config --module CONFIG_CC33XX
./scripts/config --module CONFIG_CC33XX_SDIO

./scripts/config --module CONFIG_VIDEO_IMG_VXD_DEC
./scripts/config --module CONFIG_VIDEO_IMG_VXE_ENC
./scripts/config --module CONFIG_VIDEO_E5010_JPEG_ENC
./scripts/config --module CONFIG_TI_EQEP
./scripts/config --enable CONFIG_CRYPTO_DEV_TI_MCRC64

#PCI Express Precision Time Measurement support
./scripts/config --enable CONFIG_PCIE_PTM

#REMOTEPROC
./scripts/config --enable CONFIG_REMOTEPROC_CDEV
./scripts/config --module CONFIG_TI_K3_DSP_REMOTEPROC
./scripts/config --module CONFIG_TI_K3_M4_REMOTEPROC
./scripts/config --module CONFIG_TI_K3_R5_REMOTEPROC
./scripts/config --module CONFIG_RPMSG
./scripts/config --module CONFIG_RPMSG_NS
./scripts/config --module CONFIG_RPMSG_PRU
./scripts/config --enable CONFIG_RPMSG_VIRTIO

#Google Coral Gasket
./scripts/config --module CONFIG_STAGING_GASKET_FRAMEWORK
./scripts/config --module CONFIG_STAGING_APEX_DRIVER

#DRM_PANIC
./scripts/config --enable CONFIG_DRM_PANIC
./scripts/config --enable CONFIG_DRM_PANIC_SCREEN_QR_CODE

#TI: 10.00.06
./scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
./scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
./scripts/config --disable CONFIG_MTD_SPI_NOR_USE_4K_SECTORS

#TI: 10.01.01
./scripts/config --module CONFIG_OMAP2PLUS_MBOX

#new in v6.12.x
./scripts/config --enable CONFIG_PREEMPT_RT
./scripts/config --enable CONFIG_RPMB
./scripts/config --module CONFIG_ADXL380_SPI
./scripts/config --module CONFIG_ADXL380_I2C
./scripts/config --module CONFIG_AD4000
./scripts/config --module CONFIG_AD4695
./scripts/config --module CONFIG_PAC1921
./scripts/config --module CONFIG_LTC2664
./scripts/config --module CONFIG_ENS210
./scripts/config --module CONFIG_BH1745
./scripts/config --module CONFIG_SDP500
./scripts/config --module CONFIG_HX9023S
./scripts/config --module CONFIG_AW96103

#debian 6.12~rc6-1~exp1
./scripts/config --enable CONFIG_ZONE_DEVICE
./scripts/config --module CONFIG_IP_VS_TWOS
./scripts/config --module CONFIG_VIDEO_OV5648
./scripts/config --enable CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV
./scripts/config --module CONFIG_TI_PRUSS

#debian 6.12.6-1
./scripts/config --enable CONFIG_ZRAM_BACKEND_LZ4
./scripts/config --enable CONFIG_ZRAM_BACKEND_LZ4HC
./scripts/config --enable CONFIG_ZRAM_BACKEND_ZSTD
./scripts/config --enable CONFIG_ZRAM_BACKEND_DEFLATE
./scripts/config --enable CONFIG_ZRAM_DEF_COMP_LZ4
./scripts/config --set-str CONFIG_ZRAM_DEF_COMP "lz4"

#debian 6.12.16-1
./scripts/config --enable CONFIG_RCU_LAZY
./scripts/config --module CONFIG_NSM
./scripts/config --module CONFIG_NITRO_ENCLAVES
./scripts/config --module CONFIG_USB_MASS_STORAGE

#debian 6.12.20-1
./scripts/config --module CONFIG_VIDEO_OV5675
./scripts/config --enable CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2

#debian 6.13.5-1
./scripts/config --enable CONFIG_UDMABUF

#debian 6.13.7-1
./scripts/config --module CONFIG_VIRTIO_IOMMU
./scripts/config --enable CONFIG_CRYPTO_ECDSA

#debian 6.13.11-1
./scripts/config --enable CONFIG_KALLSYMS_ALL

#debian 6.14.3-1~exp1
./scripts/config --enable CONFIG_UBSAN
./scripts/config --enable CONFIG_UBSAN_BOUNDS
./scripts/config --enable CONFIG_UBSAN_BOUNDS_STRICT
./scripts/config --enable CONFIG_UBSAN_SHIFT
./scripts/config --disable CONFIG_UBSAN_BOOL
./scripts/config --disable CONFIG_UBSAN_ENUM
./scripts/config --enable CONFIG_FPROBE

#debian 6.14.5-1~exp1
./scripts/config --disable CONFIG_UBSAN_SIGNED_WRAP

#new in v6.14
./scripts/config --module CONFIG_NTSYNC
./scripts/config --module CONFIG_PPS_GENERATOR
./scripts/config --module CONFIG_SENSORS_CRPS
./scripts/config --module CONFIG_SENSORS_TPS25990
./scripts/config --module CONFIG_BD79703
./scripts/config --module CONFIG_OPT4060
./scripts/config --enable CONFIG_FPROBE

#TI: 11.00.01
./scripts/config --enable CONFIG_SRAM_DMA_HEAP
./scripts/config --module CONFIG_CC33XX
./scripts/config --module CONFIG_CC33XX_SDIO
./scripts/config --module CONFIG_VIDEO_IMX390
./scripts/config --enable CONFIG_DMABUF_HEAPS
./scripts/config --enable CONFIG_DMABUF_HEAPS_SYSTEM
./scripts/config --enable CONFIG_DMABUF_HEAPS_CMA
./scripts/config --enable CONFIG_DMABUF_HEAPS_CARVEOUT

#TI: 11.00.02
./scripts/config --module CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
./scripts/config --module CONFIG_DRM_TOSHIBA_TC358762
#./scripts/config --module CONFIG_DRM_CDNS_DSI
#./scripts/config --module CONFIG_DRM_CDNS_DSI_J721E
#./scripts/config --module CONFIG_HWSPINLOCK_OMAP
#./scripts/config --module CONFIG_PWM_OMAP_DMTIMER
#./scripts/config --module CONFIG_PHY_CADENCE_DPHY
./scripts/config --module CONFIG_TI_ECAP_CAPTURE

#TI: 11.00.04
./scripts/config --enable CONFIG_MTD_SPI_NAND
./scripts/config --enable CONFIG_MTD_UBI
./scripts/config --enable CONFIG_TI_K3_UDMA_AM62L
./scripts/config --enable CONFIG_UBIFS_FS
./scripts/config --enable CONFIG_CRYPTO_ZSTD
./scripts/config --enable CONFIG_ZSTD_COMPRESS

#TI: 11.00.06
./scripts/config --module CONFIG_CRYPTO_CRC64_ISO3309
./scripts/config --enable CONFIG_CRYPTO_USER_API_HASH
./scripts/config --enable CONFIG_CRYPTO_DEV_TI_MCRC64
./scripts/config --enable CONFIG_CRYPTO_DEV_TI_DTHEV2
./scripts/config --module CONFIG_TOUCHSCREEN_ILI210X

#TI: 11.00.07
./scripts/config --module CONFIG_SERIAL_8250_PRUSS
./scripts/config --module CONFIG_VIDEO_IMX728
./scripts/config --module CONFIG_VIDEO_OV2312

#TI: 11.00.08
./scripts/config --module CONFIG_VIDEO_OX05B1S

#new in v6.15
./scripts/config --module CONFIG_FWCTL
./scripts/config --module CONFIG_IWLMLD
./scripts/config --module CONFIG_RTW88_8814AU
./scripts/config --module CONFIG_RTW88_8814AE
./scripts/config --module CONFIG_SPI_OFFLOAD_TRIGGER_PWM
./scripts/config --module CONFIG_SENSORS_HTU31
./scripts/config --module CONFIG_SENSORS_INA233
./scripts/config --module CONFIG_HID_UNIVERSAL_PIDFF
./scripts/config --module CONFIG_AD4030
./scripts/config --module CONFIG_AD4851
./scripts/config --module CONFIG_AD7191
./scripts/config --module CONFIG_TI_ADS7138
./scripts/config --module CONFIG_ADIS16550
./scripts/config --module CONFIG_AL3000A
./scripts/config --module CONFIG_APDS9160
./scripts/config --module CONFIG_SI7210

#BeagleBoard.org
./scripts/config --enable CONFIG_MSPM0_I2C
./scripts/config --module CONFIG_SEG_LED_GPIO
./scripts/config --module CONFIG_INPUT_PWM_BEEPER
./scripts/config --module CONFIG_SND_SOC_DAVINCI_MCASP
./scripts/config --module CONFIG_SND_SOC_TLV320AIC3X_I2C
./scripts/config --module CONFIG_WIZNET_W5100
./scripts/config --module CONFIG_WIZNET_W5100_SPI

#Regressions:
./scripts/config --enable CONFIG_MMC_BLOCK

cd ${DIR}/
