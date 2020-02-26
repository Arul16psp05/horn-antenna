   # acquire 10 s data at Frquency position-1
   rtl_sdr -f 1420000000 -g 25 -s 1000000 -n 10000000 FileA.dat
   
   f is center frequency
   g is gain
   s is sampling rate
   n is number of samples
   FileA.dat is file name for data storage
