#!/bin/bash

[[ $(whoami) == jenkins ]] && IS_JENKINS=true && read() { :; } && echo() { :; }

BOLD="\033[1m"
export KBUILD_BUILD_HOST=ThePASIV
export KBUILD_BUILD_USER=SamarV-121
export TARGET_UNOFFICIAL_BUILD_ID=SamarV-121
export LINEAGE_VERSION_APPEND_TIME_OF_DAY=true

# GAPPS
echo -e "$BOLD"Press F to include GAPPS in build.
read -t5 -r GAPPS
[[ $GAPPS == F ]] && export WITH_GAPPS=true

# DEBUGGING (https://github.com/SamarV-121/android_vendor_extra/blob/lineage-18.0/product.mk#7)
echo -e "$BOLD"Press F to disable DEBUGGING
read -t5 -r DEBUGGING
[[ $DEBUGGING != F ]] && export WITH_DEBUGGING=true

# CCACHE
echo -e "$BOLD"Press F to disable CCACHE
read -t5 -r CCACHE
if [[ $CCACHE != F ]]; then
	export USE_CCACHE=1
	export CCACHE_EXEC=/usr/bin/ccache
	ccache -M 50G 1>/dev/null
	ccache -o compression=true
fi
echo -e "$BOLD"Press C to clear CCACHE
read -t5 -r CCACHE
[[ $CCACHE == C ]] && cache -C

# NUKE OUT
echo -e "$BOLD"Press F to nuke outdir
read -t5 -r CLEAN
[[ $CLEAN == F ]] && rm -rf out

# ROM VENDOR
echo -e ""$BOLD"Type lunch command (default: lineage)"
read -t10 -r ROM_VENDOR
[[ -z $ROM_VENDOR ]] && ROM_VENDOR=lineage

# BUILD TYPE
echo -e ""$BOLD"Choose build type (default: userdebug)"
read -t10 -r BUILD_TYPE
[[ -z $BUILD_TYPE ]] && BUILD_TYPE=userdebug

# TARGET COMMAND
echo -e ""$BOLD"Type target command (default: bacon)"
read -t10 -r TARGET_CMD
[[ -z $TARGET_CMD ]] && TARGET_CMD=bacon

source build/envsetup.sh

# DEVICE CODENAME(S)
if [[ -z "$*" ]]; then
	echo -e ""$BOLD"Enter device name(s)"
	read -r DEVICES
else
	DEVICES="$*"
fi

unset -f echo # Restore echo

set -e # Bail out if any process fails
COUNT_DEVICES=$(echo "$DEVICES" | wc -w)
while [ $COUNT_DEVICES -gt 0 ]; do
	DEVICE=$(tac -s' ' <<<"$DEVICES" | xargs | cut -d " " -f"$COUNT_DEVICES")
	lunch "${ROM_VENDOR}"_"$DEVICE"-"${BUILD_TYPE}"
	mka installclean
	mka "$TARGET_CMD" -j$(nproc --all) 2>&1 | tee build_"$DEVICE".log
	COUNT_DEVICES=$((COUNT_DEVICES - 1))
done

if [[ $IS_JENKINS != true ]]; then
echo -e "$BOLD"Press F to flash the build
read -r FLASH
[[ $FLASH == F ]] && eat
fi
