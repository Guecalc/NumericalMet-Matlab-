function ffact = prob0626(eD,ReN)
% prob0626: friction factor with Colebrook equation
%   ffact = prob0626(eD,ReN):
%     uses modified secant equation to determine the friction factor
%     with the Colebrook equation
% input:
%   eD = e/D
%   ReN = Reynolds number
% output:
%  ffact = friction factor
maxit=100;es=1e-8;delta=1e-5;
iter = 0;
% Swamee-Jain equation:
xr = 1.325 / (log(eD / 3.7 + 5.74 / ReN ^ 0.9)) ^ 2;
% modified secant method
while (1)
  xrold = xr;
  xr = xr - delta*xr*func(xr,eD,ReN)/(func(xr+delta*xr,eD,ReN)...
                                   -func(xr,eD,ReN));
iter = iter + 1;
if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
if ea <= es || iter >= maxit, break, end
end
ffact = xr;
function ff=func(f,eD,ReN)
ff = 1/sqrt(f) + 2*log10(eD/3.7 + 2.51/ReN/sqrt(f));