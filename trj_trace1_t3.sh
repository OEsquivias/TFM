#!/bin/bash

#This copies all the segments of one trace trajectory and their respective pcoord.dat file in one directory

for i in `tail -n +9 $1|awk '{print $1"-"$2}'`;do
# We need the iteration/walker indices as strings
# so we can name the file properly
    iter=`echo $i|sed 's/-[0-9]*//'`
    p_iter=`printf "%06d" $iter`
    walk=`echo $i|sed 's/^[0-9]*//'|sed 's/-//'`
    p_walk=`printf "%06d" $walk`
# Make the full path to the seg.xtc
    TRJ_PATH=`printf "ramon@perdiu46:/s/ramon/WESTPA1_t_3/traj_segs/%06d/%06d" $iter $walk`
# Copy into the folder!
#    printf "$TRJ_PATH\n" >> "trajectories.txt"
    scp $TRJ_PATH/seg_whole.xtc /home/ramon/PCNA/trace/all_xtc/${p_iter}_${p_walk}.xtc
    scp $TRJ_PATH/pcoord.dat /home/ramon/PCNA/trace/all_xtc/pcoord_${p_iter}_${p_walk}.dat
done
