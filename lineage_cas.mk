#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/xiaomi/cas/device.mk)

# Inherit some common Project Matrixx stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
AXION_MAINTAINER := Waddah
AXION_PROCESSOR := Snapdragon_865
TARGET_DISABLE_EPPE := true
# Camera
PRODUCT_NO_CAMERA := false
AXION_CAMERA_REAR_INFO := 48,48,12,20
AXION_CAMERA_FRONT_INFO := 20
WITH_GMS := true
# CPU
AXION_CPU_SMALL_CORES := 0,1,2,3
AXION_CPU_BIG_CORES := 4,5,6,7
AXION_CPU_BG := 0-1
AXION_CPU_FG := 0-7
# BCR
TARGET_PREBUILT_BCR := false
# Blur
TARGET_ENABLE_BLUR := false
# Bypass Charging
BYPASS_CHARGE_SUPPORTED := true
# LineageOS Prebuilts
TARGET_INCLUDES_LOS_PREBUILTS := true
BYPASS_CHARGE_SUPPORTED := true
AXION_DEBUGGING_ENABLED := true


PRODUCT_NAME := lineage_cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:13/RKQ1.211001.001/V816.0.4.0.TJJCNXM:user/release-keys
