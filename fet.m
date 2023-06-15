function [out, SUM] = fet(db, dt, evolve, dismin, dismax, thmax)	
% Computes Lyapunov exponent of given data and parameters 
% Generates output
% textfile, exact replica of Fortran 77 version of fet
% Taehyeun Park, The Cooper Union, EE'15
	
out = [];
	
ndim = db.ndim;
ires = db.ires;
tau = db.tau;
datcnt = db.datcnt;
datmin = db.datmin;
boxlen = db.boxlen;
	
datptr = db.datptr;
nxtbox = db.nxtbox;
where = db.where;
nxtdat = db.nxtdat;
data = db.data;
	
delay = 0:tau:(ndim-1)*tau;
datuse = datcnt-(ndim-1)*tau-evolve;

its = 0;
SUM = 0;
savmax = dismax;

oldpnt = 1;
newpnt = 1;
	
fileID = fopen('fetout.txt', 'w');
	
goto50 = 1;
while goto50 == 1;
goto50 = 0;
[bstpnt, bstdis, thbest] = search(0, ndim, ires, datmin, boxlen, nxtbox, 
where, ...
datptr, nxtdat, data, delay, oldpnt, newpnt, datuse, dismin, dismax,...
thmax, evolve);
	
while bstpnt == 0
dismax = dismax * 2;
[bstpnt, bstdis, thbest] = search(0, ndim, ires, datmin, boxlen, nxtbox, 
where, ...
datptr, nxtdat, data, delay, oldpnt, newpnt, datuse, dismin, dismax,...
thmax, evolve);
end
	
dismax = savmax;
newpnt = bstpnt;
disold = bstdis;
iang = -1;

goto60 = 1;
while goto60 == 1;
goto60 = 0;
	
oldpnt = oldpnt + evolve;
newpnt = newpnt + evolve;

if oldpnt >= datuse
return
end
	
if newpnt >= datuse
oldpnt = oldpnt - evolve;
goto50 = 1;
break
end

p1 = data(oldpnt + delay);
p2 = data(newpnt + delay);
disnew = sqrt(sum((p2 - p1).^2));

its = its + 1;
	
SUM = SUM + log(disnew/disold);
zlyap = SUM/(its*evolve*dt*log(2));
out = [out; its*evolve, disold, disnew, zlyap, (oldpnt-evolve), 
(newpnt-evolve)];
	
if iang == -1
fprintf(fileID,'%-d\t\t\t%-8.4f\t\t%-8.4f\t\t%-8.4f\n',out(end,1:4)');
else
fprintf(fileID,'%-d\t\t\t%-8.4f\t\t%-8.4f\t\t
%-8.4f\t\t%-d\n',[out(end,1:4),iang]');
end
	
if disnew <= dismax
disold = disnew;
iang = -1;
goto60 = 1;
continue
end
	
[bstpnt, bstdis, thbest] = search(1, ndim, ires, datmin, boxlen, nxtbox, 
where, ...
datptr, nxtdat, data, delay, oldpnt, newpnt, datuse, dismin, dismax,...
thmax, evolve);
	
if bstpnt ~= 0
newpnt = bstpnt;
disold = bstdis;
iang = floor(thbest);
goto60 = 1;
continue
else
goto50 = 1;
break;
end
end
end
fclose(fileID);