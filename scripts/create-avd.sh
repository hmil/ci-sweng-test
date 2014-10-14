#!/bin/sh

targetSDK=20
avd_options='--skin WVGA800'

echo "Creating avd for android-$targetSDK"

# must android will ask if we want to create custom hardware with default 'no'.
# so we send a return keypress to say no.
echo '' | android create avd -f -n "avd_android-$targetSDK" -t "android-$targetSDK" --abi android-wear/armeabi-v7a
