%
%>>>>>>>>>>>>>>>>>>>SINGLE STAGE LAPLACIAN OPERATOR<<<<<<<<<<<<<<<<<<<<<<<<
%
% input --> gauss smoothening -> img_smooth
% laplacian = input - img_smooth
% subsampled_image = resize(img_smooth,0.5)
%
function [h,img_subsam] = laplaceDecomp(img,sigma)

    img_smooth = imgaussfilt(img,sigma);
    h = img - img_smooth;    
    img_subsam = imresize(img_smooth,0.5);
end