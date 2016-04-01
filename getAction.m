function [ action ] = getAction( user, epsilon, a_weights, b_weights )
%UNTITLED5 Summary of this function goes here
%   policy for deciding on an action. In the grid world, there are only 4
%   possible actions: up down left right. for now, I'm just going to make 
%   it random


if(epsilon >= rand())
    [r c] = size(b_weights);
    action = randi([1 c]);
    action = action(1);
else
    action = FeedForward(user,a_weights,b_weights);
    action = find(action==max(action));
    action = action(1);
end


end

