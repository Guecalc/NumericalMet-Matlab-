function x = GaussSeidelRelax(A, b, es, maxit, lambda)
% GaussSeidelRelax: Gauss-Seidel method with relaxation
% x = GaussSeidelRelax(A, b, es, maxit, lambda)
% input:
%   A = coefficient matrix
%   b = right-hand side vector
%   es = stop criterion (default = 0.00001%)
%   maxit = max iterations (default = 50)
%   lambda = relaxation factor (default = 1)
% output:
%   x = solution vector

if nargin < 2
    error('At least 2 input arguments required');
end
if nargin < 5 || isempty(lambda)
    lambda = 1;
end
if nargin < 4 || isempty(maxit)
    maxit = 50;
end
if nargin < 3 || isempty(es)
    es = 0.00001;
end

[m, n] = size(A);
if m ~= n
    error('Matrix A must be square');
end

C = A;
for i = 1:n
    C(i, i) = 0;
    x(i) = 0;
end
x = x';

for i = 1:n
    C(i, 1:n) = lambda * C(i, 1:n) / A(i, i);
end

for i = 1:n
    d(i) = lambda * b(i) / A(i, i);
end

iter = 0;
while true
    xold = x;
    for i = 1:n
        x(i) = d(i) - C(i, :) * x;
        if x(i) ~= 0
            ea(i) = abs((x(i) - xold(i)) / x(i)) * 100;
        end
    end
    iter = iter + 1;
    if max(ea) <= es || iter >= maxit
        break;
    end
end

% Compute true percent relative error
true_error = abs(x - xold) ./ abs(x) * 100;

fprintf('True percent relative error for each variable:\n');
for i = 1:n
    fprintf('x%d: %.2f%%\n', i, true_error(i));
end

end
