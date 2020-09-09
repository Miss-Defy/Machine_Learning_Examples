% EM algorithm for project
% Elizaveta Latash

A=load('Dataset1.txt');
[a1,a2]=size(A);


B=zeros(size(A));
for i=1:a1;
    for j=1:a2;
        if A(i,j)<5
            B(i,j)=A(i,j);
        else
            B(i,j)=10;
        end
    end
end


missing_rows=[];
noo=0;
for i=1:a1;
    for j=1:a2;
        if B(i,j)>5;
            noo=noo+1;
            missing_rows(noo,1)=i;
        end
    end
end


No_missing_rows=[];
No_missing_rows(:,:)=B(:,:);
No_missing_rows(missing_rows,:) = [] ;
C=[];
C=No_missing_rows;

Var=[];
for i=1:length(C);
    Var(i,1)=(sum((C(i,:)-mean(C(i,:))).^2))/a2;
end

x=C(:,:);

s=1;  % sigma

u1=[];   u2=[];


for k=1:3;
Ez1=[];  Ez2=[];
u1(1,1:length(x))=0;
u2(1,1:length(x))=0;

for i=1:length(x);
for j=1:a2;

Ez1(i,j)=(exp((-1/(2*(s^2)))*(x(i,j)-u1(k,i)).^2))/((exp((-1/(2*(s^2)))*(x(i,j)-u1(k,i)).^2))+(exp((-1/(2*(s^2)))*(x(i,j)-u2(k,i)).^2)));


Ez2(i,j)=1-Ez1(i,j);


end



u1(k+1,i)=sum(Ez1(i,:).*x(i,:))/sum(Ez1(i,:));


u2(k+1,1)=sum(Ez2(i,:).*x(i,:))/sum(Ez2(i,:));

end



end



