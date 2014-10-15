#!/bin/sh

ant_cmd="ant clean emma debug install test"

# Debug information
echo "printing android-wait-for-emulator"
cat `which android-wait-for-emulator`
# start emulator
emulator -avd avd-19 -no-skin -no-audio -no-window &
android-wait-for-emulator

# start tests
android update project --path Travdroid
android update project --path Travdroid
android update test-project --path TravdroidTest --main ../TravdroidTest
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