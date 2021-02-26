#!/usr/bin/env bash

# create required folders
DIR="~/input/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR does not exist. #
  mkdir -- parents "$DIR"
fi

DIR="~/output/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR does not exist. #
  mkdir -- parents "$DIR"
fi

DIR="~/polygons/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR does not exist. #
  mkdir -- parents "$DIR"
fi

# get the polygons
git clone https://github.com/pierre-pvln/myPolygons.git ~/polygons

# install python
sudo apt-get install python3-pip -y
sudo apt-get install python3-venv -y
python3 -m pip install --user --upgrade pip
python3 -m venv env
source env/bin/activate
python3 -m pip install -r /home/ubuntu/requirements.txt
python3 -m pip freeze >/home/ubuntu/as_build.txt
deactivate
