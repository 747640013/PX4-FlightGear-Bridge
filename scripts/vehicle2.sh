#!/bin/bash
# get absolute path of models folder
SCRIPT=$(readlink -f $0)
ROOT_DIR=`dirname $SCRIPT`/..
FIRMWARE_DIR=`dirname $SCRIPT`/../../../../../
MODEL_PATH=${ROOT_DIR}/models

export FG_BINARY=fgfs
export FG_MODELS_DIR=${MODEL_PATH}
echo ${FG_MODELS_DIR}
export FG_ARGS_EX="--allow-nasal-read=${MODEL_PATH} \
                   --callsign=TF-A2 \
                   --offset-distance=0.01 \
                   --offset-azimuth=90 \
                   --ignore-autosave \
                   --disable-hold-short \
                   --prop:input/joysticks/js=0 \
                   --prop:/sim/rendering/static-lod/aimp-range-mode-distance=true \
                   --prop:/sim/rendering/static-lod/aimp-bare=10000 \
                   --prop:/sim/rendering/static-lod/aimp-detailed=1000 \
                   --disable-mouse-pointer \
                   --multiplay=out,10,127.0.0.1,5000\
                   --multiplay=in,10,127.0.0.1,5102"

export PX4_ID=1


cd ${FIRMWARE_DIR}
make px4_sitl_nolockstep flightgear_bo105

# 去掉参数
#                   --prop:/sim/rendering/static-lod/aimp-range-mode-distance=true \
