function runge3_step = runge3_step(x,h,k)
    runge3_step = x + h*(1/6*k(:,1)+2/3*k(:,2)+1/6*k(:,5));