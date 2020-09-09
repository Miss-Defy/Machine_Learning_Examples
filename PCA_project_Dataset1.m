% PCA - ALS
% Elizaveta Latash
% Machine Learning Project - Fill missing values using PCA - ALS

A=load('Dataset1.txt');
[a1,a2] = size(A);
% choose number of principal components
Number_of_components = 2;

% 1 --> RMSE =    3.1985e-08
% 2 --> RMSE =    8.8832e-09      *** Best one
% 3 --> RMSE =    3.8551e-08
% 4 --> RMSE =    1.7929e-08  
% 5 --> RMSE =    2.1991e-08
% 6 --> RMSE =    1.0612e-07
M = A;
M(M > 10) = NaN;

[coeff,score,latent,tsquared,explained,mu] = pca(M,'algorithm','als','NumComponents',Number_of_components);
Filled = score * coeff' + repmat(mu, a1, 1);
%Filled = fillPCA(M, Number_of_components);

Y = Filled;
rng('default');
ix = random('unif',0,1,size(Y))<0.04;
Y(ix) = NaN;

[coeff1,score1,latent1,tsquared1,explained1,mu1] = pca(Y,'algorithm','als','NumComponents',Number_of_components);

t1 = score1*coeff1' + repmat(mu1,a1,1);

numOfNans = sum(ix(:));
Err = (t1 - Filled) .^ 2;
sum_Err_sq = sum(Err(ix));

RMSE=sqrt(sum_Err_sq/numOfNans);

function filled = fillPCA(original, numOfComps)
    nanIdx = isnan(original);
    [coeff,score,latent,tsquared,explained,mu] = pca(original, 'algorithm', ...
            'als', 'NumComponents', numOfComps);
    returned = score * coeff' + repmat(mu, size(original, 1), 1);
    result = original;
    result (nanIdx) = returned(nanIdx);
    filled = result;
end
