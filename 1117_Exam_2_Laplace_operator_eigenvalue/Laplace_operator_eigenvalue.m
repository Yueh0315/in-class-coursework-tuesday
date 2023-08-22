N = 100;
% Laplace operator
x = linspace(0,1,N);
y = linspace(0,1,N);
delta_x = (x(2)-x(1))^2;
delta_y = (y(2)-y(1))^2;
% initialize
difference = 100;
tol = 10^(-3);
max_iter = 10^5;
ii = 0;
u = rand(N,N);
u(:,1) = 0;
u(:,100) = 0;
u(1,:) = 0;
u(100,:) = 0;
u = u/norm(u);

lambda0 = 0;
v = zeros(N,N);
while difference > tol
    for k = 2:N-1
        for l = 2:N-1
            fix_y = (u(k-1,l)-2*u(k,l)+u(k+1,l))/delta_x;
            fix_x = (u(k,l-1)-2*u(k,l)+u(k,l+1))/delta_y;
            v(k,l) = fix_y + fix_x;
        end   
    end
    lambda1 = v(2,2)/u(2,2);
    difference = abs(lambda0-lambda1);
    lambda0 = lambda1;
    u = v;
    u = u/norm(u);
    ii = ii + 1;
    if (ii > max_iter)  % jump if there are too many iterations
        disp('****WARNING****');
        disp(['Stop!! Too many iterations. ', 'Have not converged yet'])
        break;
    end
end
disp('the biggest eigenvalue = ')
disp(lambda0)


