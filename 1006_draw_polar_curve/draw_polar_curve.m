% draw the polar curves: r(xita)= 1 + c*sin(n*xita) on x-y plane, 0 <= xita <=2*pi
% where c is a vector, so if c is a 1xk vector, it will draw k curves
function draw_polar_curve(c,n)
    % input: c, a real vector
    %        n, an positive integer
    %
    % example:
    % > draw_polar_curve([3 5 7], 2)
    % 
    xita = linspace(0, 2*pi, 1000);       % generates equally 1000 spaced points in [0,2*pi]
    %
    % start to draw the curve with different components in c
    %
    for k = 1:length(c)             % c is a 1xlength(c) vector, so draw length(c) curves
        r = 1 + c(k).*sin(n*xita);  % r(xita) = 1 + c(k)*sin(n*xita) 
        x = r.*cos(xita);           % x(xita) = r(xita)*cos(xita)
        y = r.*sin(xita);           % y(xita) = r(xita)*sin(xita)
        plot(x,y);                  % print the curve on x-y plane
        axis equal                  % let the x-, y-axis are equal in size 
        grid on                     % adds grid lines in the graph
        hold on                     % don't earse the curve when drawing the next curve
    end
end
