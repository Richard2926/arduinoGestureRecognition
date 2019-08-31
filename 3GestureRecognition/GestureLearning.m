clear ; close all; clc;
fprintf('Welcome to arduino-Gesture Learning project \n');
fprintf('\n');
fprintf('Training data to find optimal Theta \n');
fprintf('\n');
data = load('data.txt');


trainingNo = 100;
dataPoints = 150;

lambda = (0:.1:30);

broken = findBrokenSamples(trainingNo, dataPoints, data);

if broken!= 0
  fprintf('Fix Broken Samples Before procedding \n');
  broken
  while(1) endwhile;
endif


[Xtrain, Ytrain, Xcv, Ycv, Xtest, Ytest] = reshapeDataNormalize(trainingNo, dataPoints, data);

theta = zeros((size(Xtrain,2)+1),1);

%lambdaLow = calculateLowestLambda(Xtrain, Ytrain, lambda, Xcv, Ycv, theta);
lambdaLow = 17.8;
%biasVar(Xtrain, Ytrain, Xcv, Ycv, lambdaLow, trainingNo);

[res1, answ] = computeOverallPerformanceLog(Xtest, Ytest,lambdaLow, theta, Xtrain, Ytrain);

if res1 == 100
  
    s = disp(answ);
    filename = "bestLogTheta.txt";
    fid = fopen (filename, "w");
    fputs (fid, s);
    fclose (fid);
    
 endif
    
    
    
fprintf('\n');
fprintf('\n');
fprintf('Overall Accuracy Performance of Logistic Regression is %f', res1);

fprintf(' Percentage.');

fprintf('\n\n');
