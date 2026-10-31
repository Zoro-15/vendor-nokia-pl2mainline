#
# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

VENDOR_PATH := vendor/nokia/PL2_mainline

# Copy vendor configuration and authentic OEM firmware files
PRODUCT_COPY_FILES += \
    $(VENDOR_PATH)/proprietary/etc/fstab.nokia-pl2:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.nokia-pl2 \
    $(VENDOR_PATH)/proprietary/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(VENDOR_PATH)/proprietary/etc/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
    $(VENDOR_PATH)/proprietary/etc/init/hw/init.nokia-pl2.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.nokia-pl2.rc \
    $(VENDOR_PATH)/proprietary/etc/init/hw/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc \
    $(VENDOR_PATH)/proprietary/etc/init/use_memfd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/use_memfd.rc \
    $(VENDOR_PATH)/proprietary/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest.xml \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/a508_zap.mdt \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/a508_zap.b00 \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/a508_zap.b01 \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/a508_zap.b02 \
    $(VENDOR_PATH)/proprietary/firmware/a530_pm4.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/a530_pm4.fw \
    $(VENDOR_PATH)/proprietary/firmware/a530_pfp.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/a530_pfp.fw \
    $(VENDOR_PATH)/proprietary/firmware/a530_pm4.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a530_pm4.fw \
    $(VENDOR_PATH)/proprietary/firmware/a530_pfp.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a530_pfp.fw \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a508_zap.mdt \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a508_zap.b00 \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a508_zap.b01 \
    $(VENDOR_PATH)/proprietary/firmware/a508_zap.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a508_zap.b02

# Adreno 508 Workarounds & Mainline Vendor Properties
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware=nokia-pl2 \
    vendor.mesa.fd.mesa.debug=sysmem \
    vendor.minigbm.avoid_ubwc=true \
    ro.hardware.egl=mesa \
    sys.usb.controller=a800000.usb \
    vendor.usb.controller=a800000.usb \
    ro.hardware.gralloc=minigbm \
    ro.opengles.version=196609 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.has_wide_color_display=false \
    ro.surface_flinger.has_HDR_display=false \
    ro.surface_flinger.use_color_management=false

