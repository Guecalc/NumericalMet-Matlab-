function [x,f,ea,iter]= newtmult1(func,x0,es,maxit,varargin)
    if nargin<2, error('at least 2 input arguments required'), end
    if nargin<3|| isempty(es),es = 0.0001; end
    if nargin<4 || isempty(maxit), maxit = 50; end
    iter = 0;
    x = x0;  % Change 0 to x0
    while (1)
        [f,J] = func(x, varargin{:});  
        dx = J\f;
        x = x - dx;
        iter = iter + 1;
        ea = 100*max(abs(dx./x));
        if iter>= maxit|| ea <= es, break, end
    end
end
