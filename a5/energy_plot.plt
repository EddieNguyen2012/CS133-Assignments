set terminal pngcairo size 1920,1080
set out 'energy_valence.png'
set datafile separator ","
set xlabel "Year"
set ylabel "Value"
set title "The trends of Energy from Spotify's Top Hits in the period from 1999 - 2019"
set boxwidth 0.5
set style fill solid

plot "energy.dat" using 1:4:3:7:6 with candlesticks linecolor rgb "#5E565A" title 'Energy', \
	"" using 1:5:5:5:5 with candlesticks lt -1 linecolor rgb "#FF934F" notitle
