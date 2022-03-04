#! /system/bin/sh

echo -n "3-1:1.1" > /sys/bus/usb/drivers/usbserial_generic/unbind
adb wait-for-device

# Select timestamp format (busybox or not)
#timestamp_org=`busybox date -Iseconds`
#timestamp=${timestamp_org//:/-}
timestamp=`date +%Y-%m-%d-%H%M%S`

index=$1

# Make qxdm log directory using timestamp
if [ ! -d /storage/usb0/qxdm_log/ ]
then mkdir /storage/usb0/qxdm_log/
fi
path=qxdm_log/$timestamp
mkdir "/storage/usb0/$path"

# Copy qxdm log from modem
case "$index" in
  "0" ) 
  adb pull /ap_conf/diag_logs/dev_log_25.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_26.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_27.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_28.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_29.qmdl.lz4 /storage/usb0/$path
  ;;
  "5" )
  adb pull /ap_conf/diag_logs/dev_log_00.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_01.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_02.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_03.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_04.qmdl.lz4 /storage/usb0/$path
  ;;
  "10" )
  adb pull /ap_conf/diag_logs/dev_log_05.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_06.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_07.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_08.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_09.qmdl.lz4 /storage/usb0/$path
  ;;
  "15" )
  adb pull /ap_conf/diag_logs/dev_log_10.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_11.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_12.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_13.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_14.qmdl.lz4 /storage/usb0/$path
  ;;
  "20" )
  adb pull /ap_conf/diag_logs/dev_log_15.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_16.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_17.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_18.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_19.qmdl.lz4 /storage/usb0/$path
  ;;
  "25" )
  adb pull /ap_conf/diag_logs/dev_log_20.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_21.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_22.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_23.qmdl.lz4 /storage/usb0/$path
  adb pull /ap_conf/diag_logs/dev_log_24.qmdl.lz4 /storage/usb0/$path
  ;;
esac
