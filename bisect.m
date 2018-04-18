%% Homework 9
%% 
syms x
function[root,fx,ea,iter] = bisect(func,xl,xu,es,maxit,varagrin)
%the segement below will display an error if the user tries to run the
%program with an incorrect number of inputs
if nargin < 3
    error('3 inputs required');
end
%the next section is testing to see if the inputs for binding the root
%are correct. it does so by multiplying the Y - values of the 2 bounds
%which should always be a positive and negative number, resulting in a
%negative
test = func(xl,varagrin{:})*func(xu,varagrin{:});
% the code below will throw an error if the result of the previous lines is
% non negative (which means that the root is incorrectly bracketed)
if test>0
    error('no sign change')
end
%the next section will assign the input es a default value if either es is
%left blank or only 3 inputs are typed in
if nargin<4||isempty(es)
    es = 0.0001;
end
%the next section will assign the input maxit a default value if either maxit is
%left blank or only 4 inputs are typed in
if nargin<5||isempty(maxit)
    maxit = 50;
end
%these are the starting values
iter = 0;
xr = xl;
ea = 100;

while(1)
    xrold = xr;
    xr = (x1 + xu)/2;
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr - xrold)/xr)*100;
%this while loop then calculates your estimated root based on the inputted
%upper and lower bounds. then it will calculate the error
    end
    test = func(xl,varagrin{:})*func(xr,varagrin{:});
    if test < 0
        xu = xr;
    elseif test > 0
        x1 = xr;
% the above section tests the new midpoint bound with both the upper and
% lower bound to see on which of those 2 intervals there is a sign change.
% then based on that it assigns the midpoint value as either the new upper
% or the new lower bound
    else
        ea = 0;
% this section provides a little caveot that says if the resultant root
% guess of the first iteration is the actual root, then the error is zero
% and the root is found
    end
%this segment of code will break the loop and finish the program if either
%the maximum number of specified iterations is ecxeeded, or the error falls
%below the specified percentage
    if ea<=es || iter>=maxit
        break;
    end
end
%these last 2 lines will give you your answer. the root will be your
%calculated root that satisfies the above restrictions, and fx will be the
%Y-value of that root (which should be very close to 0)
root = xr
fx = func(xr,varagrin{:})
end
    
    
    