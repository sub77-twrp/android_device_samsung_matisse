# Release name
PRODUCT_RELEASE_NAME := matisse

$(call inherit-product, build/target/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_COPY_FILES += bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

PRODUCT_PACKAGES += charger_res_images charger

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := matisse
PRODUCT_NAME := omni_matisse
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
