clc;
close all;
clearvars;

fc = 5; fs = 100;
tstart = 0; tend = 1;
v = 50; beta = 0.3; fd = beta*v;
C = 3e8; p = 2/C;
R = 250000; td = p*R;
ts = 1/fs; t = tstart:ts:tend-ts;
alpha = 0.5;
y = alpha*cos(2*pi*(fc+fd)*(t-td));
save('received_p12.mat',"y");
figure; plot(t,y, color='cyan');
xlabel('time');
ylabel('cos');
title('received signal');