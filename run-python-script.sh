#!/usr/bin/env bash
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_started
source env/bin/activate
cd ~/app
python3 lambda_function_test.py
python3 _2_extend_baseline.py
python3 _3_satistics_output.py
python3 _4_bsgw_format.py
python3 _5_sftp_to_server.py
deactivate
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_ended
