
% Import data from .mat file
load('Data\21Apr2018FIG66');
pathSize = size(outputs.pathRadiance);
waveLength = linspace(6e-6,25e-6, pathSize(2));

% Import data from text file 
modtranData = xlsread("MODTRAND_OUT\FIG661.xls",'User Data');

% Convert data
% Wavenumber is the inverse of wavelength eq 3.2
waveNumber = (waveLength.^-1).*1e-2;

% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumberRadiance = (outputs.pathRadiance.*(waveLength.^2)).*10^15;
adjustedBB = bsxfun(@times,outputs.blackbody,(waveLength'.^2).*10^15);
modtranRad = modtranData(:,8).*1e7;

% Plot data, LEEDR
figure
A = plot(waveNumber,wavNumberRadiance);
xlabel('Wavenumber [cm-1]');
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]');
hold on
BB = plot(waveNumber,adjustedBB);
hold off
legend([A],["LEEDR Wave Number"]);

% Plot data, MODTRAN
figure
A = plot(modtranData(:,1),modtranRad);
xlabel('Wavenumber [cm-1]');
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]');
hold off
legend([A],["MODTRAN Wave Number"]);