#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)


# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/xiaomi/surya/surya-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

-include $(LOCAL_PATH)/system_prop.mk
-include $(LOCAL_PATH)/product_prop.mk

PRODUCT_BUILD_SUPER_PARTITION := false
BOARD_BUILD_PRODUCT_IMAGE := true
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# AAPT config
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.dsi.ant.antradio_library.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti \
    libbtconfigstore

# Camera
PRODUCT_PACKAGES += \
    Snap

# Device Settings
PRODUCT_PACKAGES += \
    XiaomiParts

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/parts/privapp-permissions-parts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-parts.xml

# Display/Graphics
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system

# Doze
PRODUCT_PACKAGES += \
    Doze

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sm6150-wcd9375-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sm6150-wcd9375-snd-card_Button_Jack.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_surya

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    NfcNci \
    SecureElement \
    Tag

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/handheld_core_hardware.xml

# Overlays - override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget 

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.surya

# Product init
PRODUCT_PACKAGES += \
    init.device.rc \
    init.safailnet.rc

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Vendor overlay
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor-overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)) \
    $(LOCAL_PATH)/vendor-overlay/etc/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/vendor-overlay/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml

# WFD
PRODUCT_PACKAGES += \
    libaacwrapper \
    libnl

PRODUCT_BOOT_JARS += \
    WfdCommon

# Thetering offload
PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0

PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

