#!/bin/bash

(echo "Start to Create dirs" > /dev/kmsg)

mkdir /data/data/com.android.providers.applications
chmod 0751 /data/data/com.android.providers.applications
chown u0_a1:u0_a1 /data/data/com.android.providers.applications
mkdir /data/data/com.android.providers.calendar
chmod 0751 /data/data/com.android.providers.calendar
chown u0_a71:u0_a71 /data/data/com.android.providers.calendar
mkdir /data/data/com.android.providers.calendar/cache
chmod 0771 /data/data/com.android.providers.calendar/cache
chown u0_a71:u0_a71 /data/data/com.android.providers.calendar/cache
mkdir /data/data/com.android.providers.calendar/cache/com.android.renderscript.cache
chmod 0700 /data/data/com.android.providers.calendar/cache/com.android.renderscript.cache
chown u0_a71:u0_a71 /data/data/com.android.providers.calendar/cache/com.android.renderscript.cache
mkdir /data/data/com.android.providers.calendar/databases
chmod 0771 /data/data/com.android.providers.calendar/databases
chown u0_a71:u0_a71 /data/data/com.android.providers.calendar/databases
mkdir /data/data/com.android.providers.calendar/shared_prefs
chmod 0771 /data/data/com.android.providers.calendar/shared_prefs
chown u0_a71:u0_a71 /data/data/com.android.providers.calendar/shared_prefs
mkdir /data/data/com.android.providers.contacts
chmod 0751 /data/data/com.android.providers.contacts
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts
mkdir /data/data/com.android.providers.contacts/cache
chmod 0771 /data/data/com.android.providers.contacts/cache
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts/cache
mkdir /data/data/com.android.providers.contacts/databases
chmod 0771 /data/data/com.android.providers.contacts/databases
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts/databases
mkdir /data/data/com.android.providers.contacts/files
chmod 0771 /data/data/com.android.providers.contacts/files
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts/files
mkdir /data/data/com.android.providers.contacts/files/photos
chmod 0700 /data/data/com.android.providers.contacts/files/photos
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts/files/photos
mkdir /data/data/com.android.providers.contacts/files/profile
chmod 0700 /data/data/com.android.providers.contacts/files/profile
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts/files/profile
mkdir /data/data/com.android.providers.contacts/files/profile/photos
chmod 0700 /data/data/com.android.providers.contacts/files/profile/photos
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts/files/profile/photos
mkdir /data/data/com.android.providers.contacts/shared_prefs
chmod 0771 /data/data/com.android.providers.contacts/shared_prefs
chown u0_a1:u0_a1 /data/data/com.android.providers.contacts/shared_prefs
mkdir /data/data/com.android.providers.downloads
chmod 0751 /data/data/com.android.providers.downloads
chown u0_a70:u0_a70 /data/data/com.android.providers.downloads
mkdir /data/data/com.android.providers.downloads.ui
chmod 0751 /data/data/com.android.providers.downloads.ui
chown u0_a70:u0_a70 /data/data/com.android.providers.downloads.ui
mkdir /data/data/com.android.providers.downloads/cache
chmod 0771 /data/data/com.android.providers.downloads/cache
chown u0_a70:u0_a70 /data/data/com.android.providers.downloads/cache
mkdir /data/data/com.android.providers.downloads/databases
chmod 0771 /data/data/com.android.providers.downloads/databases
chown u0_a70:u0_a70 /data/data/com.android.providers.downloads/databases
mkdir /data/data/com.android.providers.drm
chmod 0751 /data/data/com.android.providers.drm
chown u0_a70:u0_a70 /data/data/com.android.providers.drm
mkdir /data/data/com.android.providers.media
chmod 0751 /data/data/com.android.providers.media
chown u0_a70:u0_a70 /data/data/com.android.providers.media
mkdir /data/data/com.android.providers.media/cache
chmod 0771 /data/data/com.android.providers.media/cache
chown u0_a70:u0_a70 /data/data/com.android.providers.media/cache
mkdir /data/data/com.android.providers.media/databases
chmod 0771 /data/data/com.android.providers.media/databases
chown u0_a70:u0_a70 /data/data/com.android.providers.media/databases
mkdir /data/data/com.android.providers.media/shared_prefs
chmod 0771 /data/data/com.android.providers.media/shared_prefs
chown u0_a70:u0_a70 /data/data/com.android.providers.media/shared_prefs
mkdir /data/data/com.android.providers.settings
chmod 0751 /data/data/com.android.providers.settings
chown system:system /data/data/com.android.providers.settings
mkdir /data/data/com.android.providers.settings/databases
chmod 0771 /data/data/com.android.providers.settings/databases
chown system:system /data/data/com.android.providers.settings/databases
mkdir /data/data/com.android.providers.telephony
chmod 0751 /data/data/com.android.providers.telephony
chown radio:radio /data/data/com.android.providers.telephony
mkdir /data/data/com.android.providers.telephony/databases
chmod 0771 /data/data/com.android.providers.telephony/databases
chown radio:radio /data/data/com.android.providers.telephony/databases
mkdir /data/data/com.android.providers.userdictionary
chmod 0751 /data/data/com.android.providers.userdictionary
chown u0_a1:u0_a1 /data/data/com.android.providers.userdictionary

(echo "Creating dirs - End" > /dev/kmsg)

function excute_log() {
	CMD_E=$1
	LOG_E=$($CMD_E 2>&1)

	LOG_L="/system/bin/log \"$LOG_E\""
	$LOG_L
}


DB_WAL="-wal"
DB_SHM="-shm"
DB_JOURNAL="-journal"
DATABASES="databases"


SET_DIR="/data/data/com.android.providers.settings"
SET_DB="settings.db"
(/system/bin/log echo "Check SettingsProvider db.")
excute_log "ls -ald $SET_DIR"
excute_log "ls -ald $SET_DIR/$DATABASES"
excute_log "ls -al $SET_DIR/$DATABASES/$SET_DB"



MEDIA_DIR="/data/data/com.android.providers.media"
EXT_DB="external.db"
INT_DB="internal.db"
MUSIC_DB="mymusic.db"
(/system/bin/log "Check MediaProvider db.")
excute_log "ls -ald $MEDIA_DIR"
excute_log "ls -ald $MEDIA_DIR/$DATABASES"
excute_log "ls -al $MEDIA_DIR/$DATABASES/$EXT_DB"
excute_log "ls -al $MEDIA_DIR/$DATABASES/$INT_DB"
excute_log "ls -al $MEDIA_DIR/$DATABASES/$MUSIC_DB"

(/system/bin/log "Checking db finished.")
(echo "Checking db finished." > /dev/kmsg)

(echo "qb_mkdir_check" > /data/qb_mkdir_check)
