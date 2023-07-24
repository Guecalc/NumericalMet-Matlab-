function I = composite_simpson(func, a, b, n, varargin)
% composite_simpson: Composite Simpson's 1/3 rule quadrature
%   I = composite_simpson(func, a, b, n, p1, p2, ...)
%   computes the integral using the composite Simpson's 1/3 rule.
%   Inputs:
%       func = function to be integrated
%       a, b = integration limits
%       n = number of segments (must be even)
%       p1, p2, ... = additional parameters used by func
%   Output:
%       I = integral estimate

if nargin < 4, error('At least 4 input arguments required'), end
if ~(b > a), error('Upper bound must be greater than lower bound'), end
if nargin < 5 || isempty(n), n = 100; end
if mod(n, 2) ~= 0, error('Number of segments (n) must be even'), end

h = (b - a) / n;

x = linspace(a, b, n+1);
y = func(x, varargin{:});

I = h / 3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
end
