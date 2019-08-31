function Xdone = shuffle(X, noOfTimes)
  
  trainingNo = size(X,1);
  
  for q = 1:noOfTimes
  
    idx = randperm(trainingNo);
    idx = idx';

    Z = X;
    X = Z(idx,:);

    idx = randperm(trainingNo);
    idx = idx';

    Z = X;
    X = Z(idx,:);
    
end 

Xdone = X;
  
endfunction
