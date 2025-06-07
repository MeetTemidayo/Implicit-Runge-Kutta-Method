function [t, num_solution_adaptive, stepsize] = adaptive_method_step(t, ...
            num_solution_adaptive, config, stepsize,i)
    TOL = config(1); mu=config(2); safety_factor=config(3);
    K = get_stages(num_solution_adaptive(:,1), stepsize,mu);
    num_solution_adaptive(:,i+1) = runge3_step( ...
                num_solution_adaptive(:,i), stepsize, K);
    RK4_step(:,2) = runge4_step(num_solution_adaptive(:,i), stepsize, K);
    E = norm (RK4_step(:,2)-num_solution_adaptive(:,i+1));
    t = t + stepsize;

if E > TOL
    t = t - stepsize;
    stepsize = stepsize*(TOL*safety_factor/E)^(1/4);
    t = t + stepsize;
    K = get_stage(num_solution_adaptive(:,i), stepsize, mu);
    num_solution_adaptive(:,i+1) = runge3_step( ...
        num_solution_adaptive(:,i), stepsize, K);
else
    stepsize = 2*stepsize;
end