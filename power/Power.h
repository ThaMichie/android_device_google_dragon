/*
 * Copyright (C) 2017 The Android Open Source Project
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef VENDOR_NVIDIA_HARDWARE_POWER_V1_0_POWER_H
#define VENDOR_NVIDIA_HARDWARE_POWER_V1_0_POWER_H

#include <vendor/nvidia/hardware/power/1.0/IPower.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>
#include <hardware/power.h>
#include "powerhal.h"

namespace vendor {
namespace nvidia {
namespace hardware {
namespace power {
namespace V1_0 {
namespace implementation {

using ::android::hardware::power::V1_0::Feature;
using ::android::hardware::power::V1_0::PowerHint;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;
using ::vendor::nvidia::hardware::power::V1_0::ExtPowerHint;

struct Power : public IPower {
    struct powerhal_info *pInfo;

    // Methods from ::vendor::nvidia::hardware::power::V1_0::IPower follow.

    Return<void> powerHintExt(ExtPowerHint hint, const hidl_vec<int32_t>& data) override;

    // Methods from ::android::hardware::power::V1_0::IPower follow.

    Power();
    status_t registerAsSystemService();

    Return<void> setInteractive(bool interactive) override;
    Return<void> powerHint(PowerHint hint, int32_t data) override;
    Return<void> setFeature(Feature feature, bool activate) override;
    Return<void> getPlatformLowPowerStats(getPlatformLowPowerStats_cb _hidl_cb) override;

    // Methods from ::android::hidl::base::V1_0::IBase follow.

};

}  // namespace implementation
}  // namespace V1_0
}  // namespace power
}  // namespace hardware
}  // namespace nvidia
}  // namespace vendor

#endif  // VENDOR_NVIDIA_HARDWARE_POWER_V1_0_POWER_H
