close all
clear all
clc
global sigma NO % Global variables
for NO=3:1:12 % Number of oscillators (Nodes) in the ring
	for j=1:1:1000   % Coupling (0<=sigma<=4)
		sigma=0.004*j;
		sigma_2(j)=sigma;
		for no=1:1:NO % For rings form 3 to 12
			i=2*no;    % x's
			k=2*no+1;  % y's
			% load the data (LE)
eval(['load EL_',int2str(NO),'N_n_',int2str(no),'_s_',int2str(j),'.dat']); 
eval(['EL = EL_',int2str(NO),'N_n_',int2str(no),'_s_',int2str(j),';']);
			
			x = EL(:,1); % x's
			y = EL(:,2); % y's
	%% Last value of EL (We eliminated all NaN and +- Inf)
	% x(end)
			TFx = isnan(x);
			Nx = find(~TFx);
			xNx = x(Nx);
			TFix = isfinite(xNx);
			Nix = find(TFix);
			xNix = xNx(Nix);
			LEfix(j)=xNix(end);

			% y(end)
			TFy = isnan(y);
			Ny = find(~TFy);
			yNy = y(Ny);
			TFiy = isfinite(yNy);
			Niy = find(TFiy);
			yNiy = yNy(Niy);
			LEfiy(j)=yNiy(end);

		end
		
%% We save the data
eval (['lyap_x',int2str(no),'= LEfix;']); % x's
eval (['lyap_y',int2str(no),'= LEfiy;']); % y's
%
eval (['save ELend_',int2str(NO),'N_x_',num2str(no),'.dat LEfix -ascii']); 
eval (['save ELend_',int2str(NO),'N_y_',num2str(no),'.dat LEfiy -ascii']); 
	
	end
end	