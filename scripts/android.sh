#!/bin/sh

# adt guys thought it would be a good idea to bundle a android.bat for Win platforms
# and a android.sh for linux but not both.
# this scripts allows all scripts to run in git bash on windows as well as natively on linux

a="$@"
if [ "$(uname)" == "Darwin" ]; then
  android "$@"
else
  cmd "/C android $a"
fi
