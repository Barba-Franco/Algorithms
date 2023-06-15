	function [T,Z]=rks4(F,a,b,Za,M)
	h=(b-a)/M;
	T=zeros(1,M+1);
	T=a:h:b; Z(1,:)=Za;
	for j=1:M
	k1=h*feval(F,T(j),Z(j,:));
	k2=h*feval(F,T(j)+h/2,Z(j,:)+k1/2);
	k3=h*feval(F,T(j)+h/2,Z(j,:)+k2/2);
	k4=h*feval(F,T(j)+h,Z(j,:)+k3);
	Z(j+1,:)=Z(j,:)+(k1+2*k2+2*k3+k4)/6;
	end