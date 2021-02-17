#!/usr/bin/env bash
touch start_at_$( date '+%Y-%m-%d_%H-%M-%S' )
source env/bin/activate
python3 lambda_function_test.py
deactivate
touch end_at_$( date '+%Y-%m-%d_%H-%M-%S' )
