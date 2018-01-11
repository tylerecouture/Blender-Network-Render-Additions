#!/bin/bash
BLENDERLOC=/home/90158/bin/blender-2.79-linux-glibc219-x86_64/2.79
DEVNETRENDERLOC=/home/90158/Developer/Blender-Network-Render-Additions/netrender

# copy latest netrender code to Blender addons
cp -rf $DEVNETRENDERLOC $BLENDERLOC/scripts/addons/

# stop blender master and slave and others...stop all blenders
pkill -f blender


