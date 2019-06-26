function f = first_function(z, mu, sigma);
% Calculates Density Function of the Normal Distribution
if sigma <= 0
fprintf('Invalid input\n');
f = NaN;
else
f = (1/(sqrt(2*pi)*sigma))*exp(-(z-mu)^2/(2*sigma^2));
end
