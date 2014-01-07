#!/system/bin/sh
#
#
#
#
#
target=`getprop ro.board.board`
case "$target" in
    # Inc
    "inc")
        # Tune for scorpion
        echo 245000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        echo 998400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        # Configure and enable KSM
        echo 1000 > /sys/kernel/mm/ksm/sleep_millisecs
        echo 100 > /sys/kernel/mm/ksm/pages_to_scan
        echo 1 > /sys/kernel/mm/ksm/run
    ;;
esac
