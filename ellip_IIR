clc,clear
st = mstg();

Fp = 600;
Fs = 700;
Ap = 0.1;
As = 60;
[N,wp] = ellipord(Fp/5000,Fs/5000,Ap,As,'s');

[b,a] = ellip(6,0.1,60,wp);
a = filter(b,a,st);
plot(a)
