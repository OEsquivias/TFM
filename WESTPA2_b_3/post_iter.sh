#!/bin/bash

if [ -n "$SEG_DEBUG" ] ; then
    set -x
    env | sort
fi

cd $WEST_SIM_ROOT || exit 1

cp west.h5 west_prev.h5 &


ITER=$(printf "%06d" $WEST_CURRENT_ITER)
PAR_ITER=$(printf "%06d" $((WEST_CURRENT_ITER-1)))
rm  -f  seg_logs/$ITER-*.log &
rm  -f  traj_segs/$PAR_ITER/*/seg.* &



 
