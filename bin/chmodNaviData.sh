#!/bin/sh
# 2016.2.25 HMNS 
# We cannot use busybox, find, chown -R, awk, xargs, sed, and tree command in android shell. 

echo "[HMNS] This script changes a mode and owner of backed up mnsoft user data files and folders." >> /dev/kmsg
echo "[HMNS] It works in DAudio PIO only. " >> /dev/kmsg

if [ -d "/data/data/com.mnsoft.navipopupservice/mnsoft/" ];then
	echo "[HMNS] backup folder exist. start restore" >> /dev/kmsg
else
	echo "[HMNS] backup folder is not exist. exit." >> /dev/kmsg
	exit
fi

chmod -R 744 /data/data/com.mnsoft.navipopupservice/mnsoft/
OUT=$?
if [ $OUT -eq 0 ];then
	echo "[HMNS] chmod 744 success." >> /dev/kmsg
else
	echo "[HMNS] chmod 744 fail. " >> /dev/kmsg
	exit
fi

cp -r /data/data/com.mnsoft.navipopupservice/mnsoft/* /data/data/com.mnsoft.navi/
OUT=$?
if [ $OUT -eq 0 ];then
	echo "[HMNS] cp success." >> /dev/kmsg
else
	echo "[HMNS] cp fail. " >> /dev/kmsg
	exit
fi

set `ls -al /data/data | grep com.mnsoft.navi`
NAVI_UID=$2

chown $NAVI_UID:$NAVI_UID /data/data/com.mnsoft.navi/UserData
OUT=$?
if [ $OUT -eq 0 ];then
	echo "[HMNS] chown UserData directory success." >> /dev/kmsg
else
	echo "[HMNS] chown UserData directory fail. " >> /dev/kmsg
	exit
fi


function RecurseDirs
{
	#oldIFS=$IFS
	#IFS=$'\n'
	for f in "$@"
	do
		#echo "chown name = ${f}, NAVI_UID = ${NAVI_UID}" >> /dev/kmsg
		chown $NAVI_UID:$NAVI_UID ${f} 
		if [[ -d "${f}" ]]; then

			cd ${f}
			RecurseDirs $(ls ".")
			cd ..
		fi
	done
	#IFS=$oldIFS
}

# setprop(ctl.start, chmodNaviData); command start at root(/), so we need to move. 
cd /data/data/com.mnsoft.navi/UserData

RecurseDirs $(ls "/data/data/com.mnsoft.navi/UserData")
OUT=$?
if [ $OUT -eq 0 ];then
	echo "[HMNS] chown sub directories success." >> /dev/kmsg
	rm -r "/data/data/com.mnsoft.navipopupservice/mnsoft/"
else
	echo "[HMNS] chown sub directories fail. " >> /dev/kmsg
	exit
fi

cd /


