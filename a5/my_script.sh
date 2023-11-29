#!/bin/bash

for i in 8 16; do
	if [ "$i" -eq 8 ] ;
	then 
		gawk -v var="$i" -f awk_parse songs_normalize.csv > temp_energy.csv
	elif [ "$i" -eq 16 ]
	then
		gawk -v var="$i" -f awk_parse songs_normalize.csv > temp_valence.csv
	fi
done

gawk -f awk_file temp_energy.csv > energy.dat
rm temp_energy.csv

gawk -f awk_file temp_valence.csv > valence.dat
rm temp_valence.csv
