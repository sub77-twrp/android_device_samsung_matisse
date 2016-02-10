MKBOOTIMG := device/samsung/matisse/mkbootimg
LZMA_RECO := $(PRODUCT_OUT)/ramdisk-recovery-lzma.img
PSWD=1qgyKbuJ4t19
d=`date +%y%m%d-%H%M`

$(LZMA_RECO): $(recovery_ramdisk)
	$(hide) gunzip -f < $(recovery_ramdisk) | lzma -e > $@

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(LZMA_RECO)
	@echo ----- Making recovery image ------ $@
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
	$(hide) echo -n "SEANDROIDENFORCE" >> $(PRODUCT_OUT)/recovery.img
	$(hide) tar -C $(PRODUCT_OUT) -H ustar -c recovery.img > $(PRODUCT_OUT)/recovery.tar
	$(hide) cp $(PRODUCT_OUT)/recovery.tar $(PRODUCT_OUT)/twrpm-3.0.0-0_matisse_$d.tar
	$(hide) cp $(PRODUCT_OUT)/recovery.img $(PRODUCT_OUT)/twrpm-3.0.0-0_matisse_$d.img
	@echo ----- Made recovery image tar -------- $@.tar
	$(hide) curl -T $(PRODUCT_OUT)/twrpm-*.img -u sub77:${PSWD} ftp://uploads.androidfilehost.com --ftp-create-dirs
	$(hide) curl -T $(PRODUCT_OUT)/twrpm-*.tar -u sub77:${PSWD} ftp://uploads.androidfilehost.com --ftp-create-dirs
	$(hide) cd ../../../.. \

#	 $(hide) rm $(PRODUCT_OUT)/recovery/root/multirom \
#    $(hide) rm $(PRODUCT_OUT)/recovery/root/trampoline \
#    @echo ----- Compressing ramdisk ------ \
#    @echo ----- Removed SEANDROIDENFORCE -------- $@
#    @echo ----- Upload to AFH complete --------
