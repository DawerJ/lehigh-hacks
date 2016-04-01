function [ a_weights, b_weights ] = BackProp(input,goal,alpha,a_weights, b_weights)
%UNTITLED2 updates for a single training item
%   backprop bro. pretty straightforward


%for a refresher, check this out https://inst.eecs.berkeley.edu/~cs182/sp06/notes/backprop.pdf
%or even your own powerpoints...you've presented this atleast 4 times


%feed forward and get relevant info
input = [input 1];
h_layer = input * a_weights;
h_layer = logsig(h_layer);
%gotta add a bias again
h_layer = [h_layer 1];

output = h_layer*b_weights;
output = logsig(output);

%create delta matrices
delta_b = b_weights;
delta_a = a_weights;

%gotta work on delta b first.
error_term = (goal-output).*output.*(1-output); %this is the same for every row in a col
for i = 1:length(h_layer)
    delta_b(i,:) = error_term*h_layer(i);
end
% for i = 1:length(h_layer)
%     delta_b(i,:) = delta_b(i,:) .*error_term;
% end
% for i= 1:length(output)
%     delta_b(:,i) = delta_b(:,i) .* h_layer';
% end
%finished calculating deltab hopefully
%now delta a ****THIS is definitely wrong lol
error_term2 = (delta_b*error_term')' .*h_layer.*(1-h_layer);
error_term2 = error_term2(1:length(error_term2)-1);
%input;

%error_term2 = error_term2.*input';
for i = 1:length(input)
    delta_a(i,:) = error_term2*input(i);
end

% for i = 1:(length(h_layer)-1)
%     delta_a(:,i) = delta_a(:,i).*input';
% end
% for i = 1:length(input)
%     delta_a(i,:) = delta_a(i,:).*error_term2;
% end

a_weights = a_weights + alpha*delta_a;
b_weights = b_weights + alpha*delta_b;
%delta_a
%delta_b

end