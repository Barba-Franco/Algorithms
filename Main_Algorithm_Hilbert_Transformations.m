clear all
clc
for k=1:1:1001   
	sigma=0.004*(k-1); % Coupling (0<=sigma<=4)
	sigma_2(k)=sigma;
	% Load the time series calculated before for each coupling value
	eval(['load EPL_sigma_',int2str(k),'.dat']);
	% We rename the data
	eval(['V = EPL_sigma_',int2str(k),';']);  
	clear EPL** % clear memory 
  
	t=V(:,1); %time
	x=V(:,2:end);
	%
	x1=x(:,1); %x1
	y1=x(:,2); %y1
	x2=x(:,3); %x2
	y2=x(:,4); %y2
	x3=x(:,5); %x3       
	y3=x(:,6); %y3
	%
	% t=t(1:end);
	n = length(t);
	%% Complex analytical function (Hilbert transformations)
	
	xa1 = fhilb(x1); %x1
	xe1 = abs(xa1);  %x1
	xa2 = fhilb(x2); %x2
	xe2 = abs(xa2);  %x2
	xa3 = fhilb(x3); %x3
	xe3 = abs(xa3);  %x3
	ya1 = fhilb(y1); %y1
	ye1 = abs(ya1);  %y1
	ya2 = fhilb(y2); %y2
	ye2 = abs(ya2);  %y2
	ya3 = fhilb(y3); %y3
	ye3 = abs(ya3);  %y3
	% Envelope waves
	exe1=xe1(1:end)';
	exe2=xe2(1:end)';
	exe3=xe3(1:end)';
	eye1=ye1(1:end)';
	eye2=ye2(1:end)';
	eye3=ye3(1:end)';
	
	% x1(t)
	d_thetax1 = zeros(size(t));
	thetasx1 = angle(xa1); %angle solution (phase)
	thetax1 = unwrap(thetasx1); %reshape the phase
	d_thetax1(1) = (thetax1(2)-thetax1(1))/dt;
	d_thetax1(n) = (thetax1(n-1)-thetax1(n))/dt;
	% x2(t)
	d_thetax2 = zeros(size(t));
	thetasx2 = angle(xa2);
	thetax2 = unwrap(thetasx2);
	d_thetax2(1) = (thetax2(2)-thetax2(1))/dt;
	d_thetax2(n) = (thetax2(n-1)-thetax2(n))/dt;
	% x3(t)
	d_thetax3 = zeros(size(t));
	thetasx3 = angle(xa3);
	thetax3 = unwrap(thetasx3);
	d_thetax3(1) = (thetax3(2)-thetax3(1))/dt;
	d_thetax3(n) = (thetax3(n-1)-thetax3(n))/dt;
	% y1(t)
	d_thetay1 = zeros(size(t));
	thetasy1 = angle(ya1);
	thetay1 = unwrap(thetasy1);
	d_thetay1(1) = (thetay1(2)-thetay1(1))/dt;
	d_thetay1(n) = (thetay1(n-1)-thetay1(n))/dt;
	% y2(t)
	d_thetay2 = zeros(size(t));
	thetasy2 = angle(ya2);
	thetay2 = unwrap(thetasy2);
	d_thetay2(1) = (thetay2(2)-thetay2(1))/dt;
	d_thetay2(n) = (thetay2(n-1)-thetay2(n))/dt;
	% y3(t)
	d_thetay3 = zeros(size(t));
	thetasy3 = angle(ya3);
	thetay3 = unwrap(thetasy3);
	d_thetay3(1) = (thetay3(2)-thetay3(1))/dt;
	d_thetay3(n) = (thetay3(n-1)-thetay3(n))/dt;
	%
	for k = 2:n-1
	d_thetax1(k) = (thetax1(k+1)-thetax1(k-1))/(2*dt); %x1(t)
	d_thetax2(k) = (thetax2(k+1)-thetax2(k-1))/(2*dt); %x2(t)
	d_thetax3(k) = (thetax3(k+1)-thetax3(k-1))/(2*dt); %x3(t)
	d_thetay1(k) = (thetay1(k+1)-thetay1(k-1))/(2*dt); %y1(t)
	d_thetay2(k) = (thetay2(k+1)-thetay2(k-1))/(2*dt); %y2(t)
	d_thetay3(k) = (thetay3(k+1)-thetay3(k-1))/(2*dt); %y3(t)
	end
	%% Output variables
	fi_x1=(d_thetax1/2/pi);
	fi_x2=(d_thetax2/2/pi);
	fi_x3=(d_thetax3/2/pi);
	fi_y1=(d_thetay1/2/pi);
	fi_y2=(d_thetay2/2/pi);
	fi_y3=(d_thetay3/2/pi);
	% We save the data
	TH=[t fi_x1 fi_y1 fi_x2 fi_y2 fi_x3 fi_y3];
	eval(['save FI_TH_EPL_s_',num2str(k),'.dat TH -ascii']);