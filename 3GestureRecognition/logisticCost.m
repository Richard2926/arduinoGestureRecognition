function [J grad] = logisticCost(X, Y, theta, lambda)
  
  X = [ones(size(X,1),1) X];
  
  reg_theta = [0;theta(2:end)];
  
  J = (1/size(X,1))* ( -Y' * log(sigmoid(X*theta)) - (1 -Y)' * log(1 - sigmoid(X*theta))) +  (lambda/(2*size(X,1)))* sum(reg_theta.^2);
  
  grad = ((1/size(X,1))* ((sigmoid(X*theta) - Y)' * X) + ((lambda/size(X,1)).*reg_theta)')';
 
endfunction
