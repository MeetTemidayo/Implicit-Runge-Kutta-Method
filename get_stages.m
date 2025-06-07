function stages = get_stages(x,h,mu)
    k1 = func(mu,x);
    k2 = func(mu, x+h/2*k1);
    k3 = func(mu, x+h/2*k2);
    k4 = func(mu, x+h*k3);
    k3_rk3 = func(mu, x-h*k1+2*h*k2);
stages = [k1, k2, k3, k4, k3_rk3];
