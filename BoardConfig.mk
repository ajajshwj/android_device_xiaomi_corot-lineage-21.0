#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/corot
CONFIGS_PATH := $(DEVICE_PATH)/configs

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := 23078RKD5C,corot,corot_giobal

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_FORCE_PREBUILT_KERNEL := true

BOARD_USES_GENERIC_KERNEL_IMAGE := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true
# BOARD_API_LEVEL := 3

BOARD_KERNEL_BASE := 0x3fff8000
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_TAGS_OFFSET := 0x07c88000
BOARD_DTB_OFFSET := 0x07c88000
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Kernel modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilts/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/prebuilts/modules/modules.load)) 

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 536870912
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 536870912
BOARD_SUBOARD_USES_RECOVERY_AS_BOOT := 
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=
BUILD_WITHOUT_VENDOR := true

TARGET_NO_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := truePER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system product vendor odm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST += system_ext vendor_dlkm odm_dlkm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

BOARD_USES_METADATA_PARTITION := true

ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1258291200
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1258291200
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 524288000
else
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 31457280
endif
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 31457280
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 104857600

# Platform
TARGET_BOARD_PLATFORM := mt6985

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6985
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

BOARD_USES_RECOVERY_AS_BOOT := 
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=

TARGET_NO_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS := --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Build vbmeta_system
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Build vbmeta_vendor
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 3

# VNDK
BOARD_VNDK_VERSION := current

# Bootloader Bootloader
TARGET_BOOTLOADER_BOARD_NAME := corot
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

