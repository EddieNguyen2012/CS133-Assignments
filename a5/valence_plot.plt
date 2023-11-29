set terminal pngcairo size 1920,1080
set out 'valence.png'
set datafile separator ","
set xlabel "Year"
set ylabel "Value"
set title "The trends of Valence from Spotify's Top Hits in the period from 1999 - 2019"
set style fill solid

plot "valence.dat" using 1:2 with lines linecolor rgb "#FF934F" linewidth 3 title 'Valence'
