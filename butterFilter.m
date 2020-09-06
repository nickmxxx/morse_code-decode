function f = butterFilter( x )
bfil = fft(x);
n = 1;
fs=8000;
wp=[990 1000]/(fs/2);
ws=[980 1010]/(fs/2);
Rp=3;
Rs=40;
[n, wn]=buttord(wp,ws,Rp,Rs);
[b,a] = butter(n,wn);
%fvtool(b,a);
f = filter(b,a,x);
afil = fft(f);

end

