#!/bin/bash

echo AOKP Picks

make clobber

repo sync -j6

cd ~/android/Dinc-AOKP/ && . build/envsetup.sh ||exit 1

cd ~/android/Dinc-AOKP/frameworks/base || exit 1
pstest 16063  # Lockscreen Notifications [1/2]
pstest 16316  # Change video recording toggle drawable in Quick Settings
pstest 16660  # base: Fix screen on stats after a boot
pstest 16674  # framework-res: Remove gingerbread scrolls
pstest 16659  # frameworks/base: Fix the random UI corruption
cd ~/android/Dinc-AOKP/packages/apps/ROMControl || exit 1
pstest 16213  # Lockscreen Notifications [2/2]
cd ~/android/Dinc-AOKP/frameworks/opt/telephony || exit 1
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/58/9758/1 && git cherry-pick FETCH_HEAD
git fetch http://review.evervolv.com/android_frameworks_opt_telephony refs/changes/59/9759/1 && git cherry-pick FETCH_HEAD
cd ~/android/Dinc-AOKP/external/iproute2 || exit 1 && git revert 4c48963 --no-edit
cd ~/android/Dinc-AOKP/build || exit 1
git fetch https://gerrit.omnirom.org/android_build refs/changes/37/4537/2 && git cherry-pick FETCH_HEAD

cd ~/android/Dinc-AOKP/ && . build/envsetup.sh ||exit 1

read -p Done

time brunch inc -j6