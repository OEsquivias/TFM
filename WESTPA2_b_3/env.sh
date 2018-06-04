
if which gmx &> /dev/null; then 
   export GMX=$(which gmx); 
else 
   echo "Could not find your GROMACS installation.  Please check your path and "
   echo "make sure that gmx executable is available."
   exit 1 
fi


#### I LEAVE OUT THE 'WEST_PYTHON' ASSIGNMENT HERE BECAUSE I DO IT ROUTINELY WHEN LOADING WESTPA AND ASSIGNING 'WEST_ROOT'
#### PLEASE, MAKE SURE BOTH ABOVE-MENTIONED VARIABLES ARE ASSIGNED AT THIS POINT


if [[ -z "$WEST_ROOT" ]]; then
    echo "Please set the environment variable WEST_ROOT"
    exit
fi

if [[ -z "$WEST_SIM_ROOT" ]]; then
    export WEST_SIM_ROOT="$PWD"
fi

export SIM_NAME=$(basename $WEST_SIM_ROOT)
echo "simulation $SIM_NAME root is $WEST_SIM_ROOT"


