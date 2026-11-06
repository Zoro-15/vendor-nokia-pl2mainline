#
# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

VENDOR_PATH := vendor/nokia/PL2_mainline

# VINTF Device Manifest
DEVICE_MANIFEST_FILE += $(VENDOR_PATH)/proprietary/etc/vintf/manifest.xml

# A/B OTA Partitions
AB_OTA_PARTITIONS += \
    abl \
    bluetooth \
    cda \
    cmnlib \
    cmnlib64 \
    devcfg \
    dsp \
    hidden \
    hyp \
    keymaster \
    mdtp \
    mdtpsecapp \
    modem \
    nvdef \
    pmic \
    rpm \
    splash \
    systeminfo \
    tz \
    vbmeta \
    xbl

