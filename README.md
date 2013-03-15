CM10.1 for the Droid Incredible

## Info
[**XDA Discussion thread**](http://forum.xda-developers.com/showthread.php?t=1882918)

### Initialize
[Setup Linux/OS X](http://source.android.com/source/initializing.html) - Please note: it must be sun-java-6, not openjdk

### Prepare to download sources
```bash
mkdir ~/cm10
mkdir ~/bin
cd ~/cm10/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo
repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
```

### Finish setting up repo
```bash
wget -O .repo/local_manifest.xml https://raw.github.com/tiny4579/android_device_htc_inc/cm-10.1/Manifest/local_manifest.xml
```

### Download the source
```bash
cd ~/cm10
repo sync -j16
```
NOTE: This WILL take a long time.

### Build
Make sure we're in ~/cm10...
```bash
cd ~/cm10
```

### List of cherry-picks/reverts used. the first two are required to build
```bash
#Fix breakage due to CM revert part 1
#http://review.cyanogenmod.org/#/c/33305
cd ~/android/cm10/frameworks/native
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_native refs/changes/05/33305/1 && git cherry-pick FETCH_HEAD

#Fix breakage due to CM revert part 2
cd ~/android/cm10/hardware/qcom/display-legacy
git revert b4331823c

#Change I4a9f8e9e: Fix return type of glGetAttribLocation and glGetUniformLocation
#http://review.evervolv.com/#/c/3933/
cd ~/android/cm10/frameworks/native
git fetch http://review.evervolv.com/android_frameworks_native refs/changes/33/3933/1 && git cherry-pick FETCH_HEAD
 
#Change I275c415f: Add TEMP_FAILURE_RETRY to ZipUtils
#http://review.evervolv.com/#/c/3937/
cd ~/android/cm10/frameworks/native
git fetch http://review.evervolv.com/android_frameworks_native refs/changes/37/3937/2 && git cherry-pick FETCH_HEAD
 
#Change I80d4c68b: hardening: eliminate more .text relocations
#http://review.evervolv.com/#/c/3987/
cd ~/android/cm10/frameworks/av
git fetch http://review.evervolv.com/android_frameworks_av refs/changes/87/3987/2 && git cherry-pick FETCH_HEAD
 
#framework: Battery bar (1/2)
#http://review.cyanogenmod.org/#/c/31912/
cd ~/android/cm10/frameworks/base
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/12/31912/3 && git cherry-pick FETCH_HEAD
#Settings: Battery bar (2/2)
#http://review.cyanogenmod.org/#/c/31913/
cd ~/android/cm10/packages/apps/Settings
git fetch http://review.cyanogenmod.org/CyanogenMod/android_packages_apps_Settings refs/changes/13/31913/3 && git cherry-pick FETCH_HEAD
  
#DeskClock: User-defined world cities
#http://review.cyanogenmod.org/#/c/33001/
#cd ~/android/cm10/packages/apps/DeskClock
#git fetch http://review.cyanogenmod.org/CyanogenMod/android_packages_apps_DeskClock refs/changes/01/33001/5 && git cherry-pick FETCH_HEAD
```

Pull in the prebuilts, like (currently only self-added GooManager)...
```bash
./vendor/cm/get-prebuilts
```
And build!
```bash
. build/envsetup.sh && time brunch inc
```

