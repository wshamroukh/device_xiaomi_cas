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

# Inherit some common Project Infinity-X stuff.
$(call inherit-product, vendor/custom/config/common_full_phone.mk)
ASCP_BUILD_TYPE := UNOFFICIAL
ASCP_MAINTAINER := Waddah
ASCP_MAINTAINER_LINK := https://t.me/+JciK8-z3FqhlOWY1
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_EXCLUDES_AUDIOFX := true
WITH_GMS := true
TARGET_SCREEN_WIDTH = 1080

TARGET_SUPPORTS_BLUR := true
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_INCLUDES_POCKET_MODE := true
TARGET_SUPPORTS_64_BIT_APPS := true

TARGET_USES_MIUI_CAMERA := true
TARGET_BUILD_GOOGLE_TELEPHONY := true
TARGET_SHIPS_GOOGLE_DIALER := true
TARGET_BUILD_DEVICE_AS_WEBCAM := true
BYPASS_CHARGE_SUPPORTED := true

PRODUCT_NAME := cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:13/RKQ1.211001.001/V816.0.4.0.TJJCNXM:user/release-keys
