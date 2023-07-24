function [f, J] = FJ(x)
    % function
    f = [x(1)^2 + x(1) - 10 - x(2);
         x(1) - 3*x(1)*x(2) - x(1)];
    % Jacobian
    J = [2*x(1) + 1, -1;
         -3*x(2) - 1, -3*x(1)];
end
