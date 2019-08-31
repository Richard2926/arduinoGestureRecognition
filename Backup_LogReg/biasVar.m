function [] = biasVar(Xtrain, Ytrain, Xcv, Ycv, lambdaLow, trainingNo)
  
  errorJ = 0;
  errorCV = 0;
  
    options = optimset('GradObj', 'on', 'MaxIter', 600);
  
  initial_theta = rand((size(Xtrain,2)+1),1);
  
  
  for i = 1:size(Xtrain,1)
    
    
    X = Xtrain(1:i,:);
    Y = Ytrain(1:i,:);
    
    
      
    [theta, dummy] = fmincg(@(t)(logisticCost(X,Y, t, lambdaLow)), initial_theta, options);
    
    [errorJ(i) dummy] = logisticCost(Xtrain, Ytrain, theta, 0);
   
    [errorCV(i) dummy] = logisticCost(Xcv, Ycv, theta, 0);
    
  endfor
  
  x = (1:1:size(Xtrain,1));
  
  subplot (2, 1, 2)
  plot(x, errorCV, "g-", x, errorJ, "r-");
  xlabel("No of Examples Trained");
  ylabel("Error for corresponding no trained");
  legend("J-CrossVal Set", "J-TrainingSet");
  title("Learning Curve");
  
endfunction
