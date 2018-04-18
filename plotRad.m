importdata("test.mat");
plot(inputs.molecularWavelengths,outputs.pathRadiance)
title('Wavelength Radiance vs MolecularWavelength')
xlabel('Wavelength')
ylabel('Wavelength Radiance')
hold on
plot(inputs.molecularWavelengths,outputs.blackbody)

