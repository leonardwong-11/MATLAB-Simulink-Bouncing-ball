syms t

g = -9.81;
v0 = 0;
s0 = 10;
e = 0.8

% Define x values
x = linspace(0, 10, 1000);
    
% Initialize 
y = zeros(size(x));

v = int(g,t) + v0;
s = int(v,t) + s0;
last_t_hit = 0

for i = 1:10
    t_hit = solve(s == 0, t);
    disp(t_hit)
    
    % Piecewise definition
    mask = (last_t_hit < x) & (x <= t_hit);
    y(mask) = double(subs(s, t, x(mask)));
    
    last_t_hit = t_hit
    v_hit = double(subs(v, t, t_hit));
    v = int(g,t) - e*v_hit;    
    s = int(v,t) + 0;
end

% Plot
plot(x, y, 'LineWidth', 2)
grid on
xlabel('x')
ylabel('f(x)')
title('Piecewise Function')