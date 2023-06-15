clear all
clc
a=0;b=15000; %Time
Mi=2^17; %Number of steps
h=(15000-a)/Mi; %Step size
M=(b-a)/h;  % Full number of steps
global sigma NO % Global variables
%% Power spectrum (Fast Fourier transformations)
for i=1:1:1000   
	sigma=0.004*(k-1); % Coupling (0<=sigma<=4)
	% Load the time series calculated before for each coupling value
	eval(['load EPL_sigma_',int2str(i),'.dat']);
	% We rename the data
	eval(['V = EPL_sigma_',int2str(i),';']);  
	clear EPL** % clear memory 
	
	t=V(:,1); %time
	x=V(:,2:end); % ODES solutions
	%
	x1=x(:,1); %x1
	y1=x(:,2); %y1
	x2=x(:,3); %x2
	y2=x(:,4); %y2
	x3=x(:,5); %x3       
	y3=x(:,6); %y3
	%
	%%  Forier transformations
	nstep=max(size(x1)); 
	tau=h; 
	% Response in frequency and power spectrum
	f(1:nstep) =2*pi*(0:(nstep-1))/(tau*nstep); 
	f(1:nstep) =(0:(nstep-1))/(tau*nstep); 

	x1fft = fft(x1); % Fourier transform of displacement
	spect_1 = abs(x1fft).^2; % Power spectrum of displacement
	x2fft = fft(x2); % Fourier transform of displacement
	spect_2= abs(x2fft).^2; % Power spectrum of displacement
	x3fft = fft(x3); % Fourier transform of displacement
	spect_3 = abs(x3fft).^2; % Power spectrum of displacement
	%
	y1fft = fft(y1); % Fourier transform of displacement
	spect_y1 = abs(y1fft).^2; % Power spectrum of displacement
	y2fft = fft(y2); % Fourier transform of displacement
	spect_y2= abs(y2fft).^2; % Power spectrum of displacement
	y3fft = fft(y3); % Fourier transform of displacement
	spect_y3 = abs(y3fft).^2; % Power spectrum of displacement
	%
	spect_1_a = spect_1(1:(nstep/2)); % Power spectrum of displacement
	f_1_a=f(1:(nstep/2)); % Fourier transform of displacement 
	spect_2_a = spect_2(1:(nstep/2)); % Power spectrum of displacement
	f_2_a=f(1:(nstep/2)); % Fourier transform of displacement 
	spect_3_a = spect_3(1:(nstep/2)); % Power spectrum of displacement
	f_3_a=f(1:(nstep/2)); % Fourier transform of displacement 
	%
	spect_1_y = spect_y1(1:(nstep/2)); % Power spectrum of displacement
	f_1_y=f(1:(nstep/2)); % Fourier transform of displacement 
	spect_2_y = spect_y2(1:(nstep/2)); % Power spectrum of displacement
	f_2_y=f(1:(nstep/2)); % Fourier transform of displacement 
	spect_3_y = spect_y3(1:(nstep/2)); % Power spectrum of displacement
	f_3_y=f(1:(nstep/2));
	
	% We save the solutions for each coupling value
	eval(['save FTSx_s_',int2str(i),'.dat SX -ascii']);	