function filteredMask = nLargestAreas(segmentedImg, numAreas)

 SE1 = strel('disk', 2); 
 dilated = imdilate(segmentedImg, SE1);

[labels numlabels] = bwlabel(dilated, 8); 
regionStats = regionprops(dilated,'Area');
sortedAreas = sortrows([(1:size(regionStats,1))' [(regionStats(:).Area)]'],2); 
imageMask = zeros(size(labels)); %Allocate memory
if numlabels > 0
    for i = 1:min([numAreas numlabels])
        imageMask(labels == sortedAreas(end-i+1,1)) = 1;
    end
end

%Undo the dilation that got connected closest regions
eroded = imerode(imageMask, SE1);

SE3 = strel('disk', 3); 
dilated2 = imdilate(eroded, SE3);
filled = imfill(dilated2, 'holes');
filteredMask = imerode(filled, SE3);
figure,imshow(filteredMask);

end