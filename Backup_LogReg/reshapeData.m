function X = reshapeDataNormalize(trainingNo, dataPoints, data)
  
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
  
endfunction
