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

LOCAL_PATH := $(call my-dir)

BT_IMPL_SYMLINK := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.bluetooth@1.0-impl.so
$(BT_IMPL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	$(hide) ln -sf ./hw/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(BT_IMPL_SYMLINK)

include $(CLEAR_VARS)
LOCAL_MODULE               := p2p_supplicant.conf
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := p2p_supplicant.conf
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := wifi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := p2p_supplicant_overlay.conf
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := p2p_supplicant_overlay.conf
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := wifi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := wpa_supplicant_overlay.conf
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := wpa_supplicant_overlay.conf
LOCAL_VENDOR_MODULE        := true
LOCAL_MODULE_RELATIVE_PATH := wifi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := wifi_scan_config.conf
LOCAL_MODULE_TAGS          := optional
LOCAL_MODULE_CLASS         := ETC
LOCAL_SRC_FILES            := wifi_scan_config.conf
LOCAL_MODULE_RELATIVE_PATH := wifi
LOCAL_VENDOR_MODULE        := true
include $(BUILD_PREBUILT)

