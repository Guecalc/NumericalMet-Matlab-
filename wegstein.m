function [x2,fx2,ea,iter] = wegstein(g,x0,x1,es,maxit)
%wegstein: fixed point root locator
%   [x2,fx2,ea,iter] = wegstein(g,x0,x1,es,maxit)
%This function determines the root of x = g(x) with the Wegstein method.
%Method is repeated until either the percent relative error (ea)
%is equal to or less than es (default:1.e-6) or the number of iterations
%exceeds maxit (default:50).
%INput:
%   g = the function for g(x)
%   x0,x1 = initial guesses for x
%   es = relative error stopping criterion (%)
%   maxit = maximum number of iterations
%Output:
%   x2 = root
%   fx2 = function value at root
%   ea = relative error
%   iter = number of iterations

if nargin < 3, error('at least 3 arguments required'), end
if nargin < 4||isempty(es),es = 1e-6;end %if es is blank set to 1e-6
if nargin <5 ||isempty(maxit), maxit = 50; end %if maxit is blank set to 50

iter = 0; ea = 100;
while (1)
    x2 = (x1*g(x0)-x0*g(x1))/(x1-x0-g(x1)+g(x0));
    iter = iter +1;
    if x2 ~= 0, ea = abs((x2-x1)/x2)*100; end
    if (ea <= es || iter >=maxit),break, end
    x0 = x1; x1=x2;
end
fx2=g(x2);
end

%sec 6.2 online textbook for example execution of script