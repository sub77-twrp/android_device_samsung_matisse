LOCAL_PATH := $(call my-dir)

ifdef TW_DEVICE_SPECIFIC_VERSION
RECOVERY_IMG := $(PRODUCT_OUT)/twrp-$(TW_DEVICE_SPECIFIC_VERSION)_$(TARGET_DEVICE)_$(shell date -u +%Y%m%d-%H%M).img
RECOVERY_TAR := $(PRODUCT_OUT)/twrp-$(TW_DEVICE_SPECIFIC_VERSION)_$(TARGET_DEVICE)_$(shell date -u +%Y%m%d-%H%M).tar
else
RECOVERY_IMG := $(PRODUCT_OUT)/recovery.img
RECOVERY_TAR := $(PRODUCT_OUT)/recovery.tar
endif
ifdef TARGET_PREBUILT_DTB
#BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DTB)
endif

$(recovery_ramdisk): $(recovery_uncompressed_ramdisk)
	$(call pretty,"Target LZMA ramdisk: $@")
	$(hide) xz --format=lzma --lzma1=dict=16MiB -9 -c < $(recovery_uncompressed_ramdisk) > $@

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_kernel) $(recovery_ramdisk)
	@echo -e ${CL_GRN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@ --ramdisk $(recovery_ramdisk)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
	@echo -e ${CL_GRN}"----- Lying about SEAndroid state to Samsung bootloader ------"${CL_RST}
	$(hide) echo -n "SEANDROIDENFORCE" >> $(INSTALLED_RECOVERYIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	$(hide) tar -C $(PRODUCT_OUT) -H ustar -c recovery.img > $(RECOVERY_TAR)
	$(hide) mv $(PRODUCT_OUT)/recovery.img $(RECOVERY_IMG)
	@echo -e ${CL_CYN}"Made Odin flashable recovery tar: $(RECOVERY_TAR)"${CL_RST}
	@echo -e ${CL_CYN}"Made flashable recovery image: $(RECOVERY_IMG)"${CL_RST}
