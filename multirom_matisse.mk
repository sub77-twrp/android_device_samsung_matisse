# Release name
PRODUCT_RELEASE_NAME := matisse

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000

PRODUCT_COPY_FILES += bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# MultiROM config
TARGET_RECOVERY_IS_MULTIROM := true
#MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
BOARD_MKBOOTIMG_ARGS += --board mrom$(shell date -u +%Y%m%d)-01
MR_DEVICE_VARIANTS := matisse
MR_DEVICE_VARIANTS += matisseue
MR_DEVICE_VARIANTS += matisse3g
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/matisse/multirom/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_MUL := 1
MR_DPI_FONT := 160
MR_FSTAB := device/samsung/matisse/recovery.fstab
MR_USE_MROM_FSTAB := false
MR_INFOS := device/samsung/matisse/multirom/mrom_infos
MR_KEXEC_MEM_MIN := 0x06200000
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBX_8888"
#MR_USE_QCOM_OVERLAY := true
#MR_QCOM_OVERLAY_HEADER := device/samsung/matisse/multirom/mr_qcom_overlay.h
#MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_CONTINUOUS_FB_UPDATE := true
#MR_DEVICE_HOOKS := device/samsung/matisse/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 3

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := matisse
PRODUCT_NAME := multirom_matisse
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T53X
PRODUCT_MANUFACTURER := samsung
