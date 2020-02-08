21 cm detections seen from the test observation data set
l_m175_f1420.0MHz_set9.dat
l_m175_f1420.7MHz_set9.dat 
(9/2/2019 at The American College terrace, Madurai)

A draft procedure for running the processing programs

1. cp l_m175_f1420.0MHz_set9.dat  fileA.dat 
2. cp l_m175_f1420.7MHz_set9.dat  fileB.dat 

3. octave --no-gui fn_plot_spectrum_AminusB.m
(this program should produce a plot file: plotfile_TRIAL.png )

If the computer doesnot have enough memory. The program may not run and the program is to be modified to work with lesser memory. We can do this if required.

FMcapture25_back2Zdec_A_4.dat
FMcapture25_back2Zdec_B_4.dat
plotfile_TRIAL_4.png

FMcapture25_back2Zdec_A_8.dat
FMcapture25_back2Zdec_B_8.dat
plotfile_TRIAL_8.png

Octave (Matlab) codes needed:
fn_plot_spectrum_AminusB.m  -- main code
loadFile.m  (called by the main code. Please keeep in the same directory)
return_averaged_spectras_v1b.m (called by the main code. Please keeep in the same directory)







