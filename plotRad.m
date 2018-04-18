
% Import data from .mat file
importdata("fig6_6.mat");
pathSize = size(outputs.pathRadiance);
waveLength = linspace(6e-6,25e-6, pathSize(2));

% Plot data, pre conversion
figure
plot(waveLength,outputs.pathRadiance)
title('Wavelength Radiance vs MolecularWavelength')
xlabel('Wavelength')
ylabel('Wavelength Radiance')
hold on
plot(waveLength,outputs.blackbody)

% Convert data
% Wavenumber is the inverse of wavelength eq 3.2
waveNumber = waveLength.^-1;

% Wavenumber is waveLength^2/10 * Wavelength Radiance
% Wavenumber is 1/(10*waveNum^2) * Wavelength Radiance
wavNumberRadiance = (outputs.pathRadiance.*(waveLength.^2))./10;

% Plot data, post conversion
figure
plot(waveNumber,wavNumberRadiance)
title('Wavenumber Radiance vs WaveNumber')
xlabel('Wavenumber')
ylabel('Wavenumber Radiance')
hold on
plot(waveNumber,outputs.blackbody)