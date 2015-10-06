LOCAL_PATH := $(call my-dir)
WLAN_ROOT := $(LOCAL_PATH)
KERNEL_ROOT := kernel/smartisan/t1

WLAN_CHIPSET := pronto
WLAN_SELECT := CONFIG_PRONTO_WLAN=m

KBUILD_OPTIONS := WLAN_ROOT=$(WLAN_ROOT)

KBUILD_OPTIONS += MODNAME=wlan
KBUILD_OPTIONS += BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)
KBUILD_OPTIONS += $(WLAN_SELECT)

VERSION=$(shell grep -w "VERSION =" $(TOP)/$(KERNEL_ROOT)/Makefile | sed 's/^VERSION = //' )
PATCHLEVEL=$(shell grep -w "PATCHLEVEL =" $(TOP)/$(KERNEL_ROOT)/Makefile | sed 's/^PATCHLEVEL = //' )
SUBLEVEL=$(shell grep -w "SUBLEVEL =" $(TOP)/$(KERNEL_ROOT)/Makefile | sed 's/^SUBLEVEL = //' )

LOCAL_MODULE_CLASS        := DLKM
LOCAL_MODULE              := $(WLAN_CHIPSET)_wlan.ko
LOCAL_MODULE_KBUILD_NAME  := wlan.ko
LOCAL_MODULE_TAGS         := debug
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(TARGET_OUT)/lib/modules/$(WLAN_CHIPSET)

MODULE_WLAN_PRONTO: $(TARGET_PREBUILT_INT_KERNEL)
	$(MAKE) -C $(KERNEL_ROOT) M=../../../$(WLAN_ROOT) O=$(KERNEL_OUT) ARCH=arm CROSS_COMPILE=arm-eabi- modules $(KBUILD_OPTIONS)
	$(shell mkdir -p $(TARGET_OUT)/lib/modules; \
			ln -sf /system/lib/modules/$(WLAN_CHIPSET)/$(WLAN_CHIPSET)_wlan.ko \
				   $(TARGET_OUT)/lib/modules/wlan.ko)
LOCAL_MODULE : MODULE_WLAN_PRONTO

