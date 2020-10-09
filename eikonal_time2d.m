function TT=eikonal_time2d(W,TT,h)
[ny,nx]=size(W);
TT=fsweep(W,TT,1,1,ny,1,1,nx,h);
TT=fsweep(W,TT,ny,-1,1,1,1,nx,h);
TT=fsweep(W,TT,1,1,ny,nx,-1,1,h);
TT=fsweep(W,TT,ny,-1,1,nx,-1,1,h);


