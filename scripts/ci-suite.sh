#!/bin/sh

echo "Running with the following env"
env

ant_cmd="ant clean emma debug install test"


# start emulator
echo "starting emulator"
emulator -avd avd-19 -no-skin -no-audio -no-window &
android-wait-for-emulator 2>/dev/null || sleep 40

# start tests
echo "sdk.dir=$ANDROID_HOME" | tee TravdroidTest/local.properties | tee Travdroid/local.properties

cd TravdroidTest
echo "Running $ant_cmd"
result=`$ant_cmd | tee /dev/stderr`
status="$?"
echo "$result"
result=`echo "$result" | grep "FAILURES!!!"`

cd ..
if [ ! -z "$result" ] || [ ! "$status" -eq 0 ]; then
  echo "Errors occured while testing android app"
  exit 1
fi

exit 0