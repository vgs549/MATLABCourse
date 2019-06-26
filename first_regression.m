nsimul=50
x1=ones(nsimul,1)
beta=[5,1,0.1]'
x2=[1:nsimul]'
x3=rand(nsimul,1)*2+3
e=randn(nsimul,1)*0.2
X=[x1,x2,x3]
y=X*beta+e
[nobs,nvar]=size(X)
ols.betahat=(X'*X)\X'*y
ols.yhat=X*ols.betahat
ols.resid=y-ols.yhat
ols.ssr=ols.resid'*ols.resid
ols.sigmasq = ols.ssr/(nobs-nvar)
ols.covbeta=ols.sigmasq*inv(X'*X)
ols.sdbeta=sqrt(diag(ols.covbeta))
ols.tbeta=ols.betahat ./ ols.sdbeta
ym=y-mean(y)
ols.rsqr1=ols.ssr
ols.rsqr2=ym'*ym
ols.rsqr=1.0-ols.rsqr1/ols.rsqr2
ols.rsrq1=ols.rsqr1/(nobs-nvar)
ols.rsqr2=ols.rsqr2/(nobs-1)
ols.rbar=1-(ols.rsqr1/ols.rsqr2)
ols.ediff=ols.resid(2:nobs)-ols.resid(1:nobs-1)
ols.dw=(ols.ediff'*ols.ediff)/ols.ssr
fprintf('R-squared = %9.4f \n', ols.rsqr);
fprintf('Rbar-squared = %9.4f \n ', ols.rbar);
fprintf('sigma^2=%9.4f \n ',ols.sigmasq);
fprintf('S.E.=%9.4f \n ',sqrt(ols.sigmasq));
fprintf('Durbin-Watson = %9.4f \n ' ,ols.dw);
fprintf('Nobs, Nvars =%6d, %6d \n ' ,nobs,nvar)
fprintf('%12s %12s %12s %12s \n' ,'Variable','Coefficient','Standard Error','t-statistic')
fprintf('%12s %12.6f %12.6f %12.6f \n', 'Cons',...
ols.betahat(1), ols.sdbeta(1), ols.tbeta(1))
fprintf('%12s %12.6f %12.6f %12.6f \n', 'Trend',...
ols.betahat(2), ols.sdbeta(2), ols.tbeta(2))
fprintf('%12s %12.6f %12.6f %12.6f \n', 'Var2',...
ols.betahat(3), ols.sdbeta(3), ols.tbeta(3))

plot(x2,ols.resid)
title('My Regression')
xlabel('Time')
ylabel('Residual')