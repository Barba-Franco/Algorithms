clear all
clc	
a=0;b=15000; %Time
Mi=2^17; %Number of steps
h=(15000-a)/Mi; %Step size
M=(b-a)/h;  % Full number of steps
global sigma NO % Global variables
%
for NO=3:1:12 % Number of oscillators (Nodes) in the ring
	for i=1:1:1000 
	sigma=0.004*i;  % Coupling (0<=sigma<=4)
	sigma_2(i)=sigma;
	% Initial Conditions for Xj,Yj, taken aleatory from -10 to 10			
	Za=-10+(10+10)*rand(2*NO,1); % Range of IC (-10 -> +10) 
	% where NO is the size of the ring
	[T,Z]=rks4('RNN',a,b,Za,M);
	SX=[T' Z];  % Matriz of solutions [Time Xj Yj] for j=1,...NO
	% We save the solutions of the ODES for each coupling value
eval(['save Sx_',int2str(NO),'N_ICrd_s_',int2str(i),'.dat SX -ascii']);
	end
end