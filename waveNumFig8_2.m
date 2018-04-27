
% Import data from .mat file
down = load('Data\22AprFIG82_A');
up = load('Data\22AprFIG82_B');
pathSize = size(up.outputs.pathRadiance);
waveLength = linspace(5.88e-6,25e-6, pathSize(2));

% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumberRadianceDown = (down.outputs.pathRadiance.*(waveLength.^2)).*10^15;

% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumberRadianceUp = (up.outputs.pathRadiance.*(waveLength.^2)).*10^15;

% Convert data
% Wavenumber is the inverse of wavelength eq 3.2
waveNumber = (waveLength.^-1).*1e-2;


adjustedBB = bsxfun(@times,up.outputs.blackbody,(waveLength'.^2).*10^15);

% Plot data, post conversion
figure
plotUp = plot(waveNumber,wavNumberRadianceUp)
hold on
ploBB = plot(waveNumber,adjustedBB)
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("Surface Looking Up", "200K", "210K", "220K", "230K", "240K",...
    "250K", "260K", "270K", "280K", "290K", "300K")


figure
plotDown = plot(waveNumber,wavNumberRadianceDown)
hold on
ploBB = plot(waveNumber,adjustedBB)
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("Surface Looking Down", "200K", "210K", "220K", "230K", "240K",...
    "250K", "260K", "270K", "280K", "290K", "300K")