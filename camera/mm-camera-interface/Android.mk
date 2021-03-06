LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    LOCAL_CFLAGS += -DUSE_QCOM_OMX_ENCODER_TYPES
endif

LOCAL_SRC_FILES := \
    mm_camera_interface2.c \
    mm_camera_stream.c \
    mm_camera_channel.c \
    mm_camera.c \
    mm_camera_poll_thread.c \
    mm_camera_notify.c \
    mm_camera_sock.c \
    mm_camera_helper.c \
    mm_omx_jpeg_encoder.c

LOCAL_CFLAGS += -D_ANDROID_

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/.. \
    $(LOCAL_PATH)/../inc \
    $(call project-path-for,qcom-media)/mm-core/inc

# Kernel headers
LOCAL_HEADER_LIBRARIES := generated_kernel_headers
LOCAL_HEADER_LIBRARIES += libmmcamera_headers

LOCAL_CFLAGS += -Wall -Werror

LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE := libmmcamera_interface
LOCAL_SHARED_LIBRARIES := libdl libcutils liblog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libmmcamera_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
include $(BUILD_HEADER_LIBRARY)
