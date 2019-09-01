data = load('AnswerTheta3gestures.txt');

s = "";
s1 = "";
s2 = "";

s = strcat(s, "{");
s1 = strcat(s1, "{");
s2 = strcat(s2, "{");


for i = 1:size(data,1)
  
    s = strcat(s, disp(data(i,1)));
    s = strcat(s, " ,");
    
    s1 = strcat(s1, disp(data(i,2)));
    s1 = strcat(s1, " ,");
    
    s2 = strcat(s2, disp(data(i,3)));
    s2 = strcat(s2, " ,");
    
    
    
endfor

s = strcat(s, "} ;");
s1 = strcat(s1, "} ;");
s2 = strcat(s2, "} ;");


filename = "Theta1.txt";
fid = fopen (filename, "w");
fputs (fid, s);
fclose (fid);

filename = "Theta2.txt";
fid = fopen (filename, "w");
fputs (fid, s1);
fclose (fid);

filename = "Theta3.txt";
fid = fopen (filename, "w");
fputs (fid, s2);
fclose (fid);
