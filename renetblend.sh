#!/bin/bash
BLVERS=2.79
BLENDERLOC=/home/$USER/bin/blender-$BLVERS-linux-glibc219-x86_64/

DEVNETRENDERLOC=/home/$USER/Developer/Blender-Network-Render-Additions/netrender

# copy latest netrender code to Blender addons
cp -rf $DEVNETRENDERLOC $BLENDERLOC/$BLVERS/scripts/addons/

# stop blender master and slave and others...stop all blenders
pkill -f blender

BLENDPARAMS="--addons netrender -a -noaudio -nojoystick --enable-autoexec"
x-terminal-emulator -e "$BLENDERLOC/blender -b master.blend $BLENDPARAMS"
sleep 1
x-terminal-emulator -e "$BLENDERLOC/blender -b slave.blend $BLENDPARAMS"

sleep 1

IP=$(hostname -I | xargs)
URL="http://$IP:8000"
echo $URL
xdg-open $URL





