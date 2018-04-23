% Import data from .mat file
sahara = load('FIG83_Sahara');
iceSheet = load('FIG83_SouthPole');
iraq = load('FIG83_Iraq');
storm = load('FIG83_Storm');
tropics = load('FIG83_Storm_NoCloud');

pathSize = size(iceSheet.outputs.pathRadiance);
waveLength = linspace(6.25e-6,25e-6, pathSize(2));

% Convert data
% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumRadSahara = (sahara.outputs.pathRadiance.*(waveLength.^2)).*10^15;
wavNumRadIceSheet = (iceSheet.outputs.pathRadiance.*(waveLength.^2)).*10^15;
wavNumRadIraq = (iraq.outputs.pathRadiance.*(waveLength.^2)).*10^15;
wavNumRadStorm = (storm.outputs.pathRadiance.*(waveLength.^2)).*10^15;
wavNumRadTropics = (tropics.outputs.pathRadiance.*(waveLength.^2)).*10^15;

% Wavenumber is the inverse of wavelength eq 3.2
waveNumber = (waveLength.^-1).*1e-2;

adjustedBB = bsxfun(@times,sahara.outputs.blackbody,(waveLength'.^2).*10^15);
% Plot data, post conversion
figure
plotUp = plot(waveNumber,wavNumRadSahara)
hold on
ploBB = plot(waveNumber,adjustedBB)
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("Sahara Desert", "200K", "210K", "220K", "230K", "240K",...
    "250K", "260K", "270K", "280K", "290K", "300K")

adjustedBB = bsxfun(@times,iceSheet.outputs.blackbody,(waveLength'.^2).*10^15);
figure
plotDown = plot(waveNumber,wavNumRadIceSheet)
hold on
ploBB = plot(waveNumber,adjustedBB)
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("Antarctic Ice Sheet", "200K", "210K", "220K", "230K", "240K",...
    "250K", "260K", "270K", "280K", "290K", "300K")

adjustedBB = bsxfun(@times,iraq.outputs.blackbody,(waveLength'.^2).*10^15);
figure
plotDown = plot(waveNumber,wavNumRadIraq)
hold on
ploBB = plot(waveNumber,adjustedBB)
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("Southern Iraq", "200K", "210K", "220K", "230K", "240K",...
    "250K", "260K", "270K", "280K", "290K", "300K")

adjustedBB = bsxfun(@times,storm.outputs.blackbody,(waveLength'.^2).*10^15);
figure
plot(waveNumber,wavNumRadStorm)
hold on
plot(waveNumber,wavNumRadTropics)
hold on
ploBB = plot(waveNumber,adjustedBB)
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend("Stormy Tropical Western Pacific","Cloud Free Tropical Western Pacific",...
    "200K", "210K", "220K", "230K", "240K",...
    "250K", "260K", "270K", "280K", "290K", "300K")