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

# Inherit some common Evolution X stuff.
$(call inherit-product, vendor/evolution/config/common_full_phone.mk)
EVO_BUILD_TYPE := COMMUNITY
TARGET_USES_AOSP_RECOVERY := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_USES_MINI_GAPPS := false
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_INCLUDE_LIVE_WALLPAPERS := false
EXTRA_UDFPS_ANIMATIONS := true
TARGET_INCLUDE_WIFI_EXT := true

PRODUCT_NAME := evolution_cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:12/RKQ1.211001.001/V13.0.6.0.SJJCNXM:user/release-keys
