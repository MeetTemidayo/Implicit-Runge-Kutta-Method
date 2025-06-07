function runge4_step = runge4_step(x,h,k)
    runge4_step = x + h*(1/6*k(:,1)+1/3*k(:,2)+1/3*k(:,3)+1/6*k(:,4));