% This code is to estimate the maximum sum and the maximum term that matlab
% can calculat for the harmonic series.
%
% First compute the approximate machine epsilon,
% then use the machine epsilon to estimate the maximum term the series can
% add.

% machine epsilon: the minmum positive number s such that 1+s >= 1
% for convenience, we define s as the format of s = 2^-k

format long;    % change the output format
tic % timer start

for k = 1:100
    % try to find the machine epsilon from 2^-1 ~ 2^-100
    s = 2^(-k);
    % if 1+s is rounded to 1 or smaller, it means s is smaller then the machine epsilon
    if (1 + s) <= 1
        % show the machine epsilon
        s = s*2;        % 2^-(k-1)
        disp('esp = ')
        disp(s)  
        break;
    end    
end

% now we have have the machine epsilon s
% so that if 1/N <= s(machine epsilon), 1/N will be rounded off.
% and (N-1)th is the maximum term matlab can compute the harmonic series. 
Max_N = 1/s - 1;
disp('Maximum N = ');
disp(Max_N);

% Let S(n) = 1/1 + 1/2 + ... + 1/N > x
% However, with the 10 minutes limit, it's impossible to compute S(Max_N)
% I have estimated that it can add up about 4*10^11 terms in 10 minutes,
% then after computing S(4*10^11) just add the rest of terms' averenge,
% we can roughly get the apporximate maximum S(Max_N).

% start to calculate the S(Max_N)
% compute S(3*10^11) first
sum = 0;
for k = 1:4*(10^11)
        sum = sum + 1/k;
end
% take the middle term of [4*10^11, Max_N] as rough averenge for the rest of terms
% take averenge*(number of last terms) as the rest of terms' sum
rest_of_sum = 1/((Max_N + (4*10^11))/2)*(Max_N - 4*10^11);
disp('Maximum x = ');
disp(sum + rest_of_sum);    % S(Max_N) ~ S(4*10^11) + rest_of_sum

toc % timer stop and show the time cost