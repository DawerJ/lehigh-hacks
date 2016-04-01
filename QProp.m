function [ a_weights, b_weights ] = QProp( input,action, reward, newstate, a_weights,b_weights, gamma, alpha)
%UNTITLED3 Summary of this function goes here
%   basically, after you take an action via feedforward or rand, you then
%   get a reward. after you know what that is, you send the input, action
%   reward weights etc to Qprop which then creates a training case for use
%   with backprop. it then calls backprop. 

%   given a state, the reward for the action taken should be 
%   reward + (gamma * max(Feedforward(state))). the remaining should be
%   left unchanged

%first let me get the non-updated current network outputs for this state

goal = FeedForward(input, a_weights,b_weights);

%next let me make sure that action isn't one-hot encoded
if (length(action) == length(goal))%must mean we just passed a single val
    action = find(action==1);
end

%modify the goal for the action we took. leave the rest unchanged
%goal
goal(action) = reward+ gamma* max(FeedForward(newstate,a_weights,b_weights));
j = 1;
%in case of win case in grid world ***wincase makes things screwy
if(reward>300)
    goal(action) = reward;
    goal(find(goal~=reward)) =-1;
    j = 30;
end
for i = 1:j
[a_weights, b_weights] = BackProp(input, goal, alpha, a_weights, b_weights);
end

end

