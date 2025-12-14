## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := G10

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/InFocus/G10/device_G10.mk)

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := G10
PRODUCT_NAME := cm_G10
PRODUCT_BRAND := InFocus
PRODUCT_MODEL := InFocus M2 3G
PRODUCT_MANUFACTURER := InFocus
