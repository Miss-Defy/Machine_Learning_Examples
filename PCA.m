% PCA
% Elizaveta Latash
% homework


x=[2.5 ; .5 ; 2.2 ; 1.9];
y=[2.4 ; .7 ; 2.9 ; 2.2];

Data=[x y ];


Zero_mean=[];
Zero_mean(:,1)=Data(:,1)-mean(Data(:,1));
Zero_mean(:,2)=Data(:,2)-mean(Data(:,2));


 T_Zero_mean=Zero_mean';
 
 
 Cov=cov(Zero_mean);
 
 
 [V,D]=eig(Cov);
 
 
 
 
 % lecture slides example
 
 
x1=[ 2.5 ; .5 ; 2.2 ; 1.9 ; 3.1 ; 2.3 ; 2 ; 1 ; 1.5 ; 1.1];
y1=[2.4 ; .7 ; 2.9 ; 2.2 ; 3 ; 2.7 ; 1.6 ; 1.1 ; 1.6 ; .9];
% x1=[ .69 ; -1.31 ; .39 ; .09 ; 1.29 ; .49 ; .19 ; -.81 ; -.31 ; -.71];
% y1=[.49 ; -1.21 ; .99 ; .29 ; 1.09 ; .79 ; -.31 ; -.81 ; -.31 ; -1.01];
 
Data1=[x1 y1 ];
 
Zero_mean1=[];
Zero_mean1(:,1)=Data1(:,1)-mean(Data1(:,1));
Zero_mean1(:,2)=Data1(:,2)-mean(Data1(:,2));

T_Zero_mean1=Zero_mean1';

Cov1=cov(Zero_mean1);
 
[V1,D1]=eig(Cov1);

Feature_row_vec=[.6779 .7352];
