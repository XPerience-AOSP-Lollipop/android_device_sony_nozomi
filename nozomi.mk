# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Inherit the fuji-common definitions
$(call inherit-product, device/sony/fuji-common/fuji.mk)

# Inherit the proprietary counterpart
$(call inherit-product-if-exists, vendor/sony/nozomi/nozomi-vendor.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/nozomi/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# USB function switching
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/config/init.semc.usb.rc:root/init.semc.usb.rc

PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
		$(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# Recovery bootstrap (device-specific part)
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/recovery/bootrec-device:root/sbin/bootrec-device \
		$(LOCAL_PATH)/recovery.fstab:root/recovery.fstab

$(call inherit-product, build/target/product/full.mk)

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/config/atdaemon.kl:system/usr/keylayout/atdaemon.kl \
		$(LOCAL_PATH)/config/clearpad.kl:system/usr/keylayout/clearpad.kl \
		$(LOCAL_PATH)/config/clearpad.idc:system/usr/idc/clearpad.idc \
		$(LOCAL_PATH)/config/fuji-keypad.kl:system/usr/keylayout/fuji-keypad.kl \
		$(LOCAL_PATH)/config/gpio-key.kl:system/usr/keylayout/gpio-key.kl \
		$(LOCAL_PATH)/config/keypad-pmic-fuji.kl:system/usr/keylayout/keypad-pmic-fuji.kl \
		$(LOCAL_PATH)/config/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
		$(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl

PRODUCT_NAME := full_nozomi
PRODUCT_DEVICE := nozomi
PRODUCT_MODEL := LT26i
PRODUCT_MANUFACTURER := Sony