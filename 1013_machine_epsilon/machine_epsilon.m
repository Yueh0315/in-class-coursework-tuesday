% compute the approximate machine epsilon
% machine epsilon: the minmum positive number s such that 1+s>=1
% for convenience, we define s as the format of s = 2^-k
% just click "Run" then it will show the result
format long;    % change the output format
for k = 1:100
    % try to find the machine epsilon from 2^-1 ~ 2^-100
    s = 2^(-k);
    % if 1+s is rounded to 1 or smaller, it means s is smaller then the machine epsilon
    if (1 + s) <= 1
        % show the power of the machine epsilon
        disp('k = ') 
        disp(k - 1)     % 1+2^-k<=1 so we have 1+2^-(k-1)>=1, 2^-(k-1) is the machine epsilon.
        % show the machine epsilon
        disp('esp = ')
        disp(s*2)       % 2^-(k-1)
        break;
    end    
end
