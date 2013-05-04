CM10.1 for the Droid Incredible

## Info
[**XDA Discussion thread**](http://forum.xda-developers.com/showthread.php?t=1882918)

### Initialize
[Setup Linux/OS X](http://source.android.com/source/initializing.html) - Please note: it must be sun-java-6, not openjdk

### Prepare to download sources
```bash
mkdir ~/android/cm10
mkdir ~/bin
cd ~/android/cm10/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo
repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
```

### Finish setting up repo
```bash
wget -O .repo/local_manifest/local_manifest.xml https://raw.github.com/tiny4579/android_device_htc_inc/cm-10.1/Manifest/local_manifest.xml
```

### Download the source
```bash
cd ~/android/cm10
repo sync -j16
```
NOTE: This WILL take a long time.

### Build
Make sure we're in ~/android/cm10...
```bash
cd ~/android/cm10
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
git fetch http://review.cyanogenmod.org/CyanogenMod/android_packages_apps_Settings refs/changes/13/31913/9 && git cherry-pick FETCH_HEAD
  
#DeskClock: User-defined world cities
#http://review.cyanogenmod.org/#/c/33001/
#cd ~/android/cm10/packages/apps/DeskClock
#git fetch http://review.cyanogenmod.org/CyanogenMod/android_packages_apps_DeskClock refs/changes/01/33001/10 && git cherry-pick FETCH_HEAD

#dalvik memory leak fixes/updates
cd ~/android/cm10/dalvik
#Fix a minor leak in handleVM_CreateString
#https://android-review.googlesource.com/#/c/55023/
git fetch https://android.googlesource.com/platform/dalvik refs/changes/23/55023/1 && git cherry-pick FETCH_HEAD
#Fix a minor leaks caused by failed initializations.(typo)
#https://android-review.googlesource.com/#/c/55130/
git fetch https://android.googlesource.com/platform/dalvik refs/changes/30/55130/1 && git cherry-pick FETCH_HEAD
#Fix a leak in Dalvik_dalvik_system_DexFile_openDexFile
#https://android-review.googlesource.com/#/c/54985/
git fetch https://android.googlesource.com/platform/dalvik refs/changes/85/54985/1 && git cherry-pick FETCH_HEAD
#Tiny optimization for complier templates for arm.
#https://android-review.googlesource.com/#/c/55129/
git fetch https://android.googlesource.com/platform/dalvik refs/changes/29/55129/1 && git cherry-pick FETCH_HEAD
```

### Optional: Linaro building
First, you'll want to pull in these commits
```bash
# Linaro
cd ~/android/cm10/libcore
git fetch http://review.cyanogenmod.org/CyanogenMod/android_libcore refs/changes/88/31388/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/frameworks/wilhelm
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_wilhelm refs/changes/90/31390/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/frameworks/ex
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_ex refs/changes/92/31392/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/frameworks/base
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/93/31393/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/frameworks/av
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/94/31394/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/webkit
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_webkit refs/changes/95/31395/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/skia
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_skia refs/changes/98/31398/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/stlport
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_stlport refs/changes/97/31397/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/openvpn
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_openvpn refs/changes/99/31399/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/openssl
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_openssl refs/changes/00/31400/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/openssh
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_openssh refs/changes/01/31401/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/lsof
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_lsof refs/changes/02/31402/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/e2fsprogs
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_e2fsprogs refs/changes/03/31403/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/dnsmasq
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_dnsmasq refs/changes/04/31404/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/chromium
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_chromium refs/changes/05/31405/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/bluetooth/bluedroid
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_bluetooth_bluedroid refs/changes/07/31407/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/v8
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_v8 refs/changes/96/31396/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/ping
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_ping refs/changes/09/31409/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/ping6
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_ping6 refs/changes/10/31410/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/system/security
git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_security refs/changes/11/31411/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/external/wpa_supplicant_8
git fetch http://review.cyanogenmod.org/CyanogenMod/android_external_wpa_supplicant_8 refs/changes/12/31412/1 && git cherry-pick FETCH_HEAD
cd ~/android/cm10/frameworks/rs
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_rs refs/changes/15/31415/1 && git cherry-pick FETCH_HEAD
```
Then set the environment variables as shown below
```bash
export USE_LINARO_COMPILER_FLAGS=yes
export ANDROID_EABI_TOOLCHAIN_DIR=linaro-4.7
export ARM_EABI_TOOLCHAIN_DIR=linaro-4.7
export DEBUG_NO_STRICT_ALIASING=yes
```
You will also need to pull the Linaro specific local_manifest (This requires a recent version of repo)
```bash
wget -O .repo/local_manifest/linaro_optimizations.xml https://raw.github.com/tiny4579/android_device_htc_inc/cm-10.1/Manifest/linaro_optimizations.xml
```
The above assumes you have the Linaro toolchain extracted or symlinked to ~/android/cm10/prebuilts/gcc/linux-x86/arm/linaro-4.7

Whether you're using the optional cherry-picks and/or Linaro, pull in the prebuilts, like (currently only self-added GooManager)...
```bash
./vendor/cm/get-prebuilts
```

And build!
```bash
. build/envsetup.sh && time brunch inc
```