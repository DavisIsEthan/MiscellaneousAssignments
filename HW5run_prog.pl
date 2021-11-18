#!/usr/bin/perl
###########################################################################################
#
# John Parker, Ethan Davis, Kyle Teller - Fall 2017 - PHYS 895 - run_prog.pl
#
# Perl file that runs the Welch method for HW5 based off of 4 inputs - the file, number of points,
# and the minimum frequency to use, and the filename of the generated plot
#
###########################################################################################


system("gfortran -g -fcheck=all -Wall -fbacktrace  hw5.f"); # Compile fortran code - allow for warnings
system("./a.out $ARGV[0] $ARGV[1] $ARGV[2] $ARGV[3]"); # Run fortran code with arguments
system("gnuplot -c hw5gnuplot.p $ARGV[0] tmp.$ARGV[0].spectrum tmp.$ARGV[0].spectrum_p $ARGV[3]");
# Plot and open compiled data with given arguments
system("open $ARGV[3]");
