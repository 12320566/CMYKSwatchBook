clearvars;
close all;

L = linspace(0,100,150);
L_size = size(L);

colour_chip_length = 243;
colour_chip_height = 230;

%CMYK
for n = 1:L_size(2)
    grey(n,1) = 0;
    grey(n,2) = 0;
    grey(n,3) = 0;
    grey(n,4) = L(n);
end

grey = (0.01)*(grey);
cmyk_grey = grey_chip(grey,colour_chip_length,colour_chip_height);

pathName = 'C:\Users\Niamh\Dropbox\College\Fifth Year\Project\Code\Grey\CMYK';

Write the colour chip values to a TIFF file
num = 1;
for L_num = 1 : L_size(2)
    cmyk_grey = grey_chip(grey(L_num,:),colour_chip_length,colour_chip_height);
    baseFileName = sprintf('ColourChip%d.tiff', num);
    fullFileName = fullfile(pathName, baseFileName);
    imwrite(cmyk_grey, fullFileName,'Resolution',300);
    num = num+1;
end 

strip_start = 1;
First_Strip = GreyStrip(pathName,strip_start);
strip_start = 11;

for num = 2:15
    I = Strip(pathName,strip_start);
    First_Strip = cat(1,First_Strip,I);
    strip_start = strip_start + 10;
end

imwrite(First_Strip,'Page_ColoursCMYK.tiff','Resolution',300);


