function cmyk_grey = grey_chip(grey,colour_chip_length,colour_chip_height)

white = ones(40,colour_chip_length,3);
imwrite(white,'TextBackground.TIF')

% Populate the CMYK_Output matrix with the colours from the colour matrix
for n = 1:colour_chip_height
    for m = 1:colour_chip_length
        for i = 1:4
            cmyk_grey(n,m,i) = grey(1,i);
        end
    end
end

Text_rgb = round(cmyk_grey,2);
Text_display1 = num2str(Text_rgb(1,1,1));
Text_display2 = num2str(Text_rgb(1,1,2));
Text_display3 = num2str(Text_rgb(1,1,3));
Text_display4 = num2str(Text_rgb(1,1,4));
space = ' ';
Text_display = horzcat('(',Text_display1,space,Text_display2,space,Text_display3,space,Text_display4,')');

I = imread('TextBackground.TIF');
Image = AddTextToImage(I,Text_display);
Image_cmyk = rgb2cmyk(Image);
Image_cmyk = mat2gray(Image_cmyk);
imwrite(Image_cmyk, 'CMYK_text.tiff');
Text_size = size(Image_cmyk);

for k = 1:Text_size(3)
    for n = 1:Text_size(1)
        for i = 1:Text_size(2)
            cmyk_grey(n,i,k) = Image_cmyk(n,i,k);
        end
    end
end

% imwrite(cmyk_grey,'Grey_Output.tif');