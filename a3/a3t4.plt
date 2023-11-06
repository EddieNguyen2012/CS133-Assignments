set style fill transparent solid 0.2 noborder

set datafile separator ','

set terminal svg
set out 'a3t4.svg'

set title "Correlation between travel distance and total amount" 
set xlabel "Travel distance"

NO_ANIMATION = 1
set autoscale x
set autoscale y

plot 'a3t4.dat' using 1:2 with points lc rgb 'coral' 
