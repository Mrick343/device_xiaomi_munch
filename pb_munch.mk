#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_RELEASE_NAME := munch

DEVICE_PATH := device/xiaomi/$(PRODUCT_RELEASE_NAME)


# Inherit from munch device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit any OrangeFox-specific settings
$(call inherit-product-if-exists, $(DEVICE_PATH)/fox_mikona.mk)


# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pb_munch
PRODUCT_DEVICE := munch
PRODUCT_BRAND := POCO
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := POCO F4

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi


MAINTAINER := Mrick343
