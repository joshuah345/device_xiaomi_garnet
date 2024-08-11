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