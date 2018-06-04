#!/bin/bash
source env.sh
ps aux | grep w_run | grep -v grep
pkill -9 -f w_run

SFX=.d$$
mv traj_segs{,$SFX}
mv seg_logs{,$SFX}
rm -rf traj_segs$SFX seg_logs$SFX & disown %1
rm -f system.h5 west.h5 seg_logs.tar
mkdir seg_logs traj_segs 

BSTATE_ARGS="--bstate start,1,bstates/frame.gro"

#$WEST_ROOT/bin/w_init $BSTATE_ARGS $TSTATE_ARGS --segs-per-state 24 --work-manager=threads "$@"
$WEST_ROOT/bin/w_init $BSTATE_ARGS $TSTATE_ARGS "$@"  &> init.log





