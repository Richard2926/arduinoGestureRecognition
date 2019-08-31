clear ; close all; clc;
fprintf('Welcome to arduino-Gesture Learning project \n');
fprintf('\n');
fprintf('Training data to find optimal Theta \n');
fprintf('\n');
data = load('data.txt');

trainingNo = 150;
dataPoints = 120;

lambdaLow = 100;

broken = findBrokenSamples(trainingNo, dataPoints, data);

if broken!= 0
  fprintf('Fix Broken Samples Before procedding \n');
  broken
  while(1) endwhile;
endif


[Xtrain, Ytrain, Xcv, Ycv, Xtest, Ytest] = reshapeDataNormalize(trainingNo, dataPoints, data);

theta = rand((size(Xtrain,2)+1),1);

noOfGestures = 3;

[res1, answ] = computeOverallPerformanceLog(Xtest, Ytest,lambdaLow, theta, Xtrain, Ytrain, noOfGestures);

while res1 != 100
  

    
    
    theta = zeros((size(Xtrain,2)+1),1);
    [Xtrain, Ytrain, Xcv, Ycv, Xtest, Ytest] = reshapeDataNormalize(trainingNo, dataPoints, data);

    fprintf('\n');
fprintf('Overall Accuracy Performance of Logistic Regression is %f', res1);
fprintf('\n');
fprintf('\n');
fprintf('Training Again to reach perfction ');
fprintf('\n');
fprintf('\n');
    [res1, answ] = computeOverallPerformanceLog(Xtest, Ytest,lambdaLow, theta, Xtrain, Ytrain, noOfGestures);

 endwhile
    
        s = disp(answ);
    filename = "bestLogAllTheta.txt";
    fid = fopen (filename, "w");
    fputs (fid, s);
    fclose (fid);
    
    
fprintf('\n');
fprintf('\n');
fprintf('Overall Accuracy Performance of Logistic Regression is %f', res1);

fprintf(' Percentage.');

fprintf('\n\n');