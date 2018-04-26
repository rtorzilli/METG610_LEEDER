fig98_1000 = xlsread("Data\fig98A.xls",'Outputs');
fig98_100 = xlsread("Data\fig98B.xls",'Outputs');

% Xaxis Frequency
wavelength_1000 = fig98_1000((352:741),1);
wavelength_100 = fig98_100((220:689),1);

% divide wavelength by light then invert it so nu=c/L
freq_1000 = ((wavelength_1000./3e8).^-1).*10^-9;
freq_100 = ((wavelength_100./3e8).^-1).*10^-9;

% Y axis Absorption Coeff (extinction)
extinction_1000 = (fig98_1000(352:741,5));
extinction_100 = (fig98_100(220:689,5));

figure
plot(wavelength_100,extinction_100);
xlabel('Wavelength (M)')
ylabel('Aborption Coefficient')
legend("DiOxide 100 mb pressure")

figure
plot(freq_100,extinction_100);
xlabel('Freq (GHz)')
ylabel('Aborption Coefficient')
legend("DiOxide 100 mb pressure")

figure
plot(wavelength_1000,extinction_1000);
xlabel('Wavelength (M)')
ylabel('Aborption Coefficient')
legend("DiOxide 1000 mb pressure")

figure
plot(freq_1000,extinction_1000);
xlabel('Freq (GHz)')
ylabel('Aborption Coefficient')
legend("DiOxide 1000 mb pressure")
