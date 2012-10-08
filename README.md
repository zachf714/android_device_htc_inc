CM10 for the Droid Incredible

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
repo init -u git://github.com/CyanogenMod/android.git -b jellybean
```

### Finish setting up repo
```bash
wget -O .repo/local_manifest.xml https://raw.github.com/PonsAsinorem/android_device_htc_inc/jellybean-cm/Manifest/local_manifest.xml
```

### Download the source
```bash
cd ~/cm10
repo sync -j16
```
NOTE: This WILL take a long time.

### Revert commits that break the build for the inc
```bash
cd ~/cm10/hardware/qcom/display
# Revert "hwc/overlay: Add premultiplied alpha support."
git revert 89770608f0 --no-edit
# Revert "hwc: Set premultiplied alpha flag appropriately"
git revert 5fcbecb --no-edit
# Revert "hwc: Enable MDP_BACKEND_COMPOSITION"
git revert 48bcc28 --no-edit
```

### Build
Make sure we're in ~/cm10...
```bash
cd ~/cm10
```
Pull in the prebuilts, like (currently only self-added GooManager)...
```bash
./vendor/cm/get-prebuilts
```
And build!
```bash
. build/envsetup.sh && time brunch inc
```

