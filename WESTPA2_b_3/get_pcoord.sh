#!/bin/bash
if [ -n "$SEG_DEBUG" ] ; then
    set -x
    env | sort
fi

cd $WEST_SIM_ROOT

$GMX distance -f bstates/frame.gro  -s bstates/frame.gro -oall init_dist.xvg -select 'cog of group Protein plus cog of (residue 766 845) plus cog of group Protein plus cog of (residue 806 805)'
cat init_dist.xvg | tail -n 1 | awk '{print ($2-$3)*10;}' > $WEST_PCOORD_RETURN
rm -f init_dist.xvg 
### SEE COMMENTS IN 'runseg.sh'

