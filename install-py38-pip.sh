#!/usr/bin/env bash
sudo apt-get install python3-pip
python3 -m pip install --user --upgrade pip
python3 -m venv env
source env/bin/activate
python3 -m pip install -r ~/requirements.txt
python3 -m pip freeze >~/as_build.txt
deactivate
