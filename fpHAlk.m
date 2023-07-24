 function f = fpHAlk(pH,pCO2,Alk)

K1=10^-6.3;K2=10^-10.3;Kw=10^-14; %values

KH=10^-1.46;

H=10^-pH;

f=K1/(1e6*H)*KH*pCO2+2*K2*K1/(1e6*H^2)*KH*pCO2+Kw/H-H-Alk;

% to run, use script 
% [pH2008 fx ea iter]=bisect(@fpHAlk,2,12,1e-8,50,386,0.4e-3) 