function u=fsweep_old(W,u,ny1,ndy,ny2,nx1,ndx,nx2,h)
[nodey,nodex]=size(W);
for i=ny1:ndy:ny2 %y     
    for j=nx1:ndx:nx2%column     
        if (i==1)
            uymin = u(2,j);
        elseif(i==nodey)
            uymin = u(nodey-1,j);
        else
            uymin = min(u(i-1,j),u(i+1,j));
        end
        if (j==1)
             uxmin = u(i,2);
        elseif(j==nodex)
             uxmin = u(i,nodex-1);
        else
            uxmin = min(u(i,j-1),u(i,j+1));
        end
        aa=h*W(i,j);
        bb=abs(uxmin-uymin);
        if (bb>=aa)
             ubar = min(uxmin,uymin)+aa;
        else
             ubar = 0.5*(uxmin+uymin+sqrt(2*aa*aa-bb*bb));
        end 
        if(u(i,j)>ubar)
            u(i,j)=ubar;
        end
    end
end