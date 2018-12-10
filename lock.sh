#!/bin/sh
TMP_BACKGROUND="/tmp/lockscreen.jpg"
FAKE_BACKGROUND="/tmp/lockscreen.png"

# Screenshot as JPG, make smaller, blur, make bigger, save as PNG
scrot -d0 -b $TMP_BACKGROUND -e 'mogrify -scale 10% -blur 0x1 -resize 1000% -format png $f'

# Turn dpms off
xset dpms 0 0 0

# Lock the screen
i3lock -n -f -e -i $FAKE_BACKGROUND
revert

# Clear left-overs
rm -f $FAKE_BACKGROUND $TMP_BACKGROUND
