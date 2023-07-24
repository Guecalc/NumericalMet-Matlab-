function pH = computeLakeSuperiorpH(pH_guess)
    % Constants
    KH = 1.26e-3; % Henry's constant (mol/L/atm)
    K1 = 10^(-6.3);
    K2 = 10^(-10.3);
    Kw = 10^(-14);
    PCO2 = 386; % CO2 partial pressure (ppm)

    % Alkalinity
    Alk = 0.4e-3; % Alkalinity (eq/L)

    % Solve for pH
    numGuesses = numel(pH_guess);
    pH = zeros(numGuesses, 1);
    for i = 1:numGuesses
        % Define the equations
        equations = @(x) [
            x(1)*x(2)/KH - K1*x(3);
            x(1)*x(3)/KH - K2*x(2);
            x(1)*x(4) - Kw/x(5);
            x(3) + 2*x(2) + x(5) - x(1) + Alk;
            x(1) + x(5) - x(2) - 2*x(3)
        ];

        % Solve using fzero
        solution = fzero(@(x) equations([x, PCO2, 0, 1, 1]), pH_guess(i));

        % Store the pH value
        pH(i) = solution;
    end
end
