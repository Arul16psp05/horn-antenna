% plot_spectrum.m
% 14/07/2014

clear; clf;

aa=loadFile('fileA.dat');
bb=loadFile('fileB.dat');

FileInfo1 = dir('fileA.dat');
FileInfo2 = dir('fileB.dat');

[Y1, M1, D1, H1, MN1, S1] = datevec(FileInfo1.datenum);
[Y2, M2, D2, H2, MN2, S2] = datevec(FileInfo2.datenum);
timestr1=strcat(num2str(Y1),'-',num2str(M1),'-',num2str(D1),'--', num2str(H1),':',num2str(MN1),':',num2str(S1));
%timestr2=strcat(num2str(Y2),'-',num2str(M2),'-',num2str(D2),'--', num2str(H2),':',num2str(MN2),':',num2str(S2));
timestr2=strcat('--', num2str(H2),':',num2str(MN2),':',num2str(S2));



subplot(2,1,1)
%plot((fftshift(abs(fft(ya)).^2))/length(y)); grid; hold on
%plot((fftshift(abs(fft(yb)).^2),'r.')/length(y)); grid

len_y = length(aa);
nfft = 128;
nsets = 1;
navg = len_y/nfft-3
colNo = 1;

avgps = (return_averaged_spectras_v1b(aa,colNo,navg,nsets,nfft) );
avgps2= (return_averaged_spectras_v1b(bb,colNo,navg,nsets,nfft) );

plot( avgps, 'b-' ); grid; hold on
plot( avgps2, 'r--' ); 
xlim([0,nfft])
ylim([1e5, 10e5] )
xlabel('frequency bins')
ylabel('power in counts')
legend('fc1:1420.0 MHz', 'fc2:1420.7 MHz')
%title( strcat(timestr1,'',timestr2))
title( strcat(timestr1,'  --ACM Trial 21cm Obs'))

subplot(2,1,2)

plot( (avgps2 - avgps )); grid
xlim([0,nfft])
xlabel('frequency bins')
ylabel('signal power in counts')
ylim([-5.0e4, 5.0e4] )

legend('fc1SPower-fc2SPower');

print('plotfile_TRIAL.png','-dpng')
