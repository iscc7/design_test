clc,clear
N=1000;Fs=1000;T=1/Fs;Tp=N*T;
t=0:T:(N-1)*T;
fc=Fs/10;f0=fc/10;
mt=cos(2*pi*f0*t);
ct=cos(2*pi*fc*t);
xt=mt.*ct;
nt=2*rand(1,N)-1;
 
fp=150;fs=200;rp=0.1;as=70;
fb=[fp,fs];
m=[0,1];
dev=[10^(-as/20),(10^(rp/20)-1)/(10^(rp/20)+1)];
[n,fo,mo,W]=remezord(fb,m,dev,Fs);
hn=remez(n,fo,mo,W);
yt=filter(hn,1,10*nt);
 
xt=xt+yt;
fst=fft(xt,N);k=0:N-1;
f=k/Tp;
subplot(2,1,1)
plot(t,xt);
axis([0,Tp/5,min(xt),max(xt)]);
subplot(2,1,2)
plot(f,abs(fst)/max(abs(fst)));
axis([0,Fs/2,0,1.2])