function [ guess ] = EvalAPoint( Filter,Operations, data )
%UNTITLED Summary of this function goes here
%   what does my filter/op predict, given an input?
%note. this only takes a single row and gives you the answer

[r,c] = size(data);
%i = -5:(10)/(length(Filter)-c-1):5; %this is the extra stuff i need to complete input
i = -5:.2:5; %this is 51 elements

inputs = [data i];
    
guess = ForwardPass(Filter,inputs,Operations);

end

