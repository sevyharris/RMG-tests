#!/bin/bash

export BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
echo "Local tests base dir: "$BASE_DIR

# Figure out OS
if [[ $MACHTYPE == *"apple"* ]]; then
	export CURRENT_OS="mac"
elif [[ $MACHTYPE == *"linux"* ]]; then
	export CURRENT_OS="linux"
else
	echo "$MACHTYPE not supported. Exiting..."
	exit 0
fi
echo "Current OS: "$CURRENT_OS

export RMG_TESTING_BRANCH=$1
export RMGDB_TESTING_BRANCH=$2
export JOBS=$3
export DATA_DIR=$4

echo "Testing RMG-Py Branch: "$RMG_TESTING_BRANCH
echo "Testing RMG-database Branch: "$RMGDB_TESTING_BRANCH
echo "Testing Jobs: "$JOBS

. $BASE_DIR/color_define.sh
. $BASE_DIR/local_tests/install_local.sh
. $BASE_DIR/version_summary.sh

if [ $JOBS == "all" ]; then
	. $BASE_DIR/local_tests/run_local.sh eg1 no
	. $BASE_DIR/local_tests/run_local.sh eg3 no
	. $BASE_DIR/local_tests/run_local.sh eg5 no
	. $BASE_DIR/local_tests/run_local.sh eg6 no
	. $BASE_DIR/local_tests/run_local.sh eg7 no
	. $BASE_DIR/local_tests/run_local.sh NC no
	. $BASE_DIR/local_tests/run_local.sh MCH  yes
	. $BASE_DIR/local_tests/run_local.sh solvent_hexane no
	. $BASE_DIR/local_tests/run_local.sh methane no
else
	. $BASE_DIR/local_tests/run_local.sh $JOBS no
fi

. $BASE_DIR/local_tests/clean_up.sh