	%	local maxima	
	function y = locmax(x)
	
	x = 2000*x./(max(x)-min(x));
	dy = x(2:max(size(x)))-x(1:max(size(x))-1);
	z = find(dy>0)+1;
	dz = z(2:max(size(z)))-z(1:max(size(z))-1);
	zz = find(dz>1);
	y = z(zz);	
		
	% sintax: z = locmax(u)