#!/bin/sh

emulator -avd avd-19 -no-skin -no-audio -no-window &
android-wait-for-emulator
adb shell input keyevent 82 &
