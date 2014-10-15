#!/bin/sh

sudo apt-get install python2.7 python-pip

cd $REPO_DIR/backend
pip install -r requirements.txt

cd $REPO_DIR
