function [res, answ] = computeOverallPerformanceLog(X, Y,lambda, theta, Xtrain, Ytrain)
  
  options = optimset('GradObj', 'on', 'MaxIter', 600);
 
  X = [ones(size(X,1),1) X];
   
  [theta, dummy] = fmincg(@(t)(logisticCost(Xtrain,Ytrain, t, lambda)), theta, options);
  
  p = sigmoid(X*theta);
  
  for i = 1:length(p)
    
    if p(i) >= 0.5
      
      p(i) = 1;
      
    elseif p(i) < 0.5
      
      p(i) = 0;
      
    endif
    
  endfor
  
  res = sum(abs(p-Y));
  res = (1 - res/length(Y))*100;
 
  answ = theta;
  
endfunction
