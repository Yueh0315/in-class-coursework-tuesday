% Print percentiles and top 5 scores and draw the histogram
function Score(x)
    % input: x = students' grades, a vector
    % !!! length(x)> = 10 !!!
    % example:
    %> Score([80 72 61 55 43 58 90 78 32 10 50 36])
    %
    x = sort(x); % sort the grades
    % calculate the percentiles ([88th;75th;50th;25th;12th])
    y = [x(floor(length(x)*0.88));x(floor(length(x)*0.75));
        x(floor(length(x)*0.5));x(floor(length(x)*0.25));x(floor(length(x)*0.12))];
    % display the result
    disp('88th = ') % display the 88th student's grade
    disp(y(1))
    disp('75th = ') % display the 75th student's grade
    disp(y(2))
    disp('50th = ') % display the 50th student's grade
    disp(y(3))
    disp('25th = ') % display the 25th student's grade
    disp(y(4))
    disp('12th = ') % display the 12th student's grade
    disp(y(5))
    disp('TOP 5 =') % display the Top 5 students' grades
    disp(x((length(x)-4):end))
    histogram(x)    % show the histogram
end
