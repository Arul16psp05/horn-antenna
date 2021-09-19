#rotational curve meashurements

format long #"format long" for precition
A = 15.3       #oort          
B = -11.9                  
V0 = 220       # Sun's velocity            
R0 = 8.5       # Distance from galactic center to sun            
W0 = (V0/R0) 
c = 299792458;             
f0 = 1420.4057517667 ;   # Rest frequency of HI line emission

f1 = [1420.4411504425, 1420.5203125, 1420.608203125];   # -+7.25khz            b = 0.
f2 = [1420.4421875, 1420.53984375, 1420.6375];
f3 = [1420.4421875, 1420.549609375, 1420.647265625];
f4 = [1420.4421875, 1420.559375, 1420.66238938052];

l1 = [35 50 65];    #-+ 2deg
l2 = [44 59 74];
l3 = [55 70 80];
l4 = [60 75 80];

#here,line 24 and line 34 f1 and l1 keep change to f2,f3,f4 and l2,l3,l4 
#(f1,l1),(f2,l2),(f3,l3) and (f4,l4) are representing frequency and longitude of galaxy from spectrum plots 1,2,3 and 4.

for i = f1
   vs = (((f0/i)*(c+V0))-c)/1000
   vr_list = [vs]       #vr = rotational velocity of cloud
   
   l_list = [90-l1]      # this is for sin(l) l= 90-l

  for idx=1:length(l_list)
    l =l_list(idx);
   
    vr = vr_list/sind(l)
                                 # d = distance from sun to cloud
    d = vr /(A*sind(2*l)) ;
                                #d2 = (abs(d))   # sometime d maybe negative
                                # vt = tangential velocity of cloud
    vt = d*((A*cosd(2*l))+B);
    idx
    ur = vr+ (V0*sind(l));
    ut = vt+ (V0*cosd(l));
                                              # V = total velocity calculated by propermotion method
    V(idx) = sqrt((ur)^2 + (ut)^2);
                                               # R = distance from Galactic center to cloud
    R(idx) = sqrt((R0^2)+(d^2)-(2*R0*d*cosd(l)));
    a=transpose(R)
    b=transpose(V)
   
   end
  save -append data_R.dat a   #To produce Data file of R
  save -append data_V.dat b   #To produce Data file of V
plot(R,V,'om')
xlim([0 45]);
ylim([0 300]);
grid on
title ("velocity vs distance");
xlabel("Distance from Galactic Center");
ylabel("velocity");
hold on
end
