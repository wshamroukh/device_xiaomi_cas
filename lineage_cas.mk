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

# Inherit some common Lineage stuff.Add commentMore actions
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
RISING_BUILDTYPE := COMMUNITY
RISING_MAINTAINER := Waddah
TARGET_ENABLE_BLUR := true
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2340
WITH_LINEAGE_CHARGER := true
WITH_GMS := true
TARGET_USES_MINI_GAPPS := true
WITH_ADB_INSECURE := true
WITH_SU := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_BUILD_DEVICE_AS_WEBCAM := true
TARGET_SUPPORTS_64_BIT_APPS := true
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Snapdragon SM8250" \
    RisingMaintainer="Waddah"

PRODUCT_NAME := lineage_cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:13/RKQ1.211001.001/V816.0.4.0.TJJCNXM:user/release-keys
