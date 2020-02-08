#rotational curve meashurements

format long #"format long" for precition
c = 299792458;             # l = [35 50 65]  zenith l = 50
f0 = 1420.4057517667 ;     # f1= 1420.4411504425, fc = 1420.5203125
#oort constants A and B    # f2= 1420.608203125
A = 15.3                   # 
B = -11.9                  # l = [44 59 74]  12deg l = 59
V0 = 220                   # f1= 1420.4421875, fc = 1420.53984375
R0 = 8.5                   # f2= 1420.6375
W0 = (V0/R0)               #
                           # l = [55 70 85]  18deg l = 70
# change this f            # f1= 1420.4421875, fc = 1420.549609375
 f =1420.66238938052          # f2= 1420.647265625
                           #
                           # l = [60 75 89.9]  23deg l = 75
#freq = f;                 # f1= 1420.4421875, fc = 1420.559375
  #doppler_shift           # f2= 1420.66238938052      
vs= ((((f0/f)*c)-c)/1000)  
 
   
vr_list = [vs]       #vr = rotational velocity of cloud
l1 = [60 75 89.9]
l_list = [90-l1]      # this is for cos(l) l= 90-l

for idx=1:length(l_list)
l =l_list(idx);

vr = vr_list/sind(l);

# d = distance from sun to cloud
d = vr /(A*sind(2*l)) ;
#d2 = (abs(d))   # sometime d maybe negative
# vt = tangential velocity of cloud
vt = d*((A*cosd(2*l))+B);
ur = vr+ (V0*sind(l));
ut = vt+ (V0*cosd(l));
# V = total velocity calculated by propermotion method
V(idx) = sqrt((ur)^2 + (ut)^2)
# R = distance from Galactic center to cloud
R(idx) = sqrt((R0^2)+(d^2)-(2*R0*d*cosd(l)))
end
a=transpose(V)
#save -text data_sin(90-l)_l_75_V3.dat a;
b=transpose(R)
#save -text data_sin(90-l)_l_75_R3.dat b;
plot(R,V,'om')#,xlim([0 30]),ylim([0 300]);
xlim([0 40]);
ylim([0 300]);
grid on
title ("velocity vs distance");
xlabel("Distance from Galactic Center");
ylabel("velocity");
hold on
clear
#legend ({"l = 50","l = 59","l = 70","l = 75"}, "location", "east")