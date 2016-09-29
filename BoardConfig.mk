EXPERIMENTAL_USE_JAVA8 := true

USE_CAMERA_STUB := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/samsung/matisse/init/init_matisse.cpp

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE -DNO_SECURE_DISCARD

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

BOARD_KERNEL_CMDLINE :=  console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_CUSTOM_BOOTIMG_MK :=  device/samsung/matisse/bootimg.mk

KERNEL_TOOLCHAIN_PREFIX      := arm-linux-androideabi-
KERNEL_TOOLCHAIN             := /home/sub77/tc/uber_arm-androideabi-4.9-cortex-a15/bin

#TARGET_KERNEL_SOURCE := kernel/samsung/msm8226
TARGET_KERNEL_CONFIG := twrp_msm8226_defconfig
TARGET_KERNEL_VARIANT_CONFIG := twrp_matisse_defconfig


TARGET_PREBUILT_KERNEL := device/samsung/matisse/zImage
TARGET_PREBUILT_DTB := device/samsung/matisse/dtb.img

BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12759760384 # 12759776768 - 16384 (footer)
BOARD_FLASH_BLOCK_SIZE := 262144

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 38

# TWRP specific build flags
TW_DEVICE_SPECIFIC_VERSION := 3.0.2-2
TW_THEME := landscape_mdpi
RECOVERY_SDCARD_ON_DATA := true
#BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_EXFAT_FUSE := true
#TW_INCLUDE_NTFS_3G := true
TW_MTP_DEVICE := "/dev/mtp_usb"

# Encryption support
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_SAMSUNG := true
#TWRP_INCLUDE_LOGCAT := true
#TARGET_KEYMASTER_WAIT_FOR_QSEE := true
#TARGET_USES_LOGD := true

# MultiROM config
TARGET_RECOVERY_IS_MULTIROM := true
MR_DEVICE_SPECIFIC_VERSION := e
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
include device/samsung/matisse/multirom/MR_REC_VERSION.mk

ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
endif

BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)

#Force populating /dev/block/platform/msm_sdcc.1/by-name
#from the emmc, needed by devices like the HTC One M7
MR_POPULATE_BY_NAME_PATH := "/dev/block/platform/msm_sdcc.1/by-name"

#needed by devices using /dev/block/bootdevice/...
MR_DEV_BLOCK_BOOTDEVICE := false

MR_DEVICE_VARIANTS := matissewifi
MR_DEVICE_VARIANTS += matissewifiue
MR_DEVICE_VARIANTS += matisse3g
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/matisse/multirom/mr_init_devices.c
#DEVICE_RESOLUTION := 1280x800
MR_DPI := mdpi
MR_DPI_MUL := 1
MR_DPI_FONT := 160
MR_FSTAB := device/samsung/matisse/multirom/mrom.fstab
MR_USE_MROM_FSTAB := true
MR_INFOS := device/samsung/matisse/multirom/mrom_infos
MR_KEXEC_MEM_MIN := 0x06200000
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/samsung/matisse/multirom/overlay/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_DEVICE_HOOKS := device/samsung/matisse/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
