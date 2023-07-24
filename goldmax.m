function [x_max, f_max, ea, iter] = goldmax(f, xl, xu, es, maxit, varargin)
% goldmax: maximization golden section search
% [x_max, f_max, ea, iter] = goldmax(f, xl, xu, es, maxit, p1, p2, ...)
% uses golden section search to find the maximum of f
% input:
%   f = name of function
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = max allowed iterations (default 50)
%   p1, p2, ... = additional parameters used by f
% output:
%   x_max = location of maximum
%   f_max = maximum function value
%   ea = approximate relative error (%)
%   iter = number of iterations

if nargin < 3, error('at least 3 input arguments required'), end
if nargin < 4 || isempty(es), es = 0.0001; end
if nargin < 5 || isempty(maxit), maxit = 50; end
phi = (1 + sqrt(5)) / 2;
iter = 0;
d = (phi - 1) * (xu - xl);
x1 = xl + d;
x2 = xu - d;
f1 = f(x1, varargin{:});
f2 = f(x2, varargin{:});

while true
    x_int = xu - xl;
    if f1 > f2
        x_opt = x1;
        xl = x2;
        x2 = x1;
        f2 = f1;
        x1 = xl + (phi - 1) * (xu - xl);
        f1 = f(x1, varargin{:});
    else
        x_opt = x2;
        xu = x1;
        x1 = x2;
        f1 = f2;
        x2 = xu - (phi - 1) * (xu - xl);
        f2 = f(x2, varargin{:});
    end

    iter = iter + 1;
    if x_opt ~= 0
        ea = (2 - phi) * abs(x_int / x_opt) * 100;
    end
    if ea <= es || iter >= maxit
        break;
    end
end

x_max = x_opt;
f_max = f(x_opt, varargin{:});

end
