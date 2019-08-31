function broken = findBrokenSamples(trainingNo, dataPoints, data)
  
  previous = 0;
  goal = 0;
  found = 0;
  trackNo = 0;
  broken = [0 0];
  
  for i = 1:trainingNo
    
    p = length(find(data(:,1) == i));
    
    if p < dataPoints
      
      
      goal = dataPoints - p;
      trackNo = 0;
      found = 0;
      while found != goal
        
        trackNo++;
        
        inst = trackNo+previous;
        answ = trackNo+found;
        
        
        if data(inst,2) != answ
          found++;
          broken = [broken; [i answ]];
        endif
      endwhile
    endif
    previous+= p;
  endfor
  
  
  broken = broken(2:end, :);
endfunction