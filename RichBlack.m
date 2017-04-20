clearvars;
close all;

C = linspace(0,70,150);
M = linspace(0,60,150);
Y = linspace(0,50,150);
K = linspace(80,100,150);

C_size = size(C);

colour_chip_length = 243;
colour_chip_height = 230;

% Rich Black (70,60,50,100)
% Rich Black has to be less than 300%
for n = 1:C_size(2)
    rich_black(n,1) = C(n);
    rich_black(n,2) = M(n);
    rich_black(n,3) = Y(n);
    rich_black(n,4) = K(n);
end

grey = (0.01)*(grey);
rich_black = (0.01)*(rich_black);
cmyk_black = grey_chip(rich_black,colour_chip_length,colour_chip_height);
imwrite(cmyk_black,'RichBlack_Output.tiff');
cmyk_grey = grey_chip(grey,colour_chip_length,colour_chip_height);
imwrite(cmyk_grey,'Grey_Output.tif');

pathName = 'C:\Users\Niamh\Dropbox\College\Fifth Year\Project\Code\Grey\CMYK\RB';

% Write the colour chip values to a TIFF file
num = 1;
for C_num = 1 : C_size(2)
    cmyk_grey = grey_chip(rich_black(C_num,:),colour_chip_length,colour_chip_height);
    baseFileName = sprintf('ColourChip%d.tiff', num);
    fullFileName = fullfile(pathName, baseFileName);
    imwrite(cmyk_grey, fullFileName,'Resolution',300);
    num = num+1;
end 

strip_start = 1;
First_Strip = Strip(pathName,strip_start);
strip_start = 11;

for num = 2:15
    I = Strip(pathName,strip_start);
    First_Strip = cat(1,First_Strip,I);
    strip_start = strip_start + 10;
end

imwrite(First_Strip,'Page_ColoursCMYKrb.tiff','Resolution',300)


