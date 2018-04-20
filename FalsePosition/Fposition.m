%% Algorithm homework 9
clc
clear
syms x
f = symfun(func,[x]);
function[root,fx,ea,iter] = Fposition(func,xl,xu,es,maxiter)
if nargin < 3
    error('3 inputs required');
end
test = func(xl,varagrin{:})*func(xu,varagrin{:});
if test>0
    error('no sign change')
end
if nargin<4||isempty(es)
    es = 0.0001;
end
if nargin<5||isempty(maxit)
    maxit = 50;
end
iter = 0;
ea = 100;
rootest = [(xu-xl)*f(xl)]/[f(xu)-f(xl)];
if f(rootest)*f(xl)<0
    xu = rootest;
else f(rootest)*f(xu)<0
    xl = rootest;
end
xr = rootest;
iter = 1;
while iter > maxiter || ea < es
    rootest = [(xu-xl)*f(xl)]/[f(xu)-f(xl)];
    if f(rootest)*f(xl)<0
    xu = rootest;
    else f(rootest)*f(xu)<0
    xl = rootest;
    end
    ea = [(rootest - xr)/rootest]*100;
    iter = iter + 1;
    xr = rootest;
end
root = xr;
fx = f(xr);
disp(root)
disp(fx)
disp(ea)
disp(iter)
end