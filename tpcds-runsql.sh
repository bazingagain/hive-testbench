#!/bin/bash

function usage {
    cat << EOF
        Usage: tpcds-runsql.sh [scale_factor] q1,q2,q3
        or     tpcds-runsql.sh [scale_factor] all
EOF
	exit 1
}

SCALE=$1
SQL=$2

# Sanity checking.
if [ X"$SCALE" = "X" ]; then
	usage
fi
if [ $SCALE -eq 1 ]; then
	echo "Scale factor must be greater than 1"
	exit 1
fi

sqlIndexArr=()
if [ $SQL = "all" ]; then
    #all
    for ((i=1;i < 100; i++)); do
        sqlIndexArr+=($i)
    done
else
    #q1,q2,q3
    IFS=','
    read -r -a array <<< "$SQL"
    for element in "${array[@]}"
    do
        index=${element: 1}
        sqlIndexArr+=($index)
    done
fi

for t in "${sqlIndexArr[@]}" 
do
    echo "Run tpcds query${t}.sql"
    hive -e "use tpcds_bin_partitioned_orc_${SCALE}; source query${t}.sql"
    if [ $? -ne 0]; then
	    echo "Exec tpcds query${t} failed"
        exit 1
    fi
    echo "Finish tpcds query${t}.sql"
done
echo "Complete query!"