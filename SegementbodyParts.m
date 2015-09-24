function segmentedImage = SegementbodyParts( refImage , newImage )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

I1 = refImage;
I2 = newImage; 

Img1 = rgb2gray(I1);
Img2 = rgb2gray(I2);

%Take absolute difference
ndiff = imabsdiff(Img1,Img2);
%figure, imshow(ndiff);

%Otsu's Thresholding
level = graythresh(ndiff);
IBW = im2bw(ndiff,level);

%Erode and re-dilate to get rid of small noisy regions
sqE = strel('disk', 1);  
BWE=imerode(IBW,sqE);

%SE2 = strel('disk',2);
%BW = imopen(IBW, SE2);

sqD = strel('disk',1);
BWD=imdilate(BWE,sqD);

BWfill = imfill(BWD,'holes'); 

segmentedImage = BWfill; 

end

