function [ Filter, operations,Fstab,Ostab ] = Mutate( Filter, operations, Fstab, Ostab )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%Fstab refers to the stability of each filter index.
%Ostab refers to the stability of each operations index.
%the less stability, the more mutations will happen
alpha = 25;
deltaOps = 20;
DIV = 1; 
MULT = 2;
ADDITION = 3;
SUBTRACTION = 4;
POW = 5;
MOD = 6;

%there should also be a decay factor on stability
%eventually it should be dependant on the operations being used but for now
%it will just be generic number
ind = find(Ostab>20);
Ostab(ind) = Ostab(ind)-15;
ind = find(Fstab>20);
Fstab(ind) = Fstab(ind)-15;


for i = 1:length(Filter)
    if randi([1,100])>Fstab(i)%if it is unstable enough to mutate
        Filter(i) = randi([1,length(Filter)]);
        Fstab(i) = Fstab(i)+alpha;
    end
end

for i = 1:length(Ostab)
    if randi([1,100])>Ostab(i)
        operations(i) = randi([1,6]);%there are only 6 possible operations atm
        Ostab(i) = Ostab(i)+alpha;
        
        %if this was mult, div, or power, all prior operations should
        %become more stable. so should the numbers
        o = operations(i);
        if(o==DIV || o==MULT || o==POW)
            Ostab(1:i) = Ostab(1:i)+deltaOps;
            Fstab(1:i+1) = Fstab(1:i+1)+deltaOps;
        end
        
    end
end



end

