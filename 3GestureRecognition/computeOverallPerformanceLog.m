function [res, answ] = computeOverallPerformanceLog(X, Y,lambda, theta, Xtrain, Ytrain, mul)
  
  options = optimset('GradObj', 'on', 'MaxIter', 600);
 
  X = [ones(size(X,1),1) X];
   
  thetaAll = zeros(size(X,2), mul);
  
  for i = 1:mul
    
    for j = 1:length(Ytrain)
      
      if Ytrain(j) == i 
        
        ins(j,1) = 1;
        
       else
        
        ins(j,1) = 0;
        
      endif
      
      
    endfor
   
  [thetaAll(:,i), dummy] = fmincg(@(t)(logisticCost(Xtrain,ins, t, lambda)), theta, options);
  
  
endfor

ins2 = sigmoid(X*thetaAll);

ins2 = ins2';

[dummy ins3] = max(ins2);

ins3 = ins3';

ins4 = find(ins3 != Y);

  res = (1 - length(ins4)/length(Y))*100;

  answ = thetaAll;


endfunction
