#!/bin/bash

echo CyanogenMod Picks

cd ~/android/INC-CM-11/ && . build/envsetup.sh ||exit 1

repopick 55041  # Settings: Add CM PlatLogo & CMCaseView (1/2)
repopick 55037  # CM PlatLogo: CyanogenMod version preference (2/2)
repopick 56080  # Multi-window ported from omnirom

cd ~/android/INC-CM-11/frameworks/opt/telephony || exit 1
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/58/9758/1 && git cherry-pick FETCH_HEAD
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/59/9759/1 && git cherry-pick FETCH_HEAD
cd ~/android/INC-CM-11 || exit 1 && . build/envsetup.sh 

read -p Done

time brunch inc