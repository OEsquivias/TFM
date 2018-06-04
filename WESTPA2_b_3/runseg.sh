#!/bin/bash
if [ -n "$SEG_DEBUG" ] ; then
    set -x
    env | sort
fi


cd $WEST_SIM_ROOT
mkdir -pv $WEST_CURRENT_SEG_DATA_REF
cd $WEST_CURRENT_SEG_DATA_REF

ln -sv $WEST_SIM_ROOT/gromacs_config/* .

if [ "$WEST_CURRENT_SEG_INITPOINT_TYPE" = "SEG_INITPOINT_CONTINUES" ]; then
  sed "s/RAND/$WEST_RAND16/g" ./md-continue.mdp > ./md.mdp
  ln -sv $WEST_PARENT_DATA_REF/seg.edr ./parent.edr
  ln -sv $WEST_PARENT_DATA_REF/seg.gro ./parent.gro
  $GMX grompp -f md.mdp -p topol.top -c parent.gro -r frame.gro -e parent.edr -o seg.tpr -po md_out.mdp -maxwarn 1

elif [ "$WEST_CURRENT_SEG_INITPOINT_TYPE" = "SEG_INITPOINT_NEWTRAJ" ]; then
  sed "s/RAND/$WEST_RAND16/g" ./md-genvel.mdp > ./md.mdp
  $GMX grompp -f md.mdp -p topol.top -c frame.gro -o seg.tpr -po md_out.mdp -maxwarn 1
fi


$GMX mdrun -nt 1 -pin on -pinoffset $WM_PROCESS_INDEX -s seg.tpr -deffnm seg
echo Protein_DNA | $GMX trjconv -n index.ndx -f seg.xtc -s frame.gro -o seg_whole.xtc -pbc nojump
$GMX distance -f seg_whole.xtc -s frame_Protein_DNA.gro -oall seg.xvg -select 'cog of group Protein plus cog of (residue 766 845) plus cog of group Protein plus cog of (residue 806 805)'
cat seg.xvg | tail -n 2 | head -1 | awk '{printf ($2-$3)*10; printf "  "}' >pcoord.dat
cat seg.xvg | tail -n 1 | awk '{print ($2-$3)*10;}' >>pcoord.dat
cat pcoord.dat > $WEST_PCOORD_RETURN || exit 1


rm -rf  amber99bsc1.ff *top *itp *mdp *ndx parent*

