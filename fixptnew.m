function [x1, ea, iter] = fixptnew(g, x0, es, maxit)
% fixpt: fixed point root locator
%   [x1, ea, iter] = fixpt(g, x0, es, maxit)
% This function determines the root of x = g(x) with fixed point iteration.
% The method is repeated until either the percent relative error (ea)
% is equal to or less than es (default: 1.e-6) or the number of iterations
% exceeds maxit (default: 50).
% Input:
%   g = the function for g(x)
%   x0 = initial guess for x
%   es = relative error stopping criterion (%)
%   maxit = maximum number of iterations
% Output:
%   x1 = solution estimate
%   ea = relative error
%   iter = number of iterations

% Set default values for es and maxit if not provided
if nargin < 3 || isempty(es)
    es = 1e-6;
end
if nargin < 4 || isempty(maxit)
    maxit = 50;
end

% Initialize variables
x1 = x0;
iter = 0;
ea = 100;

while true
    x0 = x1;
    x1 = g(x0);
    iter = iter + 1;
    if abs(x1 - x0) < es
        ea = abs((x1 - x0) / x1) * 100;
    end
    if (ea <= es || iter >= maxit)
        break;
    end
end

end

%excecution example in chapter 6 of the online textbook section 6.1
