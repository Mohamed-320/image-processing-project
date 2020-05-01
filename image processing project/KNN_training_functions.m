clear all
close all
clc

%initialize filter
vector = zeros(1,4);

%objects training functions from database in images folder
%train apple function
for i = 62:69
    image = imread(strcat(['images/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'A';
end

%train banana function 
for i = 55:61
    image = imread(strcat(['images/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'B';
end

%train Oranges
for i = 35:46
    image = imread(strcat(['images/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'O';
end

%train grapes
for i = 47:54
    image = imread(strcat(['images/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'G';
end

save('featureVectors.mat', 'vector', 'Y');

%% 
clear all
close all
clc

load('featureVectors.mat');
%mdl = fitcknn(vector,Y,'NumNeighbors',3,'Standardize',1);
mdl = ClassificationKNN.fit(vector,Y,'NumNeighbors',3);

% returns a matrix of scores, indicating the likelihood that a label comes 
% from a particular class.
[label,POSTERIOR, score] = ClassificationKNN.predict(mdl,Xnew);