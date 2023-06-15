function db = basgen(fname, tau, ndim, ires, datcnt, maxbox)
% Database generator for fet.m function
% Taehyeun Park, The Cooper Union, EE'15
	
x = fileread(fname);
data = zeros(1,datcnt);
trck = 1;
start = 1;
fin = 0;
	
for ii = 1:length(x)
if strcmp(x(ii), char(32)) || strcmp(x(ii), char(13)) || strcmp(x(ii), ...
char(10)) || strcmp(x(ii), char(26))
if fin >= start
data(trck) = str2num(x(start:fin));
trck = trck + 1;
if trck > 8*floor(datcnt/8)
break
end
end
start = ii + 1;
else
fin = ii;
end
end
	
delay = 0:tau:(ndim-1)*tau;
	
nxtbox = zeros(maxbox, ndim);
where = zeros(maxbox, ndim);
datptr = zeros(1,maxbox);
nxtdat = zeros(1,datcnt);
	
datmin = min(data);
datmax = max(data);
	
datmin = datmin - 0.01*(datmax - datmin);
datmax = datmax + 0.01*(datmax - datmin);
boxlen = (datmax - datmin)/ires;
	
boxcnt = 1;
	
for ii = 1:(datcnt-(ndim-1)*tau)
target = floor((data(ii+delay)-datmin)/boxlen);
runner = 1;
chaser = 0;
	
jj = 1;
while jj <= ndim
tmp = where(runner,jj)-target(jj);
if tmp < 0
chaser = runner;
runner = nxtbox(runner,jj);
if runner ~= 0
continue
end
end
if tmp ~= 0
boxcnt = boxcnt + 1;

if boxcnt == maxbox
error('Grid overflow, increase number of box count')
end

for kk = 1:ndim
where(boxcnt,kk) = where(chaser,kk);
end
where(boxcnt,jj) = target(jj);
nxtbox(chaser,jj) = boxcnt;
nxtbox(boxcnt,jj) = runner;
runner = boxcnt;
end
jj = jj + 1;
end
nxtdat(ii) = datptr(runner);
datptr(runner) = ii;
end

used = 0;
for ii = 1:boxcnt
if datptr(ii) ~= 0;
used = used + 1;
end
end
display(['Created: ', num2str(boxcnt)]);
display(['Used: ', num2str(used)]);

db.ndim = ndim;
db.ires = ires;
db.tau = tau;
db.datcnt = datcnt;
db.boxcnt = boxcnt;
db.datmax = datmax;
db.datmin = datmin;
db.boxlen = boxlen;

db.datptr = datptr(1:boxcnt);
db.nxtbox = nxtbox(1:boxcnt, 1:ndim);
db.where = where(1:boxcnt, 1:ndim);
db.nxtdat = nxtdat(1:datcnt);
db.data = data;