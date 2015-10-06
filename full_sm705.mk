$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

$(call inherit-product, device/smartisan/sm705/device.mk)
$(call inherit-product-if-exists, vendor/smartisan/sm705/sm705-vendor.mk)

PRODUCT_NAME := full_sm705
PRODUCT_DEVICE := sm705
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on Smartisan T1
PRODUCT_MANUFACTURER := Smartisan
