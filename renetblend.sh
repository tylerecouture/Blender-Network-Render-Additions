#!/bin/bash
BLVERS=2.79
BLENDERLOC=/home/$USER/bin/blender-$BLVERS-linux-glibc219-x86_64/

DEVNETRENDERLOC=/home/$USER/Developer/Blender-Network-Render-Additions/netrender

# copy latest netrender code to Blender addons
cp -rf $DEVNETRENDERLOC $BLENDERLOC/$BLVERS/scripts/addons/


# stop blender master and slave and others...stop all blenders
pkill -f blender
sleep 1

BLENDPARAMS="--addons netrender -a -noaudio -nojoystick --enable-autoexec"
RENDERPARAMS="--engine NET_RENDER -a"
gnome-terminal -e "$BLENDERLOC/blender -b master.blend $BLENDPARAMS"
sleep 1
gnome-terminal -e "$BLENDERLOC/blender -b slave.blend $BLENDPARAMS"
#gnome-terminal -e "$BLENDERLOC/blender -b renderTest.blend $BLENDPARAMS $RENDERPARAMS"

#IP=$(hostname -I | xargs)
#URL="http://$IP:8000"
#echo $URL
#xdg-open $URL





