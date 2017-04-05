function linear_regression( a,b,c )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
input=importdata(a);
[m,n]=size(input);
deg=str2num(b);
lamb=str2num(c);
ph=zeros(m,deg+1);
identity=eye(deg+1);
target=zeros(m,1);
target(:,1)=input(:,2);
ph(:,1)=1;
for i=2:deg+1
    for j=1:m
        ph(j,i)=input(j,1).^(i-1);
    end
end
phtrans=transpose(ph);
lambidentity=lamb*identity;
first=lambidentity+(phtrans*ph);
second=inv(first)*phtrans;
weights=second*target;
fprintf('w0 = %.4f\n',weights(1,1));
fprintf('w1 = %.4f\n',weights(2,1));
if deg==1
    fprintf('w2 = %.4f\n',0);
end
if deg==2
    fprintf('w2 = %.4f\n',weights(3,1));
end
    
end

