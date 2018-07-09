#!/bin/bash

if [ -z $1 ]; then
  bins="[[-140,-135,-130,-125,-120,-115,-110,-105,-100,-95,-90,-85,-80,-75,-70,-65,-60,-55,-50,-45,-40,-35,-30,-25,-20,-15,-10,-5,0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140]]"
else
  b=$(seq -140 $1 140 | sed ':a;N;$!ba;s/\n/,/g')
  bins="[[$b]]"
fi

FOLDER=/home/oriol/calculs/test/h5_cfg
if [ -z $1]; then
    rm $FOLDER/histograms/pdists/pdist_b4_5.h5
    rm $FOLDER/histograms/pdists/pdist_b3_5.h5
    rm $FOLDER/histograms/pdists/pdist1_b3_5.h5
    rm $FOLDER/histograms/pdists/pdist1_b3b_5.h5
    rm $FOLDER/histograms/pdists/pdist_t3_5.h5
    rm $FOLDER/histograms/pdists/pdist1_t3_5.h5
    rm $FOLDER/histograms/pdists/pdist1_t3b_5.h5
    rm $FOLDER/histograms/pdists/pdist2_t3_5.h5
    rm $FOLDER/histograms/pdists/pdist1_a3_5.h5
    rm $FOLDER/histograms/pdists/pdist_a3_5.h5    

    w_pdist -W /home/oriol/perdiux/PCNA/west_b_4.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_b4_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west_b_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_b3_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_b_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_b3_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_b_3b.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_b3b_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west_t_3_cont.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_t3_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_t_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_t3_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_t_3b.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_t3b_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west2_t_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist2_t3_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_acetyl.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_a3_5.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west_acetyl.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_a3_5.h5
else
    rm $FOLDER/histograms/pdists/pdist_b4_$1.h5
    rm $FOLDER/histograms/pdists/pdist_b3_$1.h5
    rm $FOLDER/histograms/pdists/pdist1_b3_$1.h5
    rm $FOLDER/histograms/pdists/pdist1_b3b_$1.h5
    rm $FOLDER/histograms/pdists/pdist_t3_$1.h5
    rm $FOLDER/histograms/pdists/pdist1_t3_$1.h5
    rm $FOLDER/histograms/pdists/pdist1_t3b_$1.h5
    rm $FOLDER/histograms/pdists/pdist2_t3_$1.h5
    rm $FOLDER/histograms/pdists/pdist1_a3_$1.h5
    rm $FOLDER/histograms/pdists/pdist_a3_$1.h5

    w_pdist -W /home/oriol/perdiux/PCNA/west_b_4.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_b4_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west_b_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_b3_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_b_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_b3_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_b_3b.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_b3b_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west_t_3ball.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_t3_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_t_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_t3_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_t_3b.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_t3b_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west2_t_3.h5 -b $bins -o $FOLDER/histograms/pdists/pdist2_t3_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west1_acetyl.h5 -b $bins -o $FOLDER/histograms/pdists/pdist1_a3_$1.h5
    w_pdist -W /home/oriol/perdiux/PCNA/west_acetyl.h5 -b $bins -o $FOLDER/histograms/pdists/pdist_a3_$1.h5
fi
