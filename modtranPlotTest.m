%{
All plots created here are from modtran to be compared with the plots 
made in prior code and figures
%}
% Import data from text file 

test1 = xlsread("User Folder\barrowFreeze.xls",'barrowArc100');
test2 = xlsread("User Folder\nauruNeg.xls",'nauruTempneg50');
% Nauru 0.5° S, 193° W
% Barrow 71.3° N, 156.8° W
% Note that conversion constant 1e7 comes from W to mW (1e3) 
% and um to cm (1e4)

% Plot data, MODTRAN
figure
plot(test1(:,1),test1(:,8).*1e7);
hold on;
plot(test2(:,1),test2(:,8).*1e7);
hold off;
xlabel('Wavenumber [cm-1]');
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]');
legend("ModTran 1", "ModTran 2");