REPO_DIR=.
SCRIPTS_DIR=$REPO_DIR/scripts

sudo apt-get update
$SCRIPTS_DIR/ci-setup.sh
$SCRIPTS_DIR/ci-tests.sh

