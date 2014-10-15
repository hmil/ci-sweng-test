#!/bin/sh

env

ant_cmd="ant clean emma debug install test"
adt_sdk=$ANDROID_HOME #`which android.bat | sed "s/\/tools\/android.bat$//"`

echo "sdk location: $adt_sdk"

# Debug information
echo "printing android-wait-for-emulator"
cat `which android-wait-for-emulator`
# start emulator
emulator -avd avd-19 -no-skin -no-audio -no-window &
#android-wait-for-emulator

# start tests
echo "sdk.dir=$adt_sdk" | tee TravdroidTest/local.properties | tee Travdroid/local.properties

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