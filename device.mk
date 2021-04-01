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

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, build/target/product/vboot.mk)

$(call inherit-product, vendor/google/dragon/device-vendor.mk)
$(call inherit-product, vendor/google/dragon-common/device-vendor.mk)

# System properties
include $(LOCAL_PATH)/system_prop.mk

PRODUCT_CHARACTERISTICS  := tablet,nosdcard
PRODUCT_AAPT_CONFIG      := normal large xlarge
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT     := 2560
TARGET_SCREEN_WIDTH      := 1800

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/google/dragon/overlay
	
# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/google/dragon \
    external/mesa3d

# Init related
PRODUCT_PACKAGES += \
    fstab.dragon \
    init.dragon.rc \
    init.dragon.usb.rc \
    init.recovery.dragon.rc
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dump_bq25892.sh:system/bin/dump_bq25892.sh \
    $(LOCAL_PATH)/touchfwup.sh:system/bin/touchfwup.sh \
    $(LOCAL_PATH)/init.dragon.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.dragon.rc \
    $(LOCAL_PATH)/init.dragon.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.dragon.usb.rc \
    $(LOCAL_PATH)/init.recovery.dragon.rc:recovery/root/init.recovery.dragon.rc \
    $(LOCAL_PATH)/init_regions.sh:system/bin/init_regions.sh \
    $(LOCAL_PATH)/init_renderer.sh:system/bin/init_renderer.sh \
    $(LOCAL_PATH)/tune-thermal-gov.sh:system/bin/tune-thermal-gov.sh \
    $(LOCAL_PATH)/ueventd.dragon.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    $(LOCAL_PATH)/speakerdsp.ini:system/etc/cras/speakerdsp.ini \
    $(LOCAL_PATH)/bcmdhd.cal:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/bcmdhd.cal \
    $(LOCAL_FSTAB):$(TARGET_COPY_OUT_RAMDISK)/fstab.dragon \
    $(LOCAL_FSTAB):$(TARGET_COPY_OUT_VENDOR)/etc/fstab.dragon	
    
# Key layouts
PRODUCT_PACKAGES += \
    device/google/dragon/dragon-keypad.kl:system/usr/keylayout/dragon-keypad.kl

# Media config
PRODUCT_PACKAGES += \
    media_codecs.xml \
    media_codecs_performance.xml \
    media_profiles_V1_0.xml
    
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/enctune.conf:$(TARGET_COPY_OUT_VENDOR)/etc/enctune.conf \
    $(LOCAL_PATH)/enctune.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/enctune.conf
	
# Audio
PRODUCT_PACKAGES += \
    libaudio-resampler \
    audio.primary.dragon \
    sound_trigger.primary.dragon \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.usb.default \
    audio.r_submix.default \
    audio_effects.xml \
    audio_policy_configuration.xml \
    audio_policy_configuration_bluetooth_legacy_hal.xml \
    audio_policy_volumes_drc.xml \
    mixer_paths_0.xml \
    a2dp_audio_policy_configuration.xml \
    bluetooth_audio_policy_configuration.xml \
    usb_audio_policy_configuration.xml \
    r_submix_audio_policy_configuration.xml \
    default_volume_tables.xml \
    audio.bluetooth.default
    
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/audio_policy_volumes_drc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes_drc.xml \
    $(LOCAL_PATH)/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/mixer_paths_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/BCM4354_003.001.012.0443.0863.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/bcm4350c0.hcd       
 
# Graphics
BOARD_GPU_DRIVERS := tegra
BOARD_USES_LIBDRM := true
ENABLE_LIBDRM := true
NVRM_GPU_SUPPORT_NOUVEAU := 1
NV_GPU_USE_SYNC_FD := 1
USE_DRM_HWCOMPOSER := 1

PRODUCT_PACKAGES += \
    f54test \
    libvulkan \
    hwcomposer.dragon \
    libdrm \
    rmi4update \
    rmihidtool

# HIDL
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

include $(LOCAL_PATH)/hidl/hidl.mk

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-lite-vendorcompat

# USB accessory 
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory    
   
# Vendor seccomp policy files for media components:
PRODUCT_COPY_FILES += \
    device/google/dragon/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/google/dragon/seccomp_policy/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# WiFi
PRODUCT_PACKAGES += \
    hostapd \
    wificond \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf \
    wifi_scan_config.conf
