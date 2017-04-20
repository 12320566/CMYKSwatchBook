function colour = Lab_coord(r,x,y,theta,L,num)

xunit = r * cos(theta) + x;
yunit = r * sin(theta) + y;

% Generate LAB samples for the given radius and theta value
L_size = size(L);
for i =1:L_size(2)
    Lab_coord(i,1) = L(i);
    Lab_coord(i,2) = xunit;
    Lab_coord(i,3) = yunit;
    Lab_coord(i,:) = colorspace('Lab->RGB',Lab_coord(i,:));
end

%Pixel Size of colour chips
colour_chip_length = 243;
colour_chip_height = 230;

%Pathname of location of saved colour chips
pathName = 'C:\Users\Niamh\Dropbox\College\Fifth Year\Project\Code\ColourChips';

% Make a colour chip for every LAB colour using colour_chip function
% Write the colour chip values to a TIFF file
for L_num = 1 : L_size(2)
    colour = colour_chip(Lab_coord(L_num,:),colour_chip_length,colour_chip_height);
    baseFileName = sprintf('ColourChip%d.tiff', num);
    fullFileName = fullfile(pathName, baseFileName);
    imwrite(colour, fullFileName,'Resolution',300);
    num = num+1;
end 


