#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from cas device
$(call inherit-product, device/xiaomi/cas/device.mk)

# Inherit some common rice stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)


TARGET_BOOT_ANIMATION_RES := 1080
RICE_CHIPSET := Snapdragon 865
RICE_MAINTAINER := WADDAH
SUSHI_BOOTANIMATION := 1080
TARGET_BUILD_GRAPHENEOS_CAMERA := true
TARGET_ENABLE_BLUR := true
TARGET_HAS_UDFPS := true
TARGET_KERNEL_OPTIONAL_LD := false
TARGET_USE_PIXEL_FINGERPRINT := false
TARGET_GAPPS_ARCH := arm64
TARGET_OPTOUT_GOOGLE_TELEPHONY := false
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_SUPPORTS_CALL_RECORDING := true
RICE_OFFICIAL := true
WITH_GMS := true

PRODUCT_NAME := lineage_cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:12/RKQ1.211001.001/V13.0.6.0.SJJCNXM:user/release-keys

