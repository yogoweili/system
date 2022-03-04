#! /system/bin/sh

# Unbind USB endpoint that ADB uses
adb wait-for-device

# QXDM dump logs
adb pull /var/volatile/diag_logs/. /data/system/dropbox/modem/qxdm
adb pull /ap_conf/diag_logs/. /data/system/dropbox/modem/qxdm

# FOTA logs
rm /data/system/dropbox/modem/fota
adb pull /ap_conf/dme.log /data/system/dropbox/modem/fota/dme.log
adb pull /ap_conf/dme01.log /data/system/dropbox/modem/fota/dme01.log
adb pull /ap_conf/dme02.log /data/system/dropbox/modem/fota/dme02.log
adb pull /ap_conf/wfd.log /data/system/dropbox/modem/fota/wfd.log
adb pull /ap_conf/wfd.log.bak /data/system/dropbox/modem/fota/wfd.log.bak

adb shell sync
