data = xlsread('Grunfeld.xlsx','A2:E201');
Y_GM = data(1:20, 3); % I
X_GM = [ones(20,1),data(1:20,[4 5])]; % constant F C
Y_GE = data(61:80, 3); % I
X_GE = [ones(20,1),data(61:80,[4 5])]; % constant F C
Y_CH = data(41:60, 3); % I
X_CH = [ones(20,1),data(41:60,[4 5])]; % constant F C
Y_WE = data(141:160, 3); % I
X_WE = [ones(20,1),data(141:160,[4 5])]; % constant F C
Y_US = data(21:40, 3); % I
X_US = [ones(20,1),data(21:40,[4 5])]; % constant F C
Y = [Y_GM', Y_GE', Y_CH', Y_WE', Y_US']'; % leave out ; for testing if
% necessary delete during run or output will be unreadable
X = [X_GM', X_GE', X_CH', X_WE', X_US']';
pols.beta = (X'*X)\X'*Y;
pols.uhat = Y - X*pols.beta ;
pols.sigsq = (pols.uhat'*pols.uhat)/(size(X,1)-size(X,2));%(T-k)
pols.sdbeta = sqrt(diag(inv(X'*X))*pols.sigsq);
pols.tbeta = pols.beta ./ pols.sdbeta;
pols.se = sqrt(pols.sigsq);
label = ['Constant '; 'F '; 'C '];
disp('OLS Results using stacked matrices')
disp(' coef sd t-stat')
for ii=1:size(X,2)
fprintf(’%s%10.4f%10.4f%10.4f\n’,label(ii,:),...pols.beta(ii),...pols.sdbeta(ii), ...pols.tbeta(ii)
end
fprintf('Estimated Standard Error %10.4f\n\n\n',pols.se)

% Verification using Lesage package
%
pooled = ols(Y, X);
vnames= ['I ';
'Constant ';
'F ';
'C '];
prt(pooled,vnames)
