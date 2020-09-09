% KNN Algorithm
% Elizaveta Latash

filename = 'KNN_Data.xlsx';
[num,txt,raw] = xlsread(filename);
G=num(:,2:6);
Output=num(1:end,end);
% D=strcmp(F(1,1),'Yes');

[x,y]=size(G);
x1=length(Output)-2;


D1=[];
for i=1:x1;
    for j=1:y; 
       D1(i,j)=(abs(G(11,j)-G(i,j)));
    end
end


D2=[];
for i=1:x1;
    for j=1:y; 
       D2(i,j)=(abs(G(12,j)-G(i,j)));
    end
end


d1=[];
for i=1:x1;
d1(i,1)=sum(D1(i,:));
end


d2=[];
for i=1:x1;
d2(i,1)=sum(D2(i,:));
end


W1=[];
wo=0;
we=0;
for i=1:x1;
    if Output(i,1)==1;
        wo=wo+1;
        W1(wo,1)=(1/d1(i,1)^2);
    else
        if Output(i,1)==0;
        we=we+1;
        W1(we,2)=(1/d1(i,1)^2);

        end
    end
end


%%% K = all samples
% w1_yes=sum(W1(:,1));
% w1_no=sum(W1(:,2));





W2=[];
woo=0;
wee=0;
for i=1:x1;
    if Output(i,1)==1;
        woo=woo+1;
        W2(woo,1)=(1/d2(i,1)^2);
    else
        if Output(i,1)==0;
        wee=wee+1;
        W2(wee,2)=(1/d2(i,1)^2);

        end
    end
end


%%% K = all samples
% w2_yes=sum(W2(:,1));
% w2_no=sum(W2(:,2));










