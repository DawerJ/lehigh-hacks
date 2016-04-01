function [ out ] = ForwardPass( filter,inputs,operations )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%the filter vector should be a vector of length same as inputs where each element
%points to an index in inputs. 
%operations should be a vector of length one less than inputs
%where each element designates
%an operation to be done eg ^ * / - + %.  possible values of any element in
%operations should be between 1 and  6.

inputs = inputs(filter); %filter essentially acts as a permutation vector
out = inputs(1);
%note, this does not follow order of operations. i should figure out how to
%make it follow order of operations and also add parenthases to options.
%but that's for later
for i = 1:(length(inputs)-1)
    out = Dictionary(out,inputs(i+1), operations(i));
end

end

