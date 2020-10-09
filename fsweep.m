function u=fsweep(W,u,ny1,ndy,ny2,nx1,ndx,nx2,h)
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
        delt=h*W(i,j);
        du=abs(uxmin-uymin);
        if (du>=delt)
             ubar = min(uxmin,uymin)+delt;
        else
             ubar = 0.5*(uxmin+uymin+sqrt(2*delt*delt-du*du)); %this line may be ignored to speed up
        end 

        ik=i-ndy;
        if(ik>0 && ik<=nodey)
            jk=j-ndx;
            if(jk>0 && jk<=nodex)
                if(u(ik,jk)<min(u(ik,j),u(i,jk)))
                    cc=u(ik,j)-u(i,jk);
                    cc=cc*cc;
                    dd=2*delt*delt-cc;
                    if(dd>0)
                        ubar1=u(ik,jk)+sqrt(dd);
                        if(ubar>ubar1)
                            ubar=ubar1;
                        end
                    end
                end
            end
        end
           
        if(u(i,j)>ubar)
            u(i,j)=ubar;
        end
    end
end
