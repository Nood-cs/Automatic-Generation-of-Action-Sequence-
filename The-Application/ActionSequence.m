close all; clear
%% Input Images

%Case1: single object, 2D whole body motion, static background, fixed camera, uniform illumination.
%imageList_fullBody1 = {'in000604_1.jpg' 'in000654_1.jpg' 'in000674_1.jpg'};
%numObjects = 1;
%non-uniform illumination.
%imageList_fullBody2 = {'in000312_2.jpg' 'in000332_2.jpg'...
 %  'in000352_2.jpg' 'in000372_2.jpg' 'in000392_2.jpg' 'in000409_2.jpg'};
%numObjects = 2;

%Case2: single object, 2D body part motion, static background, fixed camera, uniform illumination.
imageList_bend = {'bend1.bmp' 'bend2.bmp' 'bend3.bmp'};
numObjects = 1; %How many foreground objects you're interested in keeping

%imageList_1 = {'wave1_1.bmp' 'wave1_2.bmp' 'wave1_3.bmp' 'wave1_4.bmp'};
%numObjects = 1;

%imageList_2 = {'wave2_1.bmp' 'wave2_2.bmp' 'wave2_3.bmp' 'wave2_4.bmp'};
%numObjects = 1;

%full_body dynamic background. 
%imageList_2 = {'in002338.jpg' 'in002366.jpg' 'in002389.jpg' 'in002429.jpg'};
%numObjects = 1;

%imageList_jump = {'jump1.bmp' 'jump2.bmp' 'jump3.bmp' 'jump4.bmp'};
%numObjects = 1;


backgroundObj = VideoReader('background.avi'); %access Video to get the background.

nframes = get(backgroundObj, 'NumberOfFrames'); %get number of frames.
background = read(backgroundObj, 1); %get the first frame. (background)

numImages = size(imageList_bend  ,2);

%background2 = imread('in000574_1.jpg'); %the background of the whole-body1
%background3 = imread('in000292_2.jpg' ); %the background of the whole-body2

%background4 = imread('in000001.jpg');

Images = cell(numImages,1);
for i = 1:numImages
    I = imread(cell2mat(imageList_bend(i)));
    [rows columns depth]=size(I);
    Images{i} = {imresize( I , [rows columns])};
end


%% Get Foregrounds

%segmentedImages = cell(numImages,1);

%numAreas = numObjects;

foregroundMasks = cell(numImages,1);

for i = 1:numImages
   
    baseImage = background;
    newImage = cell2mat(Images{i});
    foregroundMasks{i} = getforegrounds(baseImage, newImage, numObjects);
   
end

compinedForegrounds = compineImages(background, foregroundMasks, Images);

%% Show image and background
figure, imshow(background);
figure, imshow(compinedForegrounds);
