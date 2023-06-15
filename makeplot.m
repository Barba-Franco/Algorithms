function [] = makeplot(db, out, evolve, loc)
% Plots 2D or 3D attractor evolution by evolution, 4th parameter is the
% location of legend
% Taehyeun Park, The Cooper Union, EE'15

datcnt = db.datcnt;
ndim = db.ndim;
tau = db.tau;
dataplot = [];
freerun = 0;

delay = 0:tau:(ndim-1)*tau;
data = db.data;

for ii = 1:(datcnt-(ndim-1)*tau)
dataplot = [dataplot; data(ii+delay)];
end

figure, bar(out(:,1),out(:,3)), hold on;
mle = max(dataplot(:)) - min(dataplot(:));
plot([0, out(end,1)], [mle, mle], 'r', 'LineWidth', 1.5), hold off;
set(gca,'YTick', [0, mle])
axis([0, out(end,1), 0, 1.1*mle])
title('d_f of evolutions scaled to the maximum linear extent of the 
attractor')

if ndim == 2
figure('Position', [100, 100, 800, 500]);
plot(dataplot(:,1), dataplot(:,2), '.', 'MarkerSize', 3), hold on;
display('To see the next evolution, press enter')
display('To clear the screen and then see the next evolution, ...
type c and press enter')
display('To proceed without stopping, type r and press enter')
display('To terminate plot generating, type g and press enter')

for ii = 1:size(out,1)
if freerun == 0
RESET = input('Next evolution?  ', 's');
if strcmp(RESET, 'c')
display('Screen cleared')
hold off;
clf;
plot(dataplot(:,1), dataplot(:,2), '.', 'MarkerSize', 3), hold on;
elseif strcmp(RESET, 'r')
display('Evolving without stopping...')
display('Press ctrl+c to terminate')
freerun = 1;
elseif strcmp(RESET, 'g')
display('Plot generating stopped')
return;
else
if ii > 1
delete(ann)
end
end
end

tmpold = out(ii,5);
oldpnt = tmpold + evolve;
tmpnew = out(ii,6);
newpnt = tmpnew + evolve;

plot(data(tmpold:oldpnt), data((tmpold+tau):(oldpnt+tau)), 'r', 
'LineWidth', 1);
plot(data(tmpnew:newpnt), data((tmpnew+tau):(newpnt+tau)), 'g', 
'LineWidth', 1);
for aa = 0:evolve;
plot([data(tmpold+aa), data(tmpnew+aa)], ...
[data(tmpold+aa+tau), data(tmpnew+aa+tau)], 'LineWidth', 1)
end

ann = legend(['Iteration: ', num2str(out(ii,1)), '/', 
num2str(out(end,1)), ...
char(10) 'd_i:', num2str(out(ii,2)), char(10)...
'd_f:', num2str(out(ii,3)), char(10)...
'Current Estimate:' num2str(out(ii,4))], ...
'location', loc);
if freerun == 1
drawnow
end
end

elseif ndim == 3    
figure('Position', [100, 100, 800, 500]);
plot3(dataplot(:,1), dataplot(:,2), dataplot(:,3), '.', 'MarkerSize', 3), 
hold on;
display('To see the next evolution, press enter')
display('To clear the screen and then see the next evolution, ...
type c and press enter')
display('To proceed without stopping, type r and press enter')
display('To terminate plot generating, type g and press enter')

for ii = 1:size(out,1)
if freerun == 0
RESET = input('Next evolution?  ', 's');
if strcmp(RESET, 'c')
display('Screen cleared')
hold off;
clf;
plot3(dataplot(:,1), dataplot(:,2), dataplot(:,3), '.', 'MarkerSize', 3), 
hold on;
elseif strcmp(RESET, 'r')
display('Evolving without stopping...')
display('Press ctrl+c to terminate')
freerun = 1;
elseif strcmp(RESET, 'g')
display('Plot generating stopped')
return;
else
if ii > 1
delete(ann)
end
end
end

tmpold = out(ii,5);
oldpnt = tmpold + evolve;
tmpnew = out(ii,6);
newpnt = tmpnew + evolve;

plot3(data(tmpold:oldpnt), data((tmpold+tau):(oldpnt+tau)), ...
data((tmpold+(2*tau)):(oldpnt+(2*tau))), 'r', 'LineWidth', 1);
plot3(data(tmpnew:newpnt), data((tmpnew+tau):(newpnt+tau)), ...
data((tmpnew+(2*tau)):(newpnt+(2*tau))), 'g', 'LineWidth', 1);
for aa = 0:evolve;
plot3([data(tmpold+aa), data(tmpnew+aa)], [data(tmpold+aa+tau),
data(tmpnew+aa+tau)], ...
[data(tmpold+aa+(2*tau)), data(tmpnew+aa+(2*tau))], 'LineWidth', 1)
end

ann = legend(['Iteration: ', num2str(out(ii,1)), '/', 
num2str(out(end,1)),...
char(10) 'd_i:', num2str(out(ii,2)), char(10)...
'd_f:', num2str(out(ii,3)), char(10)...
'Current Estimate:' num2str(out(ii,4))], ...
'location', loc);
if freerun == 1
drawnow
end
end
end	