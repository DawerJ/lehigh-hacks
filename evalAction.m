function [ user, reward ] = evalAction( user,action, size )
%UNTITLED6 Summary of this function goes here
%   basically just check if this guy ran into a wall or not

LEFT = 1;
RIGHT = 2;
UP = 3; 
DOWN = 4;
wallhit = -1;

reward = -0.25;%the floor is lava. lukewarm lava

if(action ==UP)
    if(user(1) > 1)%if he's not against the left wall, move him left
        user(1) = user(1)-1;
    else
        reward = wallhit;
    end
    %'up'
end
if(action ==DOWN)
    if(user(1) < size)%if he's not against the left wall, move him left
        user(1) = user(1)+1;
    else
        reward = wallhit;
    end
    %'down'
end
if(action ==LEFT)
    if(user(2) > 1)%if he's not against the left wall, move him left
        user(2) = user(2)-1;
    else
        reward = wallhit;
    end
    %'left'
end
if(action ==RIGHT)
    if(user(2) < size)%if he's not against the left wall, move him left
        user(2) = user(2)+1;
    else
        reward = wallhit;
    end
    %'right'
end

%let's add a reward tile
if(user == [3,3])
    reward = 1;
    %user= randi([1 size], 1, 2);
    %'winning tile'
end
%let's also make most of the tiles around the reward tile be painful
if(user ==[3,2]|user == [3,6] |user ==[4,5])
    %reward = -20;
end

end

