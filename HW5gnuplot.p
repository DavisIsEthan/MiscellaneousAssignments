# Basic Gnuplot script to plot generated output from hw5.f
set term pdf color font "Helvetica,6" linewidth 0.2 rounded
set output ARG4
set grid
set origin 0.05, 0.05
set logscale y
set ylabel 'Power'

set multiplot layout 2,1 title ARG1
set title "Freq v Power"
plot ARG2 u 1:2 w lines lt 1linecolor rgb '#dd9999' lw 3 title 'powerspectrum'
set title "Period v Power"
set logscale x
plot ARG3 u 1:2 w lines lt 1linecolor rgb '#5555ff' lw 3 title 'powerspectrum'
