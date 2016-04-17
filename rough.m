clc;
clear;
close all;

mov=VideoReader('input_subsampled.avi');
vidFrames=double(read(mov));
nFrames=mov.NumberOfFrames;
frameRate = mov.FrameRate;
save('face_data.mat','vidFrames','nFrames','frameRate','-v7.3');
%%
clc;
close all;
NumElementsInFrame = numel(vidFrames(:,:,:,1));

ColumnizedFrames = reshape(vidFrames,NumElementsInFrame,nFrames);
size(ColumnizedFrames)

bpFilt = designfilt('bandpassfir','FilterOrder',40, ...
         'CutoffFrequency1',2,'CutoffFrequency2',2.33, ...
         'SampleRate',frameRate);
fvtool(bpFilt)
BandPassFiltered = zeros(size(ColumnizedFrames));

%% 
ColumnizedFrames = reshape(vidFrames,NumElementsInFrame,nFrames);

%%
for i = 1:NumElementsInFrame
%     i
    BandPassFiltered(i,:) = filter(bpFilt,ColumnizedFrames(i,:)')';
end

ColumnizedFrames = ColumnizedFrames + 2*BandPassFiltered;
FilteredFrames = reshape(ColumnizedFrames,size(vidFrames));
save('newFiltered.mat','FilteredFrames','-v7.3');
%%
v = VideoWriter('output');
v.FrameRate = frameRate;
open(v);
band = FilteredFrames - vidFrames;

m = max(band(:));
n = min(band(:));
dif = m - n;
s = size(band(:,:,:,1));
for i = 1:nFrames
    writeVideo(v,((band(:,:,:,i)-n)./dif));
end
close(v)

%% 
aviobj = VideoWriter('example.avi');
aviobj.FrameRate = frameRate;
open(aviobj);

for frame = 1:3
    aviobj = addframe(aviobj, FilteredFrames(:,:,:,frame)); %// This is assuming your image is a vector of RGB images. If it's a vector of indexed images then drop one : and make the loop go to size(M,3)
end

aviobj = close(aviobj);
