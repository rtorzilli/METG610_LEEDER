dry = xlsread("Data\fig1213_Dry.xls",'Outputs'); % Use Dry
polar = xlsread("Data\fig1213_PolarNorth1.xls",'Outputs');
midLat = xlsread("Data\fig1213_Desert2.xls",'Outputs');
tropics = xlsread("Data\fig1213_Tropical1.xls",'Outputs');

% Xaxis Frequency
dry_wavelength = dry(:,1);
polar_wavelength = polar(:,1);
midLat_wavelength = midLat(:,1);
tropics_wavelength = tropics(:,1);

% divide wavelength by light then invert it so nu=c/L
dry_freq = ((dry_wavelength./3e8).^-1).*10^-9;
polar_freq = ((polar_wavelength./3e8).^-1).*10^-9;
midLat_freq = ((midLat_wavelength./3e8).^-1).*10^-9;
tropics_freq = ((tropics_wavelength./3e8).^-1).*10^-9;

% Y axis Transmittance
dry_tran = (dry(:,2));
polar_tran = (polar(:,2));
midLat_tran = (midLat(:,2));
tropics_tran = (tropics(:,2));

figure
plot(dry_freq,dry_tran);
hold on
plot(polar_freq,polar_tran);
hold on
plot(midLat_freq,midLat_tran);
hold on
plot(tropics_freq,tropics_tran);
xlabel('Freq (GHz)')
ylabel('Aborption Coefficient')
legend("Dry","Polar","Midlatitude","Tropical")
hold off