#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/opkona

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# Alert slider
PRODUCT_PACKAGES += \
    KeyHandler \
    tri-state-key-calibrate

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Audio
PRODUCT_PACKAGES += \
    audio_amplifier.kona

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_platform_info.xml \
    $(DEVICE_PATH)/audio/mixer_paths-instantnoodle.xml:$(TARGET_COPY_OUT_VENDOR)/19821/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/mixer_paths-instantnoodlep.xml:$(TARGET_COPY_OUT_VENDOR)/19811/etc/mixer_paths.xml

PRODUCT_ODM_PROPERTIES += \
    ro.config.vc_call_vol_steps=9 \
    ro.vendor.audio.sdk.fluencetype=fluence

PRODUCT_SYSTEM_EXT_PROPERTIES += persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# Bluetooth
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.bluetooth.bqr.choppy_threshold=9,6 \
    persist.bluetooth.bqr.event_mask=0x8000000E \
    persist.bluetooth.bqr.min_interval_ms=60000

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera_metadata_shim \
    vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Device ID attestation
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# Display
PRODUCT_SYSTEM_EXT_PROPERTIES += ro.sf.use_latest_hwc_vsync_period=0

TARGET_DISABLE_MEMTRACK := true
TARGET_USES_FOD_ZPOS := true

# Doze
PRODUCT_PACKAGES += \
    ParanoidDoze

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.4-service.clearkey

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.oplus \
    libshims_fingerprint.oplus

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GMS
PRODUCT_PROPERTY_OVERRIDES += ro.opa.device_model_id=ga-oplus-skill-os121-211011

# GPS
LOC_HIDL_VERSION = 4.0

# IFFA
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.sys.fod.pos.x=453 \
    persist.sys.fod.pos.y=1823 \
    persist.sys.fod.size=174

# Init
PRODUCT_PACKAGES += \
    init.oplus.hw.rc \
    init.oplus.hw.rc.recovery \
    init.oplus.rc \
    init.oplus.sh \
    init.overlayfs.rc \
    init.target.rc \
    ueventd.oplus.rc \
    fstab.qcom \
    fstab.qcom.ramdisk

# Manifests
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/manifest.xml \
    $(DEVICE_PATH)/manifest_oplus.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/device_framework_matrix.xml

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.thumbnail.prefer_hw_codecs=true \
    ro.media.recorder-max-base-layer-fps=60

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# Overlays
PRODUCT_PACKAGES += \
    OPlusCarrierConfig \
    OPlusFrameworks \
    OPlusSettings \
    OPlusSystemUI \
    OPlusFrameworksLemonades \
    OPlusSettingsProviderLemonades \
    OPlusSystemUILemonades \
    OPlusFrameworksInstantnoodle \
    OPlusSettingsProviderInstantnoodle \
    OPlusSystemUIInstantnoodle \
    OPlusFrameworksInstantnoodlep \
    OPlusSettingsProviderInstantnoodlep \
    OPlusSystemUIInstantnoodlep \
    OPlusFrameworksKebab \
    OPlusSettingsProviderKebab \
    OPlusSystemUIKebab \

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service \
    android.hardware.power@1.2.vendor \
    vendor.qti.hardware.perf@2.2.vendor

# QTI
TARGET_BOARD_PLATFORM := kona
TARGET_COMMON_QTI_COMPONENTS := \
    all \
    charging \
    dsprpcd \
    keymaster \
    qseecomd

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    libsensorndkbridge \
    sensors.oplus

PRODUCT_COPY_FILES += \
    hardware/oplus/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_11/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_9/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.enable.mag_filter=true \
    ro.sensor.pickup=android.sensor.tilt_detector \
    ro.sensor.pickup.value=0

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/oplus

# Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.oplus

# VNDK
PRODUCT_USE_PRODUCT_VNDK_OVERRIDE := true

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/oneplus/opkona/opkona-vendor.mk)
