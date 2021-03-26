#!/usr/bin/env bash
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_started
source env/bin/activate
continue=true
cd ~/app

if [[ "${continue}" == "true" ]]
then
	echo "[INFO ] Running script 1"
	echo "[INFO ] ================"
	python3 lambda_function_test.py
	if [ !$? -eq 0 ]
		then
			continue=false
			echo "[ERROR] Ending script"
	fi
fi

if [[ "${continue}" == "true" ]]
then
	echo "[INFO ] Running script 2"
	echo "[INFO ] ================"
    python3 _2_extend_baseline.py
	if [ !$? -eq 0 ]
		then
			continue=false
			echo "[ERROR] Ending script"
	fi
fi

if [[ "${continue}" == "true" ]]
then
	echo "[INFO ] Running script 3"
	echo "[INFO ] ================"
    python3 _3_satistics_output.py
	if [ !$? -eq 0 ]
		then
			continue=false
			echo "[ERROR] Ending script"
	fi
fi

if [[ "${continue}" == "true" ]]
then
	echo "[INFO ] Running script 4"
	echo "[INFO ] ================"
    python3 _4_bsgw_format.py
	if [ !$? -eq 0 ]
		then
			continue=false
			echo "[ERROR] Ending script"
	fi
fi

if [[ "${continue}" == "true" ]]
then
	echo "[INFO ] Running script 5"
	echo "[INFO ] ================"
    python3 _5_sftp_to_server.py
	if [ !$? -eq 0 ]
		then
			continue=false
			echo "[ERROR] Ending script"
	fi
fi

deactivate
cd ~/app
touch $( date '+%Y-%m-%d_%H-%M-%S' )_app_ended
