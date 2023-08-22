function accurate_graph(L)
    % 找出f'的根(f的極大極小值所在)
    x = linspace(-abs(L), abs(L), 10^4);        % 切割x軸為10^4個點
    n = 0;                                      % 找到根的數量(初始值)
    find_roots = [];                            % 根所在區間的左端點(初始為空)
    % 開始找根的區間
    for ii = 1:(10^4-1)
       % 試[x0,x1]中可不可能有根
       x0 = x(ii);                        
       x1 = x(ii+1);
       a = df(x0);
       b = df(x1);
       if (a*b < 0)               % 勘根法：sin(x0)*sin(x1) 表示 [x0,x1] 中有根
           n = n + 1;                         % 更新根的數量
           find_roots = [find_roots; x0 x1];  % 儲存找到根的區間
       end    
    end

    tol = 10^(-7);                       % 設定容許值
    roots = [];                          % 存下根的值(初始為空)
    % 暴力求根
    % 在找到的區間內隨機取點，小於容許值就為視為根
    for k = 1:n
        a = find_roots(k,1);               % 區間左端點
        b = find_roots(k,2);               % 區間右端點
        jj = 0;                            % 初始尋找次數
        difference = 100;                  % 初始前後向的差
        % 開始找根，小於容許值就跳出
        while difference > tol
            r = (b-a)*rand(1) + a;         % 在區間[a,b]中隨機取點
            y = df(r);                   % 取值
            difference = abs(y);          % 計算與0的差
            jj = jj+1;
            if(jj>10^8)                        % 設定跳脫次數
                disp('****WARNING****')        % 顯示示警及跳脫次數
                disp(['Stop!! Too many iterations(10^8 times). ', 'Have not found limit yet.'])
                break
            end
        end
        roots(k) = r;                   % 儲存找到的根
    end
    % 顯示找到的根
    disp('roots = ');
    disp(roots'); 
    %
    % start to draw the curve f
    %
    y = f(x);          
    plot(x,y);                  % print the curve on x-y plane
    axis equal                  % let the x-, y-axis are equal in size 
    grid on                     % adds grid lines in the graph
    hold on                     % don't earse the curve when drawing the next thing
    x = linspace(-abs(L), abs(L), n); % 畫出極大極小值
    plot(x,f(roots),'o');

    function y = f(x)
    y = x.*sin(x);
    end

    function y = df(x)
    y = x*cos(x) + sin(x);
    end
end