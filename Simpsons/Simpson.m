function [I] = Simpson(x,y)
%this function computes the integral of a given set of data input as a
%matrix of x values (x) and a matrix of y values (y) using the simpsons 1/3
%rule. in the event that there is an uneven amount of x inputs, the
%trapezoidal rule will be used to calculate the 'odd man out' or the final
%step of the integration. if there is an even number, the function will
%simply calculate thye integral (I) using the simpsons 1/3 rule
%the section below will ensure that a correct number of inputs is typed in
%by the user
if nargin <2
    error('must have input and output values')
end
%this section checks to make sure that every x value put in has a
%corresponding y value
if length(x)~=length(y)
    error('every input must have a corresponding output')
end
%this section checks to make sure the step size between x inputs is the
%same
Z = diff(x);
if (max(Z)-min(Z))>(1*10^(-15))
    error('the step size between x values must be the same')
end
%this section will determine if the trapezoidal rule is required and warn
%the user if it is
L = length(x);
if mod(L,2) == 0
    disp('the trapezoidal rule is required for this data')
    T = 1;
elseif mod(l,2) == 1
    T = 0;
end
%this section calculates the value of the integral for an even number of
%inputs (no trapezoidal rule)
if T == 0
    DX = (x(L)-x(1));
    P1 = y(1);
    i = 1;
    for i = 1:2:(L-2)
        F2 = (y(i+1)+2);
        part2(i) = F2;
    end
    P2 = 4*sum(part2);
    i = 2;
    for i = 2:2:(L-1)
        F3 = y(i+1);
        part3(i) = F3;
    end
    P3 = 2*sum(part3);
    P4 = y(L);
    I = DX*((P1+P2+P3+P4)/(3*L));
end
%this section calculates the integral with an odd number of x inputs (with
%the trapezoidal rule
if T == 1
    DX = (x(L-1)-x(1));
    P1 = y(1);
    i = 1;
    for i = 1:2:(L-2)
        F2 = (y(i+1)+2);
        part2(i) = F2;
    end
    P2 = 4*sum(part2);
    i = 2;
    for i = 2:2:(L-3)
        F3 = y(i+1);
        part3(i) = F3;
    end
    P3 = 2*sum(part3);
    P4 = y(L-1);
    Trap = ((y(L)+y(L-1))/2)*(x(L)-x(L-1));
    I = (DX*((P1+P2+P3+P4)/(3*(L-1))))+Trap;
end
end