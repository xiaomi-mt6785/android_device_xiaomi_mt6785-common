#
# Copyright (C) 2019 Potato Open Sauce Project
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/xiaomi/mt6785-common

BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Display
TARGET_SCREEN_DENSITY := 440

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := begonia
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6785
TARGET_BOARD_PLATFORM_GPU := mali-g76mc4

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BIARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00e88000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET     := 0x07c08000
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 2

TARGET_KERNEL_SOURCE := kernel/xiaomi/mt6785
TARGET_KERNEL_CONFIG := begonia_user_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r353983c1

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

BOARD_CUSTOM_DTBOIMG_MK := $(COMMON_PATH)/dtbo/dtbo.mk

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Graphics
TARGET_USES_HWC2 := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 120116445184
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_PRODUCT := system/product
TARGET_COPY_OUT_VENDOR := vendor

TARGET_USERIMAGES_USE_EXT4 := true

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_DEVICE_DIRS += $(COMMON_PATH)
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.mt6785
TARGET_RECOVERY_UI_BLANK_UNBLANK_ON_INIT := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# Security patch level
VENDOR_SECURITY_PATCH := 2021-02-01

# Sepolicy
include device/mediatek/sepolicy/sepolicy.mk

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private
BOARD_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(COMMON_PATH)

# Inherit from the proprietary version
-include vendor/xiaomi/mt6785-common/BoardConfigVendor.mk
