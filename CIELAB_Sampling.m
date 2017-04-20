clearvars;
close all;
clc

% Centre coordinates of the CIELAB colour space
x = 0;
y = 0;
% Radius on which the colours will be sampled
% Radius range is from 28 to 100 as that is where the colours are most
% distint
r = (28:7.2:100);
num_radii = size(r);
% There will be 15 different angle values for each radius
theta = (0:0.42:2*pi);
num_angles = size(theta);

% The lightness vector contains 10 different shades of lightness
L = 25:7.5:90;
% Call the function which returns the colour chip with text
num = 1;
for i = 1:num_radii(2)
    for j = 1:num_angles
        CMYK_ColourChip = Lab_coord(r(i),x,y,theta(j),L,num);
        num = num+10;
    end
end






