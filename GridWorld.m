function [ ] = GridWorld( size, hiddenlayersize, gamma, alpha )
%UNTITLED4 Summary of this function goes here
%   creates a grid. agent follows a policy to walk around grid and avoid
%   bumping into the walls

%possible actions: move up, move down, move left, move right

Grid = zeros(size);

user = randi([1 size], 1, 2); %user is randomly initialized on the grid

epsilon = 1;%prbability that I will choose random action over the q-action
epochs = 5000;

sumreward = 0;

%let's get some random matrices for the sake of the neural net and q
%learning. don't forget to account for bias weight
b_weights = rand(hiddenlayersize,4);
a_weights = rand(3, hiddenlayersize-1);%user location and bias

%training
for i = 1:epochs

    Grid(user(1), user(2)) = 1;

    action = getAction(user, epsilon, a_weights,b_weights);
    Grid(user(1), user(2)) = 0;
    paststate = user;

    [user, reward] = evalAction(user, action, size);
    sumreward = sumreward + reward;
    
    %update my neural net
    [a_weights b_weights] = QProp(paststate,action,reward,user,a_weights,b_weights,gamma,alpha);
    %update epsilon for greedy epsilon search
    epsilon = epsilon - epsilon/epochs;
end

sumreward%/epochs
epsilon = -1;
newsum = 0;

epochs = 50;
%after training
user = randi([1 size],1,2);
for i = 1:epochs

    Grid(user(1), user(2)) = 1

    action = getAction(user, epsilon, a_weights,b_weights);
    Grid(user(1), user(2)) = 0;
    Grid(3,2) = 7;
    paststate = user;

    [user, reward] = evalAction(user, action, size);
    newsum = newsum + reward;
    
    %update my neural net
    [a_weights b_weights] = QProp(paststate,action,reward,user,a_weights,b_weights,gamma,alpha);
    %update epsilon for greedy epsilon search
    %epsilon = epsilon - epsilon/epochs;
end
sumreward/epochs
newsum/epochs

end

