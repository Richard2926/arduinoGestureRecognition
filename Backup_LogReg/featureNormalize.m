function X_norm = featureNormalize(X)
  
X_norm = X;
mu = mean(X);
sigma = std(X);
X = (X - mu)./sigma;
X_norm = X;

end
