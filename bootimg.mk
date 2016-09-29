MKBOOTIMG := device/samsung/matisse/mkbootimg

FLASH_IMAGE_TARGET ?= $(PRODUCT_OUT)/recovery.tar

ifdef TARGET_RECOVERY_IS_MULTIROM
	FLASH_IMAGE_IMG := twrpm-$(TW_DEVICE_SPECIFIC_VERSION)_$(TARGET_DEVICE)_$(shell date -u +%Y%m%d-%H%M).img
	FLASH_IMAGE_TAR := twrpm-$(TW_DEVICE_SPECIFIC_VERSION)_$(TARGET_DEVICE)_$(shell date -u +%Y%m%d-%H%M).tar
else
	FLASH_IMAGE_IMG := twrp-$(TW_DEVICE_SPECIFIC_VERSION)_$(TARGET_DEVICE)_$(shell date -u +%Y%m%d-%H%M).img
	FLASH_IMAGE_TAR := twrp-$(TW_DEVICE_SPECIFIC_VERSION)_$(TARGET_DEVICE)_$(shell date -u +%Y%m%d-%H%M).tar
endif


ifdef TARGET_PREBUILT_DTB
	BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DTB)
endif

BUILT_RAMDISK_CPIO := $(PRODUCT_OUT)/ramdisk-recovery.cpio
COMPRESS_COMMAND :=  xz --check=crc32 --lzma2=dict=2MiB

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk)
	@echo "------- XZ Compressing recovery ramdisk -------"
	$(hide) $(COMPRESS_COMMAND) "$(BUILT_RAMDISK_CPIO)"
	@echo "------- Making recovery image -------"
	$(hide) $(MKBOOTIMG) \
		--kernel $(TARGET_PREBUILT_KERNEL) \
		--ramdisk $(BUILT_RAMDISK_CPIO).xz \
		--cmdline "$(BOARD_KERNEL_CMDLINE)" \
		--base $(BOARD_KERNEL_BASE) \
		--pagesize $(BOARD_KERNEL_PAGESIZE) \
		$(BOARD_MKBOOTIMG_ARGS) \
		-o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo "------- Made recovery image: $@ -------"
	$(hide) echo -n "SEANDROIDENFORCE" >> $(PRODUCT_OUT)/recovery.img
	@echo "------- Patched recovery image: $@ -------"
	$(hide) tar -C $(PRODUCT_OUT) -H ustar -c recovery.img > $(FLASH_IMAGE_TARGET)
	@echo "------- Made flashable image: $(FLASH_IMAGE_TARGET) -------"
	$(hide) cp $(PRODUCT_OUT)/recovery.img $(PRODUCT_OUT)/$(FLASH_IMAGE_IMG)
	$(hide) cp $(PRODUCT_OUT)/recovery.tar $(PRODUCT_OUT)/$(FLASH_IMAGE_TAR)
	#$(hide) afhu $(PRODUCT_OUT)/$(FLASH_IMAGE_IMG)
	#$(hide) afhu $(PRODUCT_OUT)/$(FLASH_IMAGE_TAR)
	#@echo "------- Uploaded to AFH: $(FLASH_IMAGE_IMG) -------"
	#@echo "------- Uploaded to AFH: $(FLASH_IMAGE_TAR) -------"
