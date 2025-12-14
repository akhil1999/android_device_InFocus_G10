$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/InFocus/G10/G10-vendor-blobs.mk)

DEVICE_PACKAGE_OVERLAYS += device/InFocus/G10/overlay

LOCAL_PATH := device/InFocus/G10
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
	device/InFocus/G10/init.mt6582.rc:root/init.mt6582.rc \
	device/InFocus/G10/init.mt6582.usb.rc:root/init.mt6582.usb.rc \
	device/InFocus/G10/fstab.mt6582:root/fstab.mt6582 \
	device/InFocus/G10/ueventd.mt6582.rc:root/ueventd.mt6582.rc

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_G10
PRODUCT_DEVICE := G10


# shim / symbols
PRODUCT_PACKAGES += \
	libshim_xlog

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mass_storage \
ro.bootloader.mode=download \
ro.mount.fs=EXT4 \
ro.persist.partition.support=no

PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/init.goldfish.rc \
    recovery/root/fstab.goldfish
