function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
% FALSEPOSITION: finds roots of a function using the false-position method
% [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%   INPUTS:
%       func = name of the function to be evaluated
%       xl, xu = lower and upper bounds
%       es = desired relative error (default = 0.0001%)
%       maxiter = maximum number of iterations (default = 200)
%   OUTPUTS:
%       root = estimated root location
%       fx = function value at the estimated root location
%       ea = approximate relative error (%)
%       iter = number of iterations performed

% set default values for es and maxiter if not given
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxiter)
    maxiter = 200;
end

% check that the sign of the function changes within the bounds
if func(xl)*func(xu) > 0
    error('Function has the same sign at the upper and lower bounds.')
end

% initialize variables
iter = 0;
xr = xl;
ea = 100;

% loop until desired relative error or maximum number of iterations is reached
while ea > es && iter < maxiter
    % calculate the new estimate using false-position method
    xr_old = xr;
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
    
    % calculate the approximate relative error
    if xr ~= 0
        ea = abs((xr - xr_old)/xr) * 100;
    end
    
    % update the bounds based on the sign of the function at the new estimate
    if func(xr)*func(xl) < 0
        xu = xr;
    elseif func(xr)*func(xu) < 0
        xl = xr;
    else
        ea = 0;
    end
    
    % increment the iteration counter
    iter = iter + 1;
end

% calculate the function value at the estimated root location
fx = func(xr);

% display warning message if maximum number of iterations was reached
if iter == maxiter
    warning('Maximum number of iterations reached.')
end

% display the estimated root location, function value, and approximate relative error
root = xr;
fprintf('Estimated root location: %f\n', root)
fprintf('Function value at root: %f\n', fx)
fprintf('Approximate relative error: %f%%\n', ea)
fprintf('Number of iterations: %d\n', iter)