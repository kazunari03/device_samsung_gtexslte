$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/gtexswifi/gtexswifi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/gtexswifi/overlay

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/gtexswifi/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Media config
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/media/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
		device/samsung/gtexswifi/init.board.rc:root/init.board.rc \
		device/samsung/gtexswifi/init.sc8830.rc:root/init.sc8830.rc \
		device/samsung/gtexswifi/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
		device/samsung/gtexswifi/init.gtexswifi.rc:root/init.gtexslte.rc \
		device/samsung/gtexswifi/init.gtexswifi_base.rc:root/init.gtexslte_base.rc \
    device/samsung/gtexswifi/init.sc8830_ss.rc:root/init.sc8830_ss.rc \
    device/samsung/gtexswifi/init.gtexswifi.usb.rc:root/init.gtexslte.usb.rc \
    device/samsung/gtexswifi/fstab.sc8830:root/fstab.sc8830 \
		device/samsung/gtexswifi/fstab.sc8830:root/fstab.unknown \
    device/samsung/gtexswifi/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
		device/samsung/gtexswifi/ueventd.sc8830.rc:root/ueventd.unknown.rc \
		device/samsung/gtexswifi/init.rilchip.rc:root/init.rilchip.rc \
		device/samsung/gtexswifi/init.rilcommon.rc:root/init.rilcommon.rc \
		device/samsung/gtexswifi/init.wifi.rc:root/init.wifi.rc \
		device/samsung/gtexswifi/init.dhcp.rc:root/init.dhcp.rc \
		device/samsung/gtexswifi/apns-conf.xml:system/etc/apns-conf.xml \
		device/samsung/gtexswifi/bluetooth:system/etc/bluetooth \
		device/samsung/gtexswifi/init.rc:root/init.rc \

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(LOCAL_PATH)/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Codecs
# Codecs
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_apedec \
	libstagefright_soft_imaadpcmdec \
	libstagefright_soft_mjpgdec \
	libstagefright_sprd_mp3dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec

PRODUCT_PROPERTY_OVERRIDES += \
		persist.ttydev=ttyVUART0 \
		ro.sf.lcd_density=213 \
		ro.sf.hwrotation=180 \
		ro.opengles.version=131072 \
		ro.product.hardware=SS_SHARKLS \
		ro.product.modem.mode=GSM,EDGE,TD-SCDMA,WCDMA,TD-LTE,FDD-LTE \
		ro.product.partitionpath=/dev/block/platform/sdio_emmc/by-name/ \
		ro.adb.secure=0 \
		ro.secure=0 \
		persist.sys.usb.config=mtp,adb

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
		ro.adb.secure=0 \
		ro.secure=0 \
		persist.sys.usb.config=mtp,adb \
		telephony.lteOnCdmaDevice=0 \
		persist.radio.apm_sim_not_pwdn=1 \
		persist.radio.add_power_save=1 \
		rild.libpath=/system/lib/libsec-ril.so

# Graphics
PRODUCT_PACKAGES += \
	libGLES_mali \
	memtrack.sc8830 \
	gralloc.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
	libmemoryheapion \
	libion_sprd \
	libstagefright_shim \
	libgps_shim

# FM radio
PRODUCT_PACKAGES += \
	FMRadio \
	radio.fm.default \
	fm.sc8830

# PowerHAL
PRODUCT_PACKAGES += \
	power.sc8830 \
	degas-mkbootimg \

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default \
	audio.a2dp.default

# Bluetooth
PRODUCT_PACKAGES += \
	libbluetooth_jni

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# gps
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/gps/gps.xml:system/etc/gps.xml

# Media config
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/media/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml \
	$(LOCAL_PATH)/tiny_hw.xml \
	$(LOCAL_PATH)/audio_hw.xml \
	$(LOCAL_PATH)/audio_para \

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Audio
PRODUCT_PACKAGES += \
	audio.primary.sc8830 \
	audio_policy.sc8830 \
	audio.r_submix.default \
	audio.usb.default \
	audio_vbc_eq \
	libaudio-resampler \
	libatchannel \
	libatchannel_wrapper \
	libtinyalsa \
	libeng-audio

# Wifi
PRODUCT_PACKAGES += \
	wpa_supplicant \
	hostapd \

# Graphics
PRODUCT_PACKAGES += \
	libmemtrack \

# Permissions
PERMISSION_XML_FILES := \
	frameworks/native/data/etc/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.midi.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

	# enable Google-specific location features,
	# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# Dalvik Heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

PRODUCT_NAME := full_gtexswifi
PRODUCT_DEVICE := gtexswifi
