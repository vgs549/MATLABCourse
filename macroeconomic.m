N = 15 ; % Number of periods for simulation
c = NaN * zeros(N,1); %real consumption
tax = NaN * zeros(N,1); %real tax
yd = NaN * zeros(N,1); %real disposible income
i = NaN * zeros(N,1); % real investment
g = NaN * zeros(N,1); % real government expenditure
e = NaN * zeros(N,1); % real expenditure
y = NaN * zeros(N,1); % real income
md = NaN * zeros(N,1); % real money demand
ms = NaN * zeros(N,1); %real money supply
r = NaN * zeros(N,1); % interest rate
t=(1:N)'; % time variable
g = 330 * ones(N,1);
ms = 470 * ones(N,1);
y(1) = 2000;
for ii = 1:(N-1)
tax(ii) = -80 + 0.2 * y(ii);
yd(ii) = y(ii) - tax(ii);
c(ii) = 110 + 0.75 * yd(ii);
md(ii) = ms(ii);
r(ii) = (20 + 0.25* y(ii) -md(ii))/10; % inverting money demand
i(ii) = 320 -4 * r(ii);
e(ii) = c(ii) + i(ii) + g(ii);
y(ii+1) = e(ii);
end
tax(N) = -80 + 0.2 * y(N);
yd(N) = y(N) - tax(N);
c(N) = 110 + 0.75 * yd(N);
md(N) = ms(N);
r(N) = (20 + 0.25* y(N) -md(N))/10;
i(N) = 320 -4 * r(N);
e(N) = c(N) + i(N) + g(N);
base = [t,y,yd,c,g-tax,i,r];
fprintf(' t y yd c g-tax i r\n')
fprintf('%7.0f%7.0f%7.0f%7.0f%7.0f%7.0f%7.0f\n',base')
ybase = y;