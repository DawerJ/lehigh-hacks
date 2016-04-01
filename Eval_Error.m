function [ error ] = Eval_Error( Filter,Operations, data, target )
%UNTITLED6 Summary of this function goes here
%   for now this will just give a positive fitness if the MSE decreases.
%   update later with divergence measures instead of classification stuff

%data is in rows. 

%first we gotta make an input list that is as long as the filter
[r,c] = size(data);
%i = -5:(10)/(length(Filter)-c-1):5; %this is the extra stuff i need to complete input
i = -5:.2:5; %this is 51 elements

error = 0;
for k = 1:r
    inputs = [data(k,:) i];
    
    guess = ForwardPass(Filter,inputs,Operations);
    %guess
    %target(k)
    %guess = logsig(guess);%for classification if i want
    error = error + (target(k)-guess)^2;
    %error = error + (abs(target(k))-abs(guess))/(abs(target(k))+abs(guess));
    %error = error + abs((target(k)-guess)/(target(k)));
    %error = error + abs(target(k)-guess);
end
error = abs(error/r);%take out abs for complex options


end

