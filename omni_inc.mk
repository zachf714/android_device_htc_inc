# Inherit AOSP device configuration for inc.
$(call inherit-product, device/htc/inc/full_inc.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Get APNS
$(call inherit-product, vendor/omni/config/cdma.mk)

# Call Telephony Config
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := omni_inc
PRODUCT_BRAND := verizon_wwe
PRODUCT_DEVICE := inc
PRODUCT_MODEL := Droid Incredible
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=verizon_wwe/inc/inc/inc:2.3.4/GRJ22/185897.2:user/release-keys PRIVATE_BUILD_DESC="4.08.605.2 CL185897 release-keys"


