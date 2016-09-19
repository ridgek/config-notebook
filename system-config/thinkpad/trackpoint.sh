#!/bin/sh
#
# Enable ThinkPad trackpoint scrolling
#

if [ "`id -u`" != "0" ]; then
    echo "Must be run as root" 1>&2
    exit 1
fi

cat <<EOF > /usr/share/X11/xorg.conf.d/20-trackpoint.conf
Section "InputClass"
    Identifier "Trackpoint Wheel Emulation"
    MatchProduct       "TPPS/2 IBM TrackPoint|DualPoint Stick|Synaptics Inc. Composite TouchPad / TrackPoint"
    MatchDevicePath    "/dev/input/event*"
    Option             "EmulateWheel"          "true"
    Option             "EmulateWheelButton"    "2"
    Option             "Emulate3Buttons"       "false"
    Option             "XAxisMapping"          "6 7"
    Option             "YAxisMapping"          "4 5"
EndSection
EOF
