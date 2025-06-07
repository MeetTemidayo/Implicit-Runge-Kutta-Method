clear all

mu = 10;
TOL = 10^(-15);
safety_factor = 0.9;
T = (3-2*log(2))*mu + 2*pi/(mu^(1/3));
i = 0;
t = 0;
init_stepsize = 0.001;
initial_value = [2; 0];
num_solution_adaptive(:,i) = initial_value;
step_size = init_stepsize;
config = [TOL, mu, safety_factor];

tic
while t < T
    i = i + 1;
    [t, num_solution_adaptive, step_size] = adaptive_method_step(t, ...
        num_solution_adaptive, config, step_size, i);
end
toc

plot(num_solution_adaptive(1,:), num_solution_adaptive(2,:), 'red')
xlabel('y', 'latex')
ylabel('derivative y', 'interpreter', 'latex')