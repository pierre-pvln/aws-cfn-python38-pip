#!/usr/bin/env bash
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_started
source env/bin/activate
python3 ./app/lambda_function_test.py
python3 ./app/_2_extend_baseline.py
python3 ./app/_3_satistics_output.py
python3 ./app/_4_bsgw_format.py
python3 ./app/_5_sftp_to_server.py
deactivate
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_ended
