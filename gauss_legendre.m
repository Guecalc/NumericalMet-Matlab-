function q = gauss_legendre(func, a, b)
    % Gauss-Legendre quadrature
    % func: function handle for the integrand
    % a, b: integration limits
    
    % Legendre points and weights for n = 2
    x = [-0.5773502691896257, 0.5773502691896257];
    w = [1.0000000000000000, 1.0000000000000000];
    
    % Evaluate the integrand at the Legendre points
    f = func((b - a) / 2 * x + (a + b) / 2);
    
    % Compute the integral
    q = sum(w .* f) * (b - a) / 2;
end
