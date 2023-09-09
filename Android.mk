#
# Copyright (C) 2023 BlissLabs
#
# Licensed under the GNU General Public License Version 2 or later.
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.gnu.org/licenses/gpl.html
#
LOCAL_PATH := $(call my-dir)

#build lspci
include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wall -Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes -fPIC -fvisibility=hidden \
				-Wno-unused-parameter
LOCAL_SRC_FILES := lspci.c ls-vpd.c ls-caps.c ls-caps-vendor.c ls-ecaps.c \
					ls-kernel.c ls-tree.c ls-map.c common.c
LOCAL_SRC_FILES += $(call all-c-files-under, lib)
LOCAL_SRC_FILES := $(filter-out lib/fbsd-device.c lib/obsd-device.c lib/aix-device.c lib/nbsd-libpci.c \
								lib/darwin.c lib/sylixos-device.c lib/hurd.c lib/win32-cfgmgr32.c \
								lib/win32-kldbg.c lib/win32-sysdbg.c lib/i386-ports.c , $(LOCAL_SRC_FILES))
LOCAL_MODULE := lspci
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libkmod
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_C_INCLUDES:= $(LOCAL_PATH) \
					$(LOCAL_PATH)/lib $(LOCAL_PATH)/include
include $(BUILD_EXECUTABLE)
