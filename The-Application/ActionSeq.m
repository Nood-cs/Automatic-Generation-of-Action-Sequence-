I1 = imread('wave2_1.bmp');
%I1 = rgb2hsv(I1);
IGray1 = rgb2gray(I1);
I2 = imread('wave2_2.bmp');
%I2 = rgb2hsv(I2);
IGray2 = rgb2gray(I2);

ndiff = IGray1 - IGray2; 
[height, width, dim] = size(ndiff);
%s = sum(ndiff); 
%H = get(ndiff,  'Height');
%W = get(ndiff, 'Width');

%dimn = height* width; 
%s = sum(dimn); 
%avg = s/dimn;

BW =  imextendedmax(ndiff, 50);

%BWDash = imcomplement(BW);  
figure, imshow(IGray1); 
figure, imshow(IGray2); 
figure, imshow(ndiff); 
figure, imshow(BW); 
