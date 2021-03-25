#!/usr/bin/env bash
cd /home/ubuntu
su ubuntu
echo ${SUDO_USER:-${USER}} >/home/ubuntu/install_user.txt

# create required folders
DIR="/home/ubuntu/input/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR does not exist. #
  mkdir --parents "$DIR"
fi

DIR="/home/ubuntu/output/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR does not exist. #
  mkdir --parents "$DIR"
fi

DIR="/home/ubuntu/polygons/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR does not exist. #
  mkdir --parents "$DIR"
fi

# get the polygons
git clone https://github.com/pierre-pvln/myPolygons.git /home/ubuntu/polygons

# install python
sudo apt-get install python3-pip -y
sudo apt-get install python3-venv -y
python3 -m pip install --user --upgrade pip
python3 -m venv env
source env/bin/activate
python3 -m pip install -r /home/ubuntu/requirements.txt
python3 -m pip freeze >/home/ubuntu/as_build.txt
deactivate
