#!/bin/sh
# create-avd.sh
# @author Hadrien Milano <hadrien.milano@epfl.ch>
#
# Creates an avd for the target android sdk

base_name="avd"

if [ -z "$1" ]; then
  cat 1>&2 <<EOF
Usage: create-avd XX [base_name] [options]
 - XX: sdk version to use for this emulator (19 for instance)
 - base_name: name to use for this emulator (default: $base_name)
Creates an AVD named base_name-XX with default hardware configuration running
on armeabi-v7a
EOF
exit 1
fi
target_sdk="$1"
if [ ! -z "$2" ]; then shift; base_name="$1" ; fi
if [ ! -z "$1" ]; then shift; avd_options="$@" ; fi

echo "Creating avd for android-$target_sdk"

# android will ask if we want to create custom hardware with default 'no'.
# so we send a return keypress to say no.
echo 'no' | android create avd --force -n "$base_name-$target_sdk" -t "android-$target_sdk" --abi x86 $avd_options
