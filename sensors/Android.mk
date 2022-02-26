LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.sensors@2.0-service.multihal.x2
LOCAL_MODULE_STEM := android.hardware.sensors@2.0-service.multihal
LOCAL_MODULE_TAGS  := optional
LOCAL_REQUIRED_MODULES := android.hardware.sensors@2.0-service-multihal.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := \
    HalProxy.cpp \
    HalProxyCallback.cpp \
    service.cpp

LOCAL_SHARED_LIBRARIES := \
    android.hardware.sensors@2.0 \
    android.hardware.sensors@2.0-ScopedWakelock \
    android.hardware.sensors@2.1 \
    libcutils \
    libfmq \
    libhidlbase \
    liblog \
    libpower

LOCAL_STATIC_LIBRARIES := \
    android.hardware.sensors@1.0-convert \
    libbase \
    libutils

LOCAL_HEADER_LIBRARIES := \
    android.hardware.sensors@2.X-multihal.header \
    android.hardware.sensors@2.X-shared-utils

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.sensors@2.0-service-multihal.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init
LOCAL_SRC_FILES := android.hardware.sensors@2.0-service-multihal.rc
include $(BUILD_PREBUILT)