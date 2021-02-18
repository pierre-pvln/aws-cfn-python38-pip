#!/usr/bin/env bash
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_started
source env/bin/activate
python3 ./app/lambda_function_test.py
deactivate
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_ended
