function [Xtrain, Ytrain, Xcv, Ycv, Xtest, Ytest]  = reshapeDataNormalize(trainingNo, dataPoints, data)
  
  subf1 = 0;
  subf2 = 0;
  subf3 = 0;
  
  previous = 0;
  X = zeros(1, dataPoints*3);
  
  for i = 1: trainingNo
    
    subf1 = (data((previous+1):(previous+dataPoints),3))';
    subf2 = (data((previous+1):(previous+dataPoints),4))';
    subf3 = (data((previous+1):(previous+dataPoints),5))';
    
    
    X = [X; [subf1 subf2 subf3]];
    
    previous += length(find(data(:,1)==i));
  endfor
  
  X = X(2:end,:);
  
  X = featureNormalize(X);

  Y = [ones(50,1) ; zeros(50,1)]; %need to modify seperately if data changes

  X = [X Y];

for q = 1:3
  
    idx = randperm(trainingNo);
    idx = idx';

    Z = X;
    X = Z(idx,:);

    idx = randperm(trainingNo);
    idx = idx';

    Z = X;
    X = Z(idx,:);
    
end 

Xtrain = X(1:round(trainingNo*6/10),:);
Xcv = X((round(trainingNo*6/10)+1):round(trainingNo*8/10),:);
Xtest = X((round(trainingNo*8/10)+1):end,:);

Ytrain = Xtrain(:,end);
Ycv = Xcv(:,end);
Ytest = Xtest(:,end);

Xtrain = Xtrain(:,1:(end-1));
Xcv = Xcv(:,1:(end-1));
Xtest = Xtest(:,1:(end-1));


endfunction
