#!/bin/bash

echo CLOBBER
make clobber 
echo Repo Sync
repo sync


echo CyanogenMod Picks

cd ~/android/INC-CM-11/ && . build/envsetup.sh ||exit 1

#repopick 56080  # Multi-window ported from omnirom
repopick 58878  # Add trackpad/trackball wake and unlock support
repopick 56515  # vold: allow swapped storage paths at vold init
repopick 56516  # Advanced storage: vold swap storage paths
repopick 56950  # storage: allow swapping primary storage for apps
repopick 56951  # Advanced storage: swap primary storage for apps


cd ~/android/INC-CM-11/frameworks/opt/telephony || exit 1
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/58/9758/1 && git cherry-pick FETCH_HEAD
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/59/9759/1 && git cherry-pick FETCH_HEAD
cd ~/android/INC-CM-11/external/iproute2 || exit 1 && git revert 4c48963 --no-edit
cd ~/android/INC-CM-11/build || exit 1
git fetch https://gerrit.omnirom.org/android_build refs/changes/37/4537/2 && git cherry-pick FETCH_HEAD
cd ~/android/INC-CM-11 || exit 1 && . build/envsetup.sh 

read -p Done

lunch cm_inc-userdebug
time make bacon -j6