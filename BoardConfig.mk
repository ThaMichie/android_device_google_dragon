#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a53
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_VARIANT := cortex-a53.a57
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_BOOTLOADER  := true

BOARD_FLASH_BLOCK_SIZE             := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE     := 26738688
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 26767360
BOARD_CACHEIMAGE_PARTITION_SIZE    := 419430400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10099646976
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3758096384 
BOARD_VENDORIMAGE_PARTITION_SIZE   := 268435456
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR             := vendor

# Bootloader versions
TARGET_BOARD_INFO_FILE := device/google/dragon/board-info.txt

# Manifest
DEVICE_MANIFEST_FILE := device/google/dragon/hidl/manifest.xml
DEVICE_MATRIX_FILE   := device/google/dragon/hidl/compatibility_matrix.xml

# Kernel
BOARD_KERNEL_BASE           := 0x10000000
BOARD_KERNEL_PAGESIZE       := 2048
KERNEL_TOOLCHAIN            := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-gnu-6.4.1/bin
KERNEL_TOOLCHAIN_PREFIX     := aarch64-linux-gnu-
TARGET_KERNEL_SOURCE        := kernel/google/tegra
TARGET_KERNEL_CONFIG        := lineageos_dragon_defconfig
TARGET_LINUX_KERNEL_VERSION := 3.18
TARGET_KERNEL_ARCH          := arm64
TARGET_KERNEL_HEADER_ARCH   := arm64
BOARD_KERNEL_IMAGE_NAME     := Image.fit

# Audio
BOARD_SUPPORT_NVOICE      := true
BOARD_SUPPORT_NVAUDIOFX   := true 
BOARD_USES_GENERIC_AUDIO  := false
BOARD_USES_ALSA_AUDIO     := true
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/google/dragon/bluetooth/vnd_dragon.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/google/dragon/bluetooth

# Graphics
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true
BOARD_USES_DRM_HWCOMPOSER := true
BOARD_DRM_HWCOMPOSER_BUFFER_IMPORTER := nvidia-gralloc
BOARD_USES_LIBDRM := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_FORCES_DRM_HWC1 := true

PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Odm permissions
TARGET_FS_CONFIG_GEN += device/google/dragon/config.fs

# Recovery
TARGET_RECOVERY_FSTAB := device/google/dragon/fstab.dragon

# Security Patch Level
VENDOR_SECURITY_PATCH := 2019-06-05

# Sepolicy
BOARD_SEPOLICY_DIRS += device/google/dragon/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/hw/camera.dragon.so|libshim_camera.so

# Treble
PRODUCT_VENDOR_MOVE_ENABLED := true
	
# Wifi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
