function cmyk_values = colour_chip(Lab_coord,colour_chip_length,colour_chip_height)

white = ones(40,colour_chip_length,3);

for n = 1:colour_chip_height
    for m = 1:colour_chip_length
        for i = 1:3
            rgb_values(n,m,i) = Lab_coord(1,i);
        end
    end
end

Text_rgb = round(rgb2cmyk(rgb_values),2);
Text_display1 = num2str(Text_rgb(1,1,1));
Text_display2 = num2str(Text_rgb(1,1,2));
Text_display3 = num2str(Text_rgb(1,1,3));
Text_display4 = num2str(Text_rgb(1,1,4));
space = ' ';
Text_display = horzcat('(',Text_display1,space,Text_display2,space,Text_display3,space,Text_display4,')');
%Add text to rgb image
imwrite(white,'TextBackground.TIF')
imwrite(rgb_values,'RGB_values.tif')

Y = imread('TextBackground.TIF');
I = imread('RGB_values.TIF');
[m, n, ~] = size(Y);
I(1:m, 1:n, :) = Y;

Image = AddTextToImage(I,Text_display);

%Convert the rgb image to cmyk 
cmyk_values = rgb2cmyk(Image);



