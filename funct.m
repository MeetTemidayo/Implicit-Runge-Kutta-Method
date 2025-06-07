function rhs = funct(mu,y)
    rhs = [y(2); mu*(1-y(1)^2)*y(2)-y(1)];