#!/bin/bash

#This copies all the segments of all iterations between two progress coordinate values

dir=/s/ramon/WESTPA_b_3ball/traj_segs/
length=$((${#dir}+1))
for folder in $dir/* ; do
  for i in $folder/* ; do    
    coord=`cat $i/pcoord.dat | awk '{ if ($2<2.5 && $2>=2.0) print $2; else print NaN }'`
    echo "$coord"
    if [ "$coord" != "NaN" ]; then
      it="${folder:$length}"
      cp $i/seg_whole.xtc /home/ramon/perdiux/PCNA/it_traj/b3/seg_$it.xtc
      break
    fi
  done
done

