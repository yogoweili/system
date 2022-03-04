#! /system/bin/sh

adb wait-for-device

adb shell "rm -rf /data/log/cores"
adb pull /data/log /data/system/dropbox/modem/conti
tar -zcvf /data/system/dropbox/modem/conti_qxdm.tar.gz /data/system/dropbox/modem/conti
rm -rf /data/system/dropbox/modem/conti

adb shell sync
