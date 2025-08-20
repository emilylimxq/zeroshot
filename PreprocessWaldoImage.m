%% Author: Mengmi Zhang
%% Kreiman Lab
%% web: http://klab.tch.harvard.edu/
%% Date: April 5, 2018

clear all;
close all;
clc;


trialname = 'cropped_2_1.jpg';
img = imread(['sampleimg/cropped_2_1.jpg']);
img = imresize(img, [1028 1280]);

fun = @(block_struct) imwrite(block_struct.data,['choppedwaldo/img_id' trialname(8:end-4) '_' num2str(block_struct.location(1)) '_' num2str(block_struct.location(2)) '.jpg']);    
blockproc(img,[224 224],fun);

objfileID = fopen('croppedwaldo_img.txt','w');
  

chopdir = dir(['choppedwaldo/img_id' trialname(8:end-4) '_*.jpg']);
for j = 1: length(chopdir)
    fprintf(objfileID,'%s\n',['choppedwaldo/' chopdir(j).name]);
end

fclose(objfileID);

    
