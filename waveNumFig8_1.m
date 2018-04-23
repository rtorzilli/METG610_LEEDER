
% Import data from .mat file
nauru = load('21Apr2018FIG81_Nauru');
% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumberRadianceNauru = (nauru.outputs.pathRadiance.*(waveLength.^2)).*10^15;

barrow = load('21Apr2018FIG81_Barrow');
% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumberRadianceBarrow = (barrow.outputs.pathRadiance.*(waveLength.^2)).*10^15;

pathSize = size(barrow.outputs.pathRadiance);
waveLength = linspace(6.25e-6,35e-6, pathSize(2));

% Convert data
% Wavenumber is the inverse of wavelength eq 3.2
waveNumber = (waveLength.^-1).*1e-2;


adjustedBB = bsxfun(@times,barrow.outputs.blackbody,(waveLength'.^2).*10^15);

% Plot data, post conversion
figure
plotB = plot(waveNumber,wavNumberRadianceBarrow)
hold on
plotN = plot(waveNumber,wavNumberRadianceNauru)
hold on
ploBB = plot(waveNumber,adjustedBB)
hold off
xlabel('Wavenumber [cm-1]')
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]')
legend([plotB plotN],["Barrow", "Nauru"])