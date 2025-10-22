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
EVO_BUILD_TYPE := Unofficial
TARGET_ENABLE_BLUR := true
TARGET_USES_MIUI_CAMERA := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_HAS_UDFPS := true
TARGET_INCLUDE_ACCORD = false
WITH_GMS := true
TARGET_USES_MINI_GAPPS := true
WITH_ADB_INSECURE := true
WITH_SU := true
TARGET_DISABLE_EPPE := true
TARGET_USES_MIUI_CAMERA := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_BUILD_DEVICE_AS_WEBCAM := true
BYPASS_CHARGE_SUPPORTED := true

PRODUCT_NAME := lineage_cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:13/RKQ1.211001.001/V816.0.4.0.TJJCNXM:user/release-keys
