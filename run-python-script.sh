#!/usr/bin/env bash
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_started
source env/bin/activate
stop=0
cd ~/app

echo Running script 1
echo ================
python3 lambda_function_test.py
if [ -z "$?" ]; then stop=1; fi

if [ -z $stop ]
then
    echo Running script 2
    echo ================
    python3 _2_extend_baseline.py
    if [ -z "$?" ]; then stop=1; fi
fi

if [ -z $stop ]
then
    echo Running script 3
    echo ================
    python3 _3_satistics_output.py
    if [ -z "$?" ]; then stop=1; fi
fi

if [ -z $stop ]
then
    echo Running script 4
    echo ================
    python3 _4_bsgw_format.py
    if [ -z "$?" ]; then stop=1; fi
fi

if [ -z $stop ]
then
    echo Running script 5
    echo ================
    python3 _5_sftp_to_server.py
    if [ -z "$?" ]; then stop=1; fi
fi

deactivate
cd ~/app
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_ended
