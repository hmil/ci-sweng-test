#!/bin/sh

ant_cmd="ant clean emma debug install test"

# start emulator
emulator -avd avd-19 -no-skin -no-audio -no-window &
android-wait-for-emulator

# start tests
cd TravdroidTest
echo "Running $ant_cmd"
result=`$ant_cmd`
status="$?"
echo "$result"
result=`echo "$result" | grep "FAILURES!!!"`

cd ..
if [ ! -z "$result" ] || [ ! "$status" -eq 0 ]; then
  echo "Errors occured while testing android app"
  exit 1
fi

exit 0