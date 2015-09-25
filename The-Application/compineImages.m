function output = compineImages(background, foregroundMasks, Images)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%Take a background image and a cell array of foregroundMasks and combine
%all foregrounds onto the background image

output = background;
output1 = background;
for i = 1:length(Images)
    newImage = cell2mat(Images{i}) ;
    newMask = foregroundMasks{i} ;
    
    %Compile with new foreground
    output1(:,:,1) = newImage(:,:,1).*uint8(newMask) ;
    output1(:,:,2) = newImage(:,:,2).*uint8(newMask) ;
    output1(:,:,3) = newImage(:,:,3).*uint8(newMask) ;
    
    figure, imshow(output1);
   
    output(:,:,1) = newImage(:,:,1).*uint8(newMask) + output(:,:,1).*uint8(~newMask);
    output(:,:,2) = newImage(:,:,2).*uint8(newMask) + output(:,:,2).*uint8(~newMask);
    output(:,:,3) = newImage(:,:,3).*uint8(newMask) + output(:,:,3).*uint8(~newMask);
end


end

