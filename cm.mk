# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Resolution
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Assert
TARGET_OTA_ASSERT_DEVICE := E2303,tulip

# Inherit from tulip device
$(call inherit-product, device/sony/tulip/aosp_e2303.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit CM common stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# FingerPrint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=E2303 \
    BUILD_FINGERPRINT=Sony/E2303/E2303:5.0/26.1.A.2.167/938651970:user/release-keys \
    PRIVATE_BUILD_DESC="E2303-user 5.0 26.1.A.2.167 938651970 release-keys"

PRODUCT_NAME := cm_tulip
PRODUCT_DEVICE := tulip
PRODUCT_MODEL := Xperia M4 Aqua

TWRP_COMPILE := false

# Recovery
ifeq ($(TWRP_COMPILE),false)
TARGET_RECOVERY_FSTAB := device/sony/kanuti/rootdir/fstab.kanuti
else
TARGET_RECOVERY_FSTAB = device/sony/kanuti/rootdir/twrp.fstab
endif

ifeq ($(TWRP_COMPILE), true)
#TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_USE_EXTERNAL_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLK_DEV := "/dev/block/bootdevice/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOCK := "footer"
TWRP_EVENT_LOGGING := true 
TW_FLASH_FROM_STORAGE := true
TW_INCLUDE_FUSE_EXFAT := true
TW_NO_USB_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 110
TW_NO_SCREEN_BLANK := true
TW_NO_SCREEN_TIMEOUT := true
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
endif

ifeq ($(TWRP_COMPILE), true)
# TWRP FSTAB
PRODUCT_COPY_FILES += device/sony/kanuti/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab
endif
