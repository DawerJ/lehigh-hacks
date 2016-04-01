function [ out] = Dictionary( x1,x2,operation )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%possible operations are + - * / ^ . this should be expanded to add ()
%later as well as follow order of operations. also need to add cos and sin.
%overall this whole thing just needs to be more robust lol

%I should also add a "stop" operation that makes it so it doesn't evaluate
%anything further down the line

DIVISION = 1; 
MULTIPLICATION = 2;
ADDITION = 3;
SUBTRACTION = 4;
POWER = 5;
MOD = 6;

switch operation
    case DIVISION 
        out = x1/x2;
    case MULTIPLICATION
        out = x1*x2;
    case ADDITION
        out = x1+x2;
    case SUBTRACTION
        out = x1-x2;
    case POWER
        out = x1^x2;
    case MOD
        out = x1+x2;% mod(x1,x2); %fix this later
    otherwise
        out = 0;'error'
end
    
    
    
    

end

