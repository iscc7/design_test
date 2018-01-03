clc,clear
fs = 1000; %frequency 
t_start = 0;
t_end = 2;
f1 = 100;
f2 = 300;
N = (t_end-t_start)*fs;
t = linspace(t_start,t_end,N);
signal_1 = sin(2*pi*f1*t);
signal_2 = sin(2*pi*f2*t);
signal = signal_1 + signal_2;
plot(abs(fft(signal)))
% butterworth filter 
Rp = 1;
Rs = 40;
Fp = 150;
Fc = 200;

na=sqrt(10^(0.1*Rp)-1);  
ea=sqrt(10^(0.1*Rs)-1);  
N=ceil(log10(ea/na)/log10(Fc/Fp));  
Wn = Fp*2/fs;

[b,a] = butter(4,Wn,'low');
signal_processed = filter(b,a,signal);
figure
plot(abs(fft(signal_processed)))


