function [J, f] = myfunc(x)
    f = [x(2) - x(1)^2 - x(1) + 10; 
        x(2) + 3*x(1)*x(2) - x(1)];

    df1dx1 = -2*x(1) - 1;
    df1dx2 = 1;
    df2dx1 = 3*x(2) - 1;
    df2dx2 = 3*x(1) + 1;

    J = [df1dx1, df1dx2; df2dx1, df2dx2];
end
