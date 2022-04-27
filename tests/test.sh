#!/bin/bash
# Project: Kostra grafu (spanning tree)
# Author: Bc. David Sladký
# Login: xsladk07

rm -f tests/tests.out
REPEATS=10

# Prints header line
echo '## Tests' > TIMES.md
echo "This 'TIMES.md' is regenerated for every run of test.sh." >> TIMES.md
echo >> TIMES.md

# Print table header
echo -n '| Test |' >> TIMES.md
for ((i=1;i<=REPEATS;i++)); do
    echo -n " time $i |" >> TIMES.md
done
echo " AVG |" >> TIMES.md

# Prints table header separator
echo -n '| --- |' >> TIMES.md
for ((i=1;i<=REPEATS;i++)); do
    echo -n " --- |" >> TIMES.md
done
echo ' --- |' >> TIMES.md

# Executes tests, measure their duration and prints the results
for test in tests/*.in; do
    totalTime=0
    echo -n "| $test |" >> TIMES.md
    for ((i=1;i<=REPEATS;i++)); do
        startTime=$(date +%s%N)
        ./flp21-log < $test > /dev/null
        endTime=$(date +%s%N)
        diffTime=$((($endTime-$startTime)/1000000))
        totalTime=$(($totalTime+$diffTime))
        echo -n " $diffTime ms |" >> TIMES.md

    done
    avgTime=$(($totalTime/$REPEATS))
    echo " $avgTime ms |" >> TIMES.md
done
