x = 0.9;
n = 5;

function result = sin_series(x, n)
    result = 0;
    for k = 0:n
        numerator = (-1)^k * x^(2*k+1);
        denominator = factorial(2*k+1);
        result = result + numerator / denominator;
    end
end

