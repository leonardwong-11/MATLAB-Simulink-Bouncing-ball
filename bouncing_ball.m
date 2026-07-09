syms t
g = -9.81;
v0 = 0;
s0 = 10;
e = 0.8;

% Define x values (absolute time)
x = linspace(0, 10, 1000);
    
% Initialize 
y = zeros(size(x));
v = int(g,t) + v0;
s = int(v,t) + s0;
last_t_hit = 0;

for i = 1:10
    % 1. Find roots and extract the positive local time of impact
    t_roots = double(solve(s == 0, t));
    t_hit_local = max(t_roots); % The ball hits the ground in the future, not the past
    
    % 2. Calculate the absolute time of this impact
    t_hit_abs = last_t_hit + t_hit_local;
    
    % 3. Piecewise definition using absolute time for the mask
    mask = (last_t_hit <= x) & (x <= t_hit_abs);
    
    % 4. Substitute using local time (x - last_t_hit)
    y(mask) = double(subs(s, t, x(mask) - last_t_hit));
    
    % Calculate impact velocity using the local time
    v_hit = double(subs(v, t, t_hit_local));
    
    % Update the absolute time tracker for the next iteration
    last_t_hit = t_hit_abs;
    
    % Generate equations for the next bounce (t resets to 0)
    v = int(g,t) - e*v_hit;    
    s = int(v,t) + 0;
end

% Plot
plot(x, y, 'LineWidth', 2)
grid on
xlabel('Time (s)')
ylabel('Height (m)')
title('Bouncing Ball Piecewise Function')