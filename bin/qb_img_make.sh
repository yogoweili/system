#!/system/bin/sh

echo Make Quickboot Image

file="QB.user.allow"
target_path="/cache/"

#Make QB.user.allow file
su -c touch $target_path$file
if [ $? -ne 0 ]; then
	echo Fail Make QB.user.allow file $?
	exit 1
else
	echo Success Make QB.user.allow file
fi

#Write QB.user.allow property file
su -c getprop persist.sys.QB.user.allow | su -c busybox tee $target_path$file
qb_status=$(su -c cat $target_path$file)

#Check QB.user.allow status
if [ "$qb_status" == "true" ]; then
	echo Already QB.user.allow property true
else
	echo Set QB.user.allow property true
	su -c setprop persist.sys.QB.user.allow true
fi

su -c rm $target_path$file 

#Reboot make QuickBoot Image
echo Reboot Make Quickboot image
su -c reboot "make quickboot image"
