	
LOCAL_PATH := device/smartisan/sm705

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
$(call inherit-product-if-exists, hardware/qcom/msm8x74/msm8x74.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8x74/msm8x74-gpu-vendor.mk)

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/files/root/fstab.qcom:root/fstab.qcom \
	$(LOCAL_PATH)/files/root/init.environ.rc:root/init.environ.rc \
    $(LOCAL_PATH)/files/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
	$(LOCAL_PATH)/files/root/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/files/root/init.qcom.rc:root/init.qcom.rc \
		$(LOCAL_PATH)/files/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
			$(LOCAL_PATH)/files/root/init.qcom.usb.sh:root/init.qcom.usb.sh \
		$(LOCAL_PATH)/files/root/init.target.rc:root/init.target.rc \
		$(LOCAL_PATH)/files/root/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
		$(LOCAL_PATH)/files/root/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
		$(LOCAL_PATH)/files/root/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
		$(LOCAL_PATH)/files/root/init.class_main.sh:root/init.class_main.sh \
		$(LOCAL_PATH)/files/root/init.qcom.ril.sh:root/init.qcom.ril.sh \
		$(LOCAL_PATH)/files/root/init.qcom.sh:root/init.qcom.sh \
		$(LOCAL_PATH)/files/root/init.sensor.sh:root/init.sensor.sh \
		$(LOCAL_PATH)/files/root/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
		$(LOCAL_PATH)/files/root/init.qcom.factory.sh:root/init.qcom.factory.sh \
		$(LOCAL_PATH)/files/system/etc/init.crda.sh:system/etc/init.crda.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
		$(LOCAL_PATH)/files/system/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
	$(LOCAL_PATH)/files/root/init.trace.rc:root/init.trace.rc
	
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml


# GPS
PRODUCT_PACKAGES += \
	gps.msm8974
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/files/system/etc/sec_config:system/etc/sec_config
   $(LOCAL_PATH)/files/system/etc/gps.conf:system/etc/gps.conf

# NFC access control + feature files + configuration
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
#    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
#	$(LOCAL_PATH)/files/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
#	$(LOCAL_PATH)/files/system/etc/libnfc-brcm-20795a10.conf:system/etc/libnfc-brcm-20795a10.conf
# NFC packages
#PRODUCT_PACKAGES += \
#	nfc_nci.sm705 \
#	libnfc-nci \
#    NfcNci \
#    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/system/etc/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf
    $(LOCAL_PATH)/files/system/etc/thermald-8974.conf:system/etc/thermald-8974.conf

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Graphics
PRODUCT_PACKAGES += \
    gralloc.msm8974 \
	copybit.msm8974 \
    libgenlock \
	liboverlay \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    libqdutils \
    libqdMetaData
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/egl.cfg:system/lib/egl/egl.cfg
	
# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/files/system/etc/media_profiles.xml:system/etc/media_profiles.xml
# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    qcmediaplayer \
    libmm-omxcore

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/files/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    audio.primary.msm8974 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/system/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf
	
PRODUCT_PACKAGES += \
    libqomx_core \
    libmmcamera_interface \
    libmmjpeg_interface \
    mm-jpeg-interface-test \
    mm-qcamera-app

PRODUCT_PACKAGES += \
    keystore.msm8974

PRODUCT_PACKAGES += \
    power.qcom

# GPS
PRODUCT_PACKAGES += \
    libloc_adapter \
    libloc_eng \
    libloc_api_v02 \
    libloc_ds_api \
    libloc_core \
    libizat_core \
    libgeofence \
    libgps.utils \
    gps.msm8974 \
    flp.msm8974 \
    liblbs_core \
    flp.conf
	
# Wifi
PRODUCT_PACKAGES += \
	wcnss_service
	#pronto_wlan.ko
PRODUCT_PACKAGES := \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    libion
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory
# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974
# Crda
PRODUCT_PACKAGES += \
    crda \
    linville.key.pub.pem \
    regdbdump \
    regulatory.bin
# Lights
PRODUCT_PACKAGES += \
    lights.msm8974
# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc
# Misc
PRODUCT_PACKAGES += \
    libxml2
# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
	setup_fs
# for off charging mode
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

PRODUCT_PACKAGES += \
    bdAddrLoader

# msm_rng entropy feeder
#PRODUCT_PACKAGES += \
#    qrngd \
#    qrngp

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

# QCOM Perf lib
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so
# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0

# OpenGL ES 3.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15 \
    wlan.driver.ath=0
	
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true
