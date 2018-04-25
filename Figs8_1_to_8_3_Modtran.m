%{
All plots created here are from modtran to be compared with the plots 
made in prior code and figures
%}
% Import data from text file 
path = 'C:\Users\Robert\Documents\School\METG610\METG610_LEEDER\MODTRAND_OUT';
fig81Barrow = xlsread(path+"\PettyFIGS.xls",'fig81B');
fig81Nauru = xlsread(path+"\PettyFIGS.xls",'fig81N');
fig82A = xlsread(path+"\PettyFIGS.xls",'fig82A');
fig82B = xlsread(path+"\PettyFIGS.xls",'fig82B');
fig83A = xlsread(path+"\PettyFIGS.xls",'fig83A');
fig83B = xlsread(path+"\PettyFIGS.xls",'fig83B');
fig83C_Storm = xlsread(path+"\PettyFIGS.xls",'fig83C_Storm');
fig83C_NoStorm = xlsread(path+"\PettyFIGS.xls",'fig83C_NoStorm');
fig83D = xlsread(path+"\PettyFIGS.xls",'fig83D');
% Note that conversion constant 1e7 comes from W to mW (1e3) 
% and um to cm (1e4)

% Plot data, MODTRAN
figure
plot(fig81Barrow(:,1),fig81Barrow(:,8).*1e7);
hold on;
plot(fig81Nauru(:,1),fig81Nauru(:,8).*1e7);
hold off;
xlabel('Wavenumber [cm-1]');
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]');
legend("ModTran Barrow", "ModTran Nauru");

figure
plot(fig82A(:,1),fig82A(:,8).*1e7);
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("ModTran 20Km Looking Down")

figure
plot(fig82B(:,1),fig82B(:,8).*1e7);
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("ModTran Grnd Looking Up")

figure
plot(fig83A(:,1),fig83A(:,8).*1e7);
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("ModTran 20Km Looking Down")

figure
plot(fig83B(:,1),fig83B(:,8).*1e7);
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("ModTran Grnd Looking Up")

figure
plot(fig83C_Storm(:,1),fig83C_Storm(:,8).*1e7);
hold on
plot(fig83C_NoStorm(:,1),fig83C_NoStorm(:,8).*1e7);
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("ModTran Stormy Tropical W Pacific","ModTran Cloud Free Tropical W Pacific")

figure
plot(fig83D(:,1),fig83D(:,8).*1e7);
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("ModTran Southern Iraq")