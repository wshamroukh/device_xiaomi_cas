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
MATRIXX_BUILD_TYPE := Unofficial
MATRIXX_CHIPSET := SM8250
MATRIXX_BATTERY := 4500mAh
MATRIXX_DISPLAY := 1080x2340
TARGET_HAS_UDFPS := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2340
TARGET_ENABLE_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_64_BIT_APPS := true
WITH_SU := true
WITH_GMS := true
WITH_GMS_COMMS_SUITE := true
TARGET_SUPPORTS_WALLEFFECT := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
# Disable ADB authentication
WITH_ADB_INSECURE := true
# Nuke AudioFX
TARGET_EXCLUDES_AUDIOFX := true
# Nuke Auxio
TARGET_EXCLUDES_AUXIO := true
# DeviceAsWebcam
TARGET_BUILD_DEVICE_AS_WEBCAM := true


PRODUCT_NAME := lineage_cas
PRODUCT_DEVICE := cas
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2007J1SC
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Xiaomi/cas/cas:13/RKQ1.211001.001/V816.0.4.0.TJJCNXM:user/release-keys
