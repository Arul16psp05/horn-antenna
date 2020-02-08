function y = loadFile(filename)
%  y = loadFile(filename)
%
% Reads complex samples from the rtlsdr file
%

fid = fopen("filename",'rb');        # read binary        fid = fopen("filename",'rb');

y = fread(fid,'uint8=>double');    # binary to Double (0 to 255) ((2^8)-1)

y = y-127.5;                       #  255/2 = 127.5
y = y(1:2:end) + i*y(2:2:end);     #  a(1:2:end)        # odd elements of a => [1, 3]
                                   #  a(2:2:end)        # even elements of a => [2, 4]
