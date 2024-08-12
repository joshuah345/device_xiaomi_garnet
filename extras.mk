# extras typically found in lineage_garnet.mk

# Inherit from the MiuiCamera setup
$(call inherit-product-if-exists, vendor/xiaomi/garnet-miuicamera/products/miuicamera.mk)

# ViPER4Android (if exists)
$(call inherit-product-if-exists, packages/apps/ViPER4AndroidFX/config.mk)

# Do things if GMS added
ifeq ($(strip $(WITH_GMS)),true)

	# import BCR
    $(call inherit-product, vendor/bcr/bcr.mk)

	# rising specific
    TARGET_DEFAULT_PIXEL_LAUNCHER := true
endif

# Include Lawnchair 14 (rising)
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
# -------

ifeq ($(strip $(TARGET_USES_DOLBY)),true)
ifeq ($(strip $(TARGET_DOLBY_VENDOR)),)
  $(warning TARGET_USES_DOLBY is set to true but no type was set. Defaulting to XiaomiDolby...)
  PRODUCT_PACKAGES += \
    XiaomiDolby
else 
ifeq ($(strip $(TARGET_DOLBY_VENDOR)), MOTO)
    $(call inherit-product, vendor/dolby_moto/dolby.mk)
endif
endif
endif

TARGET_USES_DOLBY := true
TARGET_DOLBY_VENDOR := MOTO