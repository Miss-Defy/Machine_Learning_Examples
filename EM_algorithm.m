% EM algorithm
% Elizaveta Latash


x=[];
x(1,1)=5.3405;
x(2,1)=12.0721;
x(3,1)=10.142;
x(4,1)=7.0145;

s=1;  % sigma
Ez1=[];  Ez2=[];
u1=[];   u2=[];


for j=1:2;

u1(1,1)=6;
u2(1,1)=9;




for i=1:size(x);

Ez1(i,j)=(exp((-1/(2*(s^2)))*(x(i,1)-u1(j,1)).^2))/((exp((-1/(2*(s^2)))*(x(i,1)-u1(j,1)).^2))+(exp((-1/(2*(s^2)))*(x(i,1)-u2(j,1)).^2)));


Ez2(i,j)=1-Ez1(i,j);

end





u1(j+1,1)=sum(Ez1(:,j).*x(:,1))/sum(Ez1(:,j));


u2(j+1,1)=sum(Ez2(:,j).*x(:,1))/sum(Ez2(:,j));



end



