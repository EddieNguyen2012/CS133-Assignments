set term dumb
set term svg
set out "a3t3.svg"
set boxwidth 0.6 relative

set title "Average total amount on a number of passengers"
set xlabel "Number of passengers"
set ylabel "Average total amount"

set style data histogram

set xrange [-1:10]
set yrange [0:]

set datafile separator ','

plot "a3t3_sorted.dat" using 1:2:xtic(1) with boxes fill solid lc rgbcolor "coral" title "Average total amount"
