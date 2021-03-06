
% Import data from .mat file
load('fig6_6')
pathSize = size(outputs.pathRadiance);
waveLength = linspace(6e-6,25e-6, pathSize(2));

% Plot data, pre conversion
figure
plot(waveLength,outputs.pathRadiance)
xlabel('Wavelength [m]')
ylabel('Wavelength Radiance [W/cm2*sr*um]')
hold on
plot(waveLength,outputs.blackbody)

% Convert data
% Wavenumber is the inverse of wavelength eq 3.2
waveNumber = (waveLength.^-1).*1e-2;

% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumberRadiance = (outputs.pathRadiance.*(waveLength.^2)).*10^15;
adjustedBB = bsxfun(@times,outputs.blackbody,(waveLength'.^2).*10^15);

% Plot data, post conversion
figure
plot(waveNumber,wavNumberRadiance)
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
hold on
plot(waveNumber,adjustedBB)