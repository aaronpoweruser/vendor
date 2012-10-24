PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=4

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Backup Tool
PRODUCT_COPY_FILES += \
     vendor/pa/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/cna/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/cna/prebuilt/common/bin/50-cna.sh:system/addon.d/50-cna.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/cna/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cna/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/cna/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/cna/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/cna/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

PRODUCT_COPY_FILES +=  \
    vendor/pa/prebuilt/common/apk/SuperSU.apk:system/app/SuperSU.apk \
    vendor/pa/prebuilt/common/xbin/su:system/xbin/su

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/cna/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/cna/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/cna/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/cna/prebuilt/common/etc/sysctl.conf:system/bin/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/cna/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check \
    vendor/cna/prebuilt/common/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/cna/prebuilt/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/cna/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/cna/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/cna/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/cna/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/cna/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/cna/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/cna/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/cna/prebuilt/common/etc/init_trigger.disabled:system/etc/init_trigger.disabled \
    vendor/cna/prebuilt/common/etc/liberty.bsh:system/etc/liberty.bsh \
    vendor/cna/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf    

PRODUCT_COPY_FILES += \
    vendor/cna/prebuilt/common/etc/cron/cron.conf:system/etc/cron/cron.conf \
    vendor/cna/prebuilt/common/etc/cron/cron.hourly/00drop_caches:system/etc/cron/cron.hourly/00drop_caches \
    vendor/cna/prebuilt/common/etc/cron/cron.daily/00drop_caches:system/etc/cron/cron.daily/00drop_caches \
    vendor/cna/prebuilt/common/etc/cron/cron.weekly/00drop_caches:system/etc/cron/cron.weekly/00drop_caches \
    vendor/cna/prebuilt/common/etc/cron/cron.hourly/01clear_cache:system/etc/cron/cron.hourly/01clear_cache \
    vendor/cna/prebuilt/common/etc/cron/cron.daily/01clear_cache:system/etc/cron/cron.daily/01clear_cache \
    vendor/cna/prebuilt/common/etc/cron/cron.weekly/01clear_cache:system/etc/cron/cron.weekly/01clear_cache 


# Required packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    SpareParts 

# Optional packages
PRODUCT_PACKAGES += \
    SoundRecorder \
    Basic \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    PhaseBeam 

# Extra Optional packages
PRODUCT_PACKAGES += \
    Trebuchet  

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

#CM-specific init file
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.local.rc:root/init.cm.rc

PRODUCT_PACKAGE_OVERLAYS += vendor/cna/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/cna/overlay/common

# Exclude prebuilt paprefs from builds if the flag is set
ifneq ($(PREFS_FROM_SOURCE),true)
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/common/apk/ParanoidPreferences.apk:system/app/ParanoidPreferences.apk
else
    # Build paprefs from sources
    PRODUCT_PACKAGES += \
        ParanoidPreferences
endif

# ParanoidAndroid common packages
PRODUCT_PACKAGES += \
    ParanoidWallpapers

# device common prebuilts
ifneq ($(DEVICE_COMMON),)
    -include vendor/pa/prebuilt/$(DEVICE_COMMON)/prebuilt.mk
endif

# device specific prebuilts
-include vendor/pa/prebuilt/$(TARGET_PRODUCT)/prebuilt.mk

BOARD := $(subst pa_,,$(TARGET_PRODUCT))

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/pa/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

PRODUCT_COPY_FILES += \
    vendor/cna/prebuilt/common/apk/TitaniumBackup_latest.apk:system/app/TitaniumBackup_latest.apk

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

PA_VERSION_MAJOR = 2
PA_VERSION_MINOR = 5
PA_VERSION_MAINTENANCE = 0

# T-Mobile theme engine
include vendor/cna/config/themes_common.mk

PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 3
PRODUCT_VERSION_MAINTENANCE = 0

VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := $(TARGET_PRODUCT)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.modversion=$(PA_VERSION) \
  ro.pa.family=$(PA_CONF_SOURCE) \
  ro.pa.version=$(VERSION)


TARGET_CUSTOM_RELEASETOOL := vendor/cna/tools/squisher

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JZO54K

ifdef CNA_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.cnaversion=Codename-Android-$(PRODUCT_VERSION_MAJOR)-NIGHTLY-$(shell date +%m%d%Y)
else
    ifdef CNA_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.cnaversion=Codename-Android-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.cnaversion=Cookies&Cream-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)
    #NIGHTLY-$(shell date +%m%d)
    endif
endif

#ifdef CNA_NIGHTLY
#    PRODUCT_PROPERTY_OVERRIDES += \
#        ro.modversion=Codename-Android-$(PRODUCT_VERSION_MAJOR)-NIGHTLY-$(shell date +%m%d%Y)-$(PRODUCT_RELEASE_NAME)
#else
#    ifdef CNA_RELEASE
#        PRODUCT_PROPERTY_OVERRIDES += \
#            ro.modversion=Codename-Android-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(PRODUCT_RELEASE_NAME)
#    else
#        PRODUCT_PROPERTY_OVERRIDES += \
#            ro.modversion=Cookies&Cream-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)
    #NIGHTLY-$(shell date +%m%d)
#    endif
#endif
