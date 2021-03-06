USE_CAMERA_STUB := true

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/samsung/matisse/init/init_matisse.cpp

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE

# Architecture
TARGET_CPU_VARIANT := krait
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_KERNEL_CMDLINE := androidboot.console=null androidboot.hardware=qcom androidboot.selinux=permissive androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_BOOTIMAGE_PARTITION_SIZE :=		0x105C0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE :=	0x00D00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE :=	0x105C0000
BOARD_USERDATAIMAGE_PARTITION_SIZE :=	0x105C0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/samsung/matisse/zImage
TARGET_PREBUILT_DTB := device/samsung/matisse/dtb.img

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM         := true
TARGET_USERIMAGES_USE_EXT4         := true
TARGET_USERIMAGES_USE_F2FS         := true
BOARD_HAS_NO_MISC_PARTITION        := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR   := true
BOARD_HAS_NO_SELECT_BUTTON         := true
BOARD_SUPPRESS_SECURE_ERASE        := true
BOARD_CUSTOM_BOOTIMG_MK            :=  device/samsung/matisse/bootimg.mk
BOARD_HAS_NO_REAL_SDCARD           := true
RECOVERY_SDCARD_ON_DATA            := true
RECOVERY_GRAPHICS_USE_LINELENGTH   := true

# TWRP specific build flags
TW_THEME := landscape_hdpi
DEVICE_RESOLUTION := 800x1280
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_EXFAT_FUSE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_MTP_DEVICE := "/dev/mtp_usb"
