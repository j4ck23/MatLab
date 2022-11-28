movieVotes = [5 7 2 5 7 6 1 4 8 6 7 7 6 5 7 2 4 6 5 6 7 7 2 10 7];

%use the two basic functions illustrated in class, to check the outoput of
%the function histogram on the vector movieVotes
% histogram(movieVotes,10)
figure()
% ---------- Insert your code here ----------------------------------------
histogram(movieVotes,10,'BinEdges',[0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5])
% -------------------------------------------------------------------------
%use the additional parameter ('Normalization','probability') and check the
%result. Comment on the difference.
figure()
% ---------- Insert your code here ----------------------------------------
histogram(movieVotes,10,'BinEdges',[0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5],'Normalization','probability')
% -------------------------------------------------------------------------

% repeat the exercises above for the vector weight.
weight = [105;95;98;85;86;86;89;80;81;82;82;80;83;84;84;82;80;81;81;76;78;77;77;80;76;76;75;75;79;79;70;71;71;72;73;74;72;66;67;69;68;68;66;62;60;61;58];
% --------- Insert your code here -----------------------------------------
histogram(weight,12,'BinEdges',[50 55 60 65 70 75 80 85 90 95 100 105])
% now calcualate, for weight and movieVotes, mean, mode and standard
% deviation
meamW = mean(weight);
modeW = mode(weight);
medianW = median(weight);
