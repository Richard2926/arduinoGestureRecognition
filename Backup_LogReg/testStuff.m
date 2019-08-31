function [] = testStuff()
  
  theta = [ 1 2; 2 3 ; 45 56]
s = disp(theta)
    filename = "bestLogTheta.txt";
    fid = fopen (filename, "w");
    fputs (fid, s);
    fclose (fid);

endfunction
