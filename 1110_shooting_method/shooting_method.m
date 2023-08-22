% shooting method with violent root finding method
% [t,y]=ode45(@Fisher_KPP,[0 8],[1 a]) with y(0) = 0, y(8) = 0
% step 1: find the positive interval for y(8) = 0
%         i.e. find f(a) = y(end,1) = 0 
% step 2: find the root in the interval
% step 3: output the result

% initialize
x = linspace(-0.5, 0, 10^3);        
n = 0;                                     
find_roots = [];
% find the interval
for ii = 1:(10^3-1)  
   x0 = x(ii);                        
   x1 = x(ii+1);
   [t,y1]=ode45(@Fisher_KPP,[0 8],[1 x0]');
   [t,y2]=ode45(@Fisher_KPP,[0 8],[1 x1]');
   a = y1(end,1);
   b = y2(end,1);
   if (a*b < 0)                
       n = n + 1;                         
       find_roots = [find_roots; x0 x1];  
   end    
end
% initialize
roots = [];
diff = 100;
tol = 10^(-6);
max_iter = 10^5;
jj = 0;
% start to find the root
for k = 1:n
    a = find_roots(k,1);               
    b = find_roots(k,2);               
    jj = 0;                           
    difference = 100;                  
    while difference > tol
        x = (b-a)*rand(1) + a;
        [t,y]=ode45(@Fisher_KPP,[0 8],[1 x]');                          
        difference = abs(y(end,1));          
        jj = jj+1;
        if(jj>10^8)                        
            disp('****WARNING****')        
            disp(['Stop!! Too many iterations(10^8 times). ', 'Have not found limit yet.'])
            break
        end
    end
    roots(k) = x;                   
end
% print the result
disp("a = ")
disp(roots)
plot(t,y(:,1))

function dydt = Fisher_KPP(t,y)
dydt = [y(2); -y(1)+y(1)^2];
end