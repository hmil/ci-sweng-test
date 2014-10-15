#!/bin/sh

ant_cmd="ant clean emma debug install test"


# start emulator
echo "starting emulator"
emulator -avd avd-19 -no-skin -no-audio -no-window &
android-wait-for-emulator 2>/dev/null || sleep 60
adb shell input keyevent 82 &

# start tests
echo "sdk.dir=$ANDROID_HOME" | tee TravdroidTest/local.properties | tee Travdroid/local.properties
cd $REPO_DIR/TravdroidTest
echo "Running $ant_cmd"
result=`$ant_cmd | tee /dev/stderr`

# gather test results
status="$?"
echo "$result"
result=`echo "$result" | grep "FAILURES!!!"`
cd $REPO_DIR

if [ ! -z "$result" ] || [ ! "$status" -eq 0 ]; then
  echo "Errors occured while testing android app"
  exit 1
fi

exit 0
