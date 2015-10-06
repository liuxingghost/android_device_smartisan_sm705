# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product, vendor/cm/config/gsm.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, device/smartisan/sm705/full_sm705.mk)

PRODUCT_RELEASE_NAME := sm705
PRODUCT_NAME := cm_sm705
PRODUCT_BRAND := Smartisan
PRODUCT_MODEL := T1
PRODUCT_MANUFACTURER := Smartisan
