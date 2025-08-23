A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    system_dlkm \
    vendor \
    dtbo \
    init_boot \
    vbmeta \
    odm \
    system \
    vbmeta_system \
    boot \
    product \
    vendor_dlkm \
    system_ext \
    vendor_boot 

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true 

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti.recovery \
    bootctrl.parrot.recovery 

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd 

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service 

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true 

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/a36xq/prebuilt/modules,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(LOCAL_PATH)/prebuilt/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
