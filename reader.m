%
% loading videos

mov=VideoReader('videos/face.mp4');
vidFrames=read(mov);
nFrames=mov.NumberOfFrames;
%%
VideoPyd = cell(nFrames,1);
for i=1:nFrames
   VideoPyd{i,1} = SpatialDecom(vidFrames(:,:,:,i),4);
end