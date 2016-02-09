MKBOOTIMG := device/samsung/matisse/mkbootimg
LZMA_RECO := $(PRODUCT_OUT)/ramdisk-recovery-lzma.img

$(LZMA_RECO): $(recovery_ramdisk)
	gunzip -f < $(recovery_ramdisk) | lzma -e > $@
	
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(LZMA_RECO)
	@echo ----- Making recovery image ------
	$(hide) $(MKBOOTIMG) \
		--kernel $(TARGET_PREBUILT_KERNEL) \
		--ramdisk $(PRODUCT_OUT)/ramdisk-recovery-lzma.img \
		--cmdline "$(BOARD_KERNEL_CMDLINE)" \
		--base $(BOARD_KERNEL_BASE) \
		--pagesize $(BOARD_KERNEL_PAGESIZE) \
		$(BOARD_MKBOOTIMG_ARGS) \
		--dt $(TARGET_PREBUILT_DTB) \
		-o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo ----- Made recovery image -------- $@
	$(hide) tar -C $(PRODUCT_OUT) -H ustar -c recovery.img > $(PRODUCT_OUT)/recovery.tar
	@echo ----- Made recovery image tar -------- $@.tar
	
