function foregroundMask = getforegrounds(baseImage, newImage, numObjects)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


thresholdbodyParts = SegementbodyParts(baseImage , newImage ); 

%thresholdfullBody = SegmentfullBody(baseImage , newImage );

numAreas = numObjects;

filteredMask1 = nLargestAreas(thresholdbodyParts, numAreas);
%filteredMask2 = nLargestAreas(thresholdfullBody, numAreas);

foregroundMask = filteredMask1;

end

%[regionLabels numAreas] = bwlabel(filteredMask,8);



