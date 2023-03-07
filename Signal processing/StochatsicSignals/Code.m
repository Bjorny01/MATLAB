load rockabilly.mat
player = audioplayer(y, 8000);

%%
Yd = fft(y);
Yd_shift = fftshift(Yd);
N = length(y);
f = [-N/2:N/2-1]/N;

plot(f,abs(Yd_shift));

%%
%Find n0, the bit where sync is located
N = length(y);
%[A, B] = butter(5, 0.995, 'high'); %%Filter out everything that isnt vs
%y_filt = filter(A,B,y);
%v = -0.5:1/(length(y)-1):0.5;
%plot(v, abs(tdftfast(y_filt)));

n = 1:2^16;
s = 0.1*sin(2*pi*4070/8192*n); %%Create a sinus to check cross corolation, amplitude increase and 

%[acor_filt,lag] = xcorr(y_filt,s);
%plot(lag, acor_filt)
%legend('filt')
%figure
[acor,lag] = xcorr(y,s);
plot(lag, acor)

% Results: 
% n0 = 75000

%%
%Decode message
n = 1:2^16;
sVs = 0.1*sin(2*pi*4070/8192*n); %%Create a sinus to check cross corolation, amplitude increase and 

[acor_sVs,lag] = xcorr(y,sVs);
plot(lag,acor_sVs)

hold on

sV0 = 0.1*sin(2*pi*4040/8192*n); %%Create a sinus to check cross corolation, amplitude increase and 

[acor_sV0,lag] = xcorr(y,sV0);
plot(lag, acor_sV0)

hold on

sV1 = 0.1*sin(2*pi*4010/8192*n); %%Create a sinus to check cross corolation, amplitude increase and 

[acor_sV1,lag] = xcorr(y,sV1);
plot(lag, acor_sV1)
legend('sync','zero','one')

