#!/bin/bash

echo CLOBBER
make clobber 
echo Repo Sync
repo sync


echo CyanogenMod Picks

cd ~/android/INC-CM-11/ && . build/envsetup.sh ||exit 1

repopick 55041  # Settings: Add CM PlatLogo & CMCaseView (1/2)
repopick 55037  # CM PlatLogo: CyanogenMod version preference (2/2)
repopick 56080  # Multi-window ported from omnirom
repopick 57536  # DCTracker: call setupAllAPN when the dctracker constructed
repopick 56515  # vold: allow swapped storage paths at vold init
repopick 56516  # Advanced storage: vold swap storage paths
repopick 56950  # storage: allow swapping primary storage for apps
repopick 56951  # Advanced storage: swap primary storage for apps
repopick 56619  # Better expose 'QS Tiles and layout' function
repopick 58072  # Better expose 'QS Tiles and layout' function
repopick 58344  # Bluetooth: Header file changes to add new APIs for Test APK
repopick 58293  # Fixes BLE LPP monitor callback issue
repopick 58294  # Bluetooth: Add support to send/receive raw command/event
repopick 58295  # Bluetooth: Include remote device name as part of filter list
repopick 58296  # Bluetooth: Increase gatt discover service timeout
repopick 58297  # Bluetooth: Handle invalid packet in incoming stream
repopick 58298  # Bluetooth: Register new callback for HCI events callback
repopick 58299  # Bluetooth: Synchronise Key release command and Key State.
repopick 58300  # Bluetooth: Remove pending MAP authorization pop up
repopick 58301  # Bluetooth: Map: update proper interrupted state during bt on/off
repopick 58303  # Bluetooth: Add PXP profile reconnection  after link loss
repopick 58333  # Bluetooth: Fix to avoid object leaks during BT OFF


cd ~/android/INC-CM-11/frameworks/opt/telephony || exit 1
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/58/9758/1 && git cherry-pick FETCH_HEAD
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/59/9759/1 && git cherry-pick FETCH_HEAD
cd ~/android/INC-CM-11/external/iproute2 || exit 1 && git revert 4c48963
cd ~/android/INC-CM-11/build || exit 1
git fetch https://gerrit.omnirom.org/android_build refs/changes/37/4537/2 && git cherry-pick FETCH_HEAD
#cd ~/android/INC-CM-11/external/bluetooth/bluedroid || exit 1 && git revert -m 1 f65bb9c
#cd ~/android/INC-CM-11/packages/apps/Bluetooth || exit 1 && git revert -m 1 1872dee
#cd ~/android/INC-CM-11/packages/apps/BluetoothExt || exit 1 && git revert -m 1 094baa1
#cd ~/android/INC-CM-11/frameworks/base || exit 1 && git revert 72283a3 a010aef
#cd ~/android/INC-CM-11/hardware/libhardware || exit 1 && git revert 3c4507f 7babc7e
cd ~/android/INC-CM-11 || exit 1 && . build/envsetup.sh 

read -p Done

time brunch inc