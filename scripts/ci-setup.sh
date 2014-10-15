#!/bin/sh

echo "Running with the following env: "
env

$SCRIPTS_DIR/setup-devices.sh
$SCRIPTS_DIR/setup-backend.sh

