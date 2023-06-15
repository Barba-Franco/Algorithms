function [bstpnt, bstdis, thbest] = search(iflag, ndim, ires, datmin,...
boxlen, nxtbox, where, datptr, nxtdat, data, delay, oldpnt, newpnt,...
datuse, dismin, dismax, thmax, evolve)
% Searches for the most viable point for fet.m
% Taehyeun Park, The Cooper Union, EE'15

target = zeros(1,ndim);
oldcrd = zeros(1,ndim);
zewcrd = zeros(1,ndim);

oldcrd(1:ndim) = data(oldpnt+delay);
zewcrd(1:ndim) = data(newpnt+delay);
igcrds = floor((oldcrd - datmin)./boxlen);
oldist = sqrt(sum((oldcrd - zewcrd).^2));

irange = round(dismin/boxlen);
if irange == 0;
irange = 1;
end

thbest = thmax;
bstdis = dismax;
bstpnt = 0;

goto30 = 1;
while goto30 == 1
goto30 = 0;
for icnt = 0:((2*irange+1)^ndim)-1
goto140 = 0;
icounter = icnt;
for ii = 1:ndim;
ipower = (2*irange+1)^(ndim-ii);
ioff = floor(icounter./ipower);
icounter = icounter - ioff*ipower;
target(ii) = igcrds(ii) - irange + ioff;

if target(ii) < 0
goto140 = 1;
break;
end
if target(ii) > ires-1
goto140 = 1;
break
end
end

if goto140 == 1;
continue
end

if irange ~= 1
iskip = 1;
for ii = 1:ndim
if abs(round(target(ii) - igcrds(ii))) == irange
iskip = 0;
end
end
if iskip == 1
continue
end
end

runner = 1;
for ii = 1:ndim
goto80 = 0;
goto70 = 1;
while goto70 == 1;
goto70 = 0;
if where(runner,ii) == target(ii)
goto80 = 1;
break
end
runner = nxtbox(runner, ii);
if runner ~= 0
goto70 = 1;
end
end

if goto80 == 1
continue
end
goto140 = 1;
break
end

if goto140 == 1
continue
end

if runner == 0
continue
end
runner = datptr(runner);
if runner == 0
continue
end
goto90 = 1;
while goto90 == 1
goto90 = 0;
while 1;
if abs(round(runner - oldpnt)) < evolve
break
end
if abs(round(runner - datuse)) < (2*evolve)
break
end

bstcrd = data(runner + delay);

abc1 = oldcrd(1:ndim) - bstcrd(1:ndim);
abc2 = oldcrd(1:ndim) - zewcrd(1:ndim);
tdist = sum(abc1.*abc1);
tdist = sqrt(tdist);
dot = sum(abc1.*abc2);

if tdist < dismin
break
end
if tdist >= bstdis
break
end
if tdist == 0
break
end
goto120 = 0;
if iflag == 0
goto120 = 1;
end
if goto120 == 0
ctheta = min(abs(dot/(tdist*oldist)),1);
theta = 57.3*acos(ctheta);
if theta >= thbest
break
end
thbest = theta;
end
bstdis = tdist;
bstpnt = runner;
break;
end
runner = nxtdat(runner);

if runner ~= 0
goto90 = 1;
end
end
end
irange = irange + 1;
if irange <= (0.5 + round((dismax/boxlen)))
goto30 = 1;
continue;
end
return
end	