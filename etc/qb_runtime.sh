#!/system/bin/sh

SELECT_FUNC=$1
EXTRA_ARG=$2
THIS_FILE="qb_runtime.sh"
RED_LOG="\x1b[1;31m"
COLOR_CLEAR="\x1b[0m"
LOG_DEV="/dev/kmsg"

if [ $# != 1 ] ; then
	if [ $# != 2 ] ; then
		(echo "Select Func! - Stop." &> $LOG_DEV)
		return
		exit 0
	fi
fi

function qb_mount_log() {
	(echo "======== Mount Finished ========================================" &> $LOG_DEV)
	(/system/bin/log "======== Mount Finished ========================================")
}


function additional_func() {
	(echo "======== additional_func ========================================" &> $LOG_DEV)
}

if [ $SELECT_FUNC == "qb_mount_log" ]
	then
		qb_mount_log
elif [ $SELECT_FUNC == "additional_func" ]
	then
		additional_func $EXTRA_ARG
else
	(echo "Invalid Func [$SELECT_FUNC]" &> $LOG_DEV)
fi



