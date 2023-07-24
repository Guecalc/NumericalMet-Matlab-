function I = simpson_3_8(func, a, b, varargin)
% simpson_3_8: Simpson's 3/8 rule quadrature
%   I = simpson_3_8(func, a, b, p1, p2, ...)
%   computes the integral using Simpson's 3/8 rule.
%   Inputs:
%       func = function to be integrated
%       a, b = integration limits
%       p1, p2, ... = additional parameters used by func
%   Output:
%       I = integral estimate

if nargin < 3, error('At least 3 input arguments required'), end
if ~(b > a), error('Upper bound must be greater than lower bound'), end

h = (b - a) / 3;
x = [a, a + h, a + 2 * h, b];
y = func(x, varargin{:});

I = h * (y(1) + 3 * (y(2) + y(3)) + y(4)) / 8;
end
