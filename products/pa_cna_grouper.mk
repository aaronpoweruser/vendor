$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/cna/config/common_full_hybrid_wifionly.mk)

PRODUCT_COPY_FILES +=  \
    vendor/cna/prebuilt/nexus7/bootanimation.zip:system/media/bootanimation.zip

OVERLAY_TARGET := pa_tvdpi

# Release name
PRODUCT_RELEASE_NAME := Nexus7

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi BUILD_FINGERPRINT="google/nakasi/grouper:4.1.1/JRO03D/402395:user/release-keys" PRIVATE_BUILD_DESC="nakasi-user 4.1.1 JRO03D 402395 release-keys"

PRODUCT_NAME := pa_cna_grouper
PRODUCT_DEVICE := grouper
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
