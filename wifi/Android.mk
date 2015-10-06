# Android makefile for the WLAN Module

WLAN_CHIPSET := pronto
WLAN_SELECT := CONFIG_PRONTO_WLAN=m

LOCAL_PATH := $(call my-dir)

WLAN_BLD_DIR := vendor/qcom/opensource/wlan
MODULE_PATH := $(WLAN_BLD_DIR)/prima

# Build wlan.ko as either prima_wlan.ko or pronto_wlan.ko
###########################################################

# This is set once per LOCAL_PATH, not per (kernel) module
KBUILD_OPTIONS := WLAN_ROOT=../../../$(WLAN_BLD_DIR)/prima
# We are actually building wlan.ko here, as per the
# requirement we are specifying <chipset>_wlan.ko as LOCAL_MODULE.
# This means we need to rename the module to <chipset>_wlan.ko
# after wlan.ko is built.
KBUILD_OPTIONS += MODNAME=wlan
KBUILD_OPTIONS += BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)
KBUILD_OPTIONS += $(WLAN_SELECT)

VERSION=$(shell grep -w "VERSION =" $(TARGET_KERNEL_SOURCE)/Makefile | sed 's/^VERSION = //' )
PATCHLEVEL=$(shell grep -w "PATCHLEVEL =" $(TARGET_KERNEL_SOURCE)/Makefile | sed 's/^PATCHLEVEL = //' )

include $(CLEAR_VARS)
LOCAL_MODULE              := $(WLAN_CHIPSET)_wlan.ko
LOCAL_MODULE_KBUILD_NAME  := wlan.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := false
LOCAL_MODULE_PATH         := $(TARGET_OUT)/lib/modules/$(WLAN_CHIPSET)
include $(LOCAL_PATH)/AndroidKernelModule.mk
###########################################################

#Create symbolic link
$(shell mkdir -p $(TARGET_OUT)/lib/modules; \
	ln -sf /system/lib/modules/$(WLAN_CHIPSET)/$(WLAN_CHIPSET)_wlan.ko \
		   $(TARGET_OUT)/lib/modules/wlan.ko)
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
	ln -sf /persist/WCNSS_qcom_wlan_nv.bin \
		$(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
	ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
		$(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini; \
	ln -sf /persist/.wifi_mac_nv.bin \
		$(TARGET_OUT_ETC)/firmware/wlan/prima/wifi_mac_nv.bin; \
	ln -sf /persist/.wifi_random_mac.bin \
		$(TARGET_OUT_ETC)/firmware/wlan/prima/wifi_random_mac.bin)