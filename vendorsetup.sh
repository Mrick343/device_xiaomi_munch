#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2022 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="munch"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w \"$FDEVICE\")
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   echo "** WARNING **: Always set FOX_BUILD_DEVICE to the device codename before starting to build for any device!"
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

	   export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v28.1.zip
      export FOX_VANILLA_BUILD=1
    	export FOX_ENABLE_APP_MANAGER=1
	   export FOX_VIRTUAL_AB_DEVICE=1
	   export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	   export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	   export FOX_USE_BASH_SHELL=1
	   export FOX_ASH_IS_BASH=1
	   export FOX_USE_TAR_BINARY=1
	   export FOX_USE_XZ_UTILS=1
	   export FOX_USE_LZ4_BINARY=1
	   export FOX_USE_ZSTD_BINARY=1
	   export FOX_USE_DATE_BINARY=1
    	export FOX_DELETE_AROMAFM=1

	# instruct magiskboot v24+ to always patch the vbmeta header when patching the recovery/boot image; do *not* remove!
        export FOX_PATCH_VBMETA_FLAG="1"

	# vendor_boot-as-recovery
	if [ "$FOX_VENDOR_BOOT_RECOVERY" = "1" ]; then
	   export FOX_VARIANT="vBaR"
	fi
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi

# clone kernel & clang
echo "Cloning proton-clang"
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-13.0.0
echo "cloning kernel"
git clone https://github.com/AOSPA/android_kernel_xiaomi_sm8250 --depth=1 kernel/xiaomi/munch


# -------------------------------
# ▶ ADDED: download miui.x509.pem
# -------------------------------
echo "Creating vendor/recovery/security and downloading MIUI x509 key..."
mkdir -p vendor/recovery/security/
cd vendor/recovery/security/
wget -O miui.x509.pem https://gitlab.com/OrangeFox/vendor/recovery/-/raw/fox_12.1/security/miui.x509.pem
cd ../../..
echo "MIUI x509 key downloaded."
# -------------------------------

export ALLOW_MISSING_DEPENDENCIES := true
