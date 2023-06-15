clear all; close all; clc;
format long;
a=0;b=15000; %Time
Mi=2^17; %Number of steps
h=(15000-a)/Mi; %Step size
M=(b-a)/h;  % Full number of steps
global sigma NO % Global variables
for NO=3:1:12 % Number of oscillators (Nodes) in the ring
	for j=1:1:1000   % Coupling (0<=sigma<=4)
		sigma=0.004*j;
		sigma_2(j)=sigma;
		for no=1:1:NO % For rings form 3 to 12
			i=2*no;    % x's
			k=2*no+1;  % y's
	% load the data (time series)
	eval(['load Sx_',int2str(NO),'N_ICrd_s_',int2str(j),'.dat']);
	eval(['v = Sx_',int2str(NO),'N_ICrd_s_',int2str(j),';']);
	clear Sx**
	% Idetifies the time series
	if ((locmax(v(end-2^15:end,:)))>0)
	siz=2^16;
	else
	siz=2^18;
	end
	eval (['x = v(end-siz+1:end,',int2str(i),');']); % x's
	eval (['y = v(end-siz+1:end,',int2str(k),');']); % y's
	% Save the time series in .lor format 
	save xa1.lor x -ascii % x's
	save ya1.lor y -ascii % y's
	
	%% Solves for x and y
	% x's
	fnamex  = 'xa1.lor';  % for x's
	% y's
	fnamey  = 'ya1.lor';  % for y's
	% Inicialization
	datcnt= length(x) 
	tau = 5;
	ndim = 2;
	ires = 11;
	maxbox = 6000;
	% Funcion Lyap
	% x's
	dbx  = basgen(fnamex,  tau, ndim, ires, datcnt, maxbox); %x's
	% y's
	dby  = basgen(fnamey,  tau, ndim, ires, datcnt, maxbox); %y's
	
	% System parameters
	dt = h;
	evolve = 20;
	dismin = 0.001;
	dismax = 0.3;
	thmax = 30;
	% 
	% x's
	[ELx,  SUMx]  = fet(dbx,  dt, evolve, dismin, dismax, thmax); 
	% y's
	[ELy,  SUMy]  = fet(dby,  dt, evolve, dismin, dismax, thmax); 
	
	% Outputs
	lyap_x = ELx(:,4); % x's
	lyap_y = ELy(:,4); % y's
	
	% We save the LE for each oscillator and coupling value
	EL=[lyap_x lyap_y]; 
eval(['save EL_',int2str(NO),'N_n_',int2str(no),'_s_',int2str(j),'.dat 
EL -ascii']); 
	
		end
	end
end