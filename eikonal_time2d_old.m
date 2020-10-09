function TT=eikonal_time2d_old(W,TT,h)
[ny,nx]=size(W);
TT=fsweep_old(W,TT,1,1,ny,1,1,nx,h);
TT=fsweep_old(W,TT,ny,-1,1,1,1,nx,h);
TT=fsweep_old(W,TT,1,1,ny,nx,-1,1,h);
TT=fsweep_old(W,TT,ny,-1,1,nx,-1,1,h);


