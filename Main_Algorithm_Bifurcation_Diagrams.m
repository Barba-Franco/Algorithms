close all, clear all, clc
%% Parameters
a=0;b=15000; %Time
Mi=2^18; 
h=(15000-a)/Mi; %Step length
M=(b-a)/h; %Number of steps
amin=1e-1; 
format short
for NO=3:1:12 
	for k=1:1:1000
	i=(1001-k);
	sigma=0.004*i;  
% We load the solutions for each case of study and rename the matrix
	eval(['load Sx_',int2str(NO),'N_ICrd_s_',int2str(i),'.dat']);
	eval(['V = Sx_',int2str(NO),'N_ICrd_s_',int2str(i),';']);
	clear Sx** % Clear memory
	m=i;
	%% The data is identified
	t=V(:,1);
	u=V(:,2:end);
	dt=h;		
	   for ij=1:1:NO
		axi=2*ij-1;
		ayi=2*ij;
		eval(['x',int2str(ij),'= u(:,',int2str(axi),');']);
		eval(['y',int2str(ij),'= u(:,',int2str(ayi),');']);
		eval(['vx',int2str(ij),'= u(:,',int2str(axi),');']);
		eval(['vy',int2str(ij),'= u(:,',int2str(ayi),');']);
	   end		
		%% The maxima are calculate	
    	% Must be file BD in the folder
		if NO==3
			BD3;		
		elseif NO==4
			BD4;
		elseif NO==5
			BD5;
		elseif NO==6
			BD6;
		elseif NO==7
			BD7;
		elseif NO==8
			BD8;
		elseif NO==9
			BD9;
		elseif NO==10
			BD10;
		elseif NO==11
			BD11;
		elseif NO==12
			BD12;
		end
		
	end	
% We save the data for bifurcation diagrams
for ij=1:1:NO
eval(['save BDx',int2str(ij),'_R',int2str(NO),'N.dat bifx',num2str(ij),
' -ascii']); 
% For x's
eval(['save BDy',int2str(ij),'_R',int2str(NO),'N.dat bify',num2str(ij),
' -ascii']);
% For y's
end
	
end