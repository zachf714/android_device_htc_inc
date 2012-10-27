#!/system/bin/sh
#
#
#
#
#
target=`getprop ro.board.platform`
case "$target" in
    # QSD8x50: Passion, Bravo, Supersonic, Inc
    "qsd8k")
        # Tune for scorpion
        echo 245000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 998400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        # Configure and enable KSM
        echo 1000 > /sys/kernel/mm/ksm/sleep_millisecs
        echo 100 > /sys/kernel/mm/ksm/pages_to_scan
        echo 1 > /sys/kernel/mm/ksm/run
    ;;
esac
