function [ output ] = FeedForward( inputs, a_weights, b_weights )
%UNTITLED this will be the classification version ie logsig
%   single hidden layer

%assume we gotta tack on the bias ourselves to make the inputs match the
%weights size. 

%a weights is the first layer b is the second. row is origin, col is output

inputs = [inputs 1]; %assuming row vector


h_layer = inputs * a_weights;
h_layer = logsig(h_layer);
%gotta add a bias again
h_layer = [h_layer 1];

output = h_layer*b_weights;
output = logsig(output);


end

