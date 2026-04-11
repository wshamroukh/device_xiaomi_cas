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

# Inherit some common Project lineage-X stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
LUNARIS_BUILD_TYPE := UNOFFICIAL
TARGET_SUPPORTED_REFRESH_RATES := 60,120
TARGET_CUSTOM_UDFPS := true
WITH_GMS := true
WITH_BCR := true
SURFACE_FLINGER_BOOST := true
WITH_ADB_INSECURE := true
WITH_SU := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_BUILD_DEVICE_AS_WEBCAM := true
BYPASS_CHARGE_SUPPORTED := true
TARGET_BOOT_ANIMATION_RES := 1080
#HBM_SUPPORTED := true
#HBM_NODE := /sys/devices/platform/soc/soc:qcom,dsi-display-primary/hbm"


PRODUCT_NAME := lineage_cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:13/RKQ1.211001.001/V816.0.4.0.TJJCNXM:user/release-keys
