CM10 for the Droid Incredible

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
repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0
```

### Finish setting up repo
```bash
mkdir ~/android/cm-11.0/.repo/local_manifests
wget -O ~/cm10/.repo/local_manifests https://raw.github.com/zachf714/android_device_htc_inc/cm-11.0/Manifest/local_manifest.xml
```

### Download the source
```bash
cd ~/android/cm10
repo sync -j16
```
NOTE: This WILL take a long time.

### Build
Make sure we're in ~/android/cm-11.0...
```bash
cd ~/android/cm-11.0
```

### List of cherry-picks/reverts used. the first two are required to build
```bash

```

Pull in the prebuilts, like (currently only self-added GooManager)...
```bash
./vendor/cm/get-prebuilts
```

And build!
```bash
. build/envsetup.sh && time brunch inc
```
