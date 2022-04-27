#!/bin/bash
# Project: Kostra grafu (spanning tree)
# Author: Bc. David Sladký
# Login: xsladk07

rm -f tests/tests.out
REPEATS=5

# Prints header line
echo '## Tests' > README.md
echo 'This README is regenerated for every run of test.sh.' >> README.md
echo 'Original times mesured on merlin.' >> README.md
echo >> README.md

# Print table header
echo -n '| Test |' >> README.md
for ((i=1;i<=REPEATS;i++)); do
    echo -n " time $i |" >> README.md
done
echo " AVG |" >> README.md

# Prints table header separator
echo -n '| --- |' >> README.md
for ((i=1;i<=REPEATS;i++)); do
    echo -n " --- |" >> README.md
done
echo ' --- |' >> README.md

# Executes tests, measure their duration and prints the results
for test in tests/*.in; do
    totalTime=0
    echo -n "| $test |" >> README.md
    for ((i=1;i<=REPEATS;i++)); do
        startTime=$(date +%s%N)
        ./flp21-log < $test >> tests/tests.out
        endTime=$(date +%s%N)
        diffTime=$((($endTime-$startTime)/1000000))
        totalTime=$(($totalTime+$diffTime))
        echo -n " $diffTime ms |" >> README.md

    done
    avgTime=$(($totalTime/$REPEATS))
    echo " $avgTime ms |" >> README.md
done
