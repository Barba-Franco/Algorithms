	function xdbar =fhilb(x)
	%xdbar is the analituc signal for X
	% x must be row vector . dbar is olse row vctor
	n=length(x);
	X=fft(x);
	sft=[1 2*ones(1,n/2-1) 1 zeros(1,n/2-1) ];
	xdbar=ifft(sft.*X);