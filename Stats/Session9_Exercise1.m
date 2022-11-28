movieVotes = [5 7 2 5 7 6 1 4 8 6 7 7 6 5 7 2 4 6 5 6 7 7 2 10 7];

%use the two basic functions illustrated in class, to check the outoput of
%the function histogram on the vector movieVotes
% histogram(movieVotes,10)
figure()
% ---------- Insert your code here ----------------------------------------
histogram(movieVotes,10)
title('Movie')
% -------------------------------------------------------------------------
%use the additional parameter ('Normalization','probability') and check the
%result. Comment on the difference.
figure()
% ---------- Insert your code here ----------------------------------------
histogram(movieVotes,10,'Normalization','probability')
title('Movie')
% -------------------------------------------------------------------------

% repeat the exercises above for the vector weight.
weight = [105;95;98;85;86;86;89;80;81;82;82;80;83;84;84;82;80;81;81;76;78;77;77;80;76;76;75;75;79;79;70;71;71;72;73;74;72;66;67;69;68;68;66;62;60;61;58];
% --------- Insert your code here -----------------------------------------

figure()
histogram(weight,10)
title('Weight')

figure()
histogram(weight,10,'Normalization','probability')
title('Weight')

% now calcualate, for weight and movieVotes, mean, mode and standard
% deviation

Movie_Mean = mean(movieVotes);
Movie_Mode = mode(movieVotes);
Movie_Med = median(movieVotes);
Movie_STD = std(movieVotes);
Movie_STDPop = std(movieVotes,1);

Weight_Mean = mean(weight);
Weight_Mode = mode(weight);
Weight_Med = median(weight);
Weight_STD = std(weight);
Weight_STDPop = std(weight,1);
