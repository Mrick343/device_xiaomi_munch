#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common euclid stuff.
$(call inherit-product, vendor/euclid/config/common_full_phone.mk)

# Inherit from munch device
$(call inherit-product, device/xiaomi/munch/device.mk)

PRODUCT_NAME := euclid_munch
PRODUCT_DEVICE := munch
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Poco
PRODUCT_MODEL := 22021211RG

EUCLID_BUILD_TYPE := OFFICIAL
EUCLID_MAINTAINER := Mrick343

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="munch-user 13 RKQ1.211001.001 V816.0.9.0.ULMMIXM release-keys" \
    BuildFingerprint=POCO/munch_global/munch:13/RKQ1.211001.001/V816.0.9.0.ULMMIXM:user/release-keys

