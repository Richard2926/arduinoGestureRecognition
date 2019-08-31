function [lambdaLow] = calculateLowestLambda(Xtrain, Ytrain, lambda, Xcv, Ycv, theta)
  
  errorJ = 0;
  errorCV = 0;
  
  options = optimset('GradObj', 'on', 'MaxIter', 600);
  initial_theta = rand(size(theta));
   
  for i = 1:size(lambda')
    
    [theta, dummy] = fmincg(@(t)(logisticCost(Xtrain, Ytrain, t, lambda(i))), initial_theta, options);
    
    [errorJ(i) dummy] = logisticCost(Xtrain, Ytrain, theta, 0);
   
    [errorCV(i) dummy] = logisticCost(Xcv, Ycv, theta, 0);
    
  
  endfor
  
  errorCV = errorCV(:);
  errorCV = errorCV';
  
  [dummy, col] = min(errorCV, [ ], 2);
  
  lambdaLow = lambda(col);
  
  subplot (2, 1, 1)
  plot(lambda, errorCV, "g-", lambda, errorJ, "r-");
  xlabel("Lambda");
  ylabel("Error");
  legend("J-CrossVal Set", "J-TrainingSet");
  title("Impact of Lambda");



endfunction
