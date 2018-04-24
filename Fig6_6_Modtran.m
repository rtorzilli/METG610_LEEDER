
% Import data from .mat file
load('21Apr2018FIG66');
pathSize = size(outputs.pathRadiance);
waveLength = linspace(6e-6,25e-6, pathSize(2));

% Import data from text file 
path = 'C:\Users\Robert\Documents\School\METG610\METG610_LEEDER\MODTRAND_OUT';
formatspec = '%f%f%f%f%f%f%f%f%f%f%f%f%f';
temp = readtable(path+"\FIG66_MOD",'Delimiter','  ',...
    'Format',formatspec);
% Delete first col (is nan)
temp.Var1=[];
% Remove NaN
modtran=temp(~any(ismissing(temp),2),:);

% Make more xaxis
pathSizeMT = size(modtran.Var11);
waveLengthMT = linspace(6e-6,25e-6, pathSizeMT(1));

% Convert data
% Wavenumber is the inverse of wavelength eq 3.2
waveNumber = (waveLength.^-1).*1e-2;
waveNumberMT = (waveLengthMT.^-1).*1e-2;

% Wavenumber is waveLength^2 * Wavelength Radiance * 1E15
wavNumberRadiance = (outputs.pathRadiance.*(waveLength.^2)).*10^15;
adjustedBB = bsxfun(@times,outputs.blackbody,(waveLength'.^2).*10^15);
modtranRad = modtran.Var11.*(waveLengthMT'.^2).*10^15;

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
A = plot(waveNumberMT,modtranRad);
xlabel('Wavenumber [cm-1]');
ylabel('Wavenumber Radiance [mW/m2*sr*cm-1]');
%hold on
%BB = plot(waveNumberMT,adjustedBB)
hold off
legend([A],["MODTRAN Wave Number"]);