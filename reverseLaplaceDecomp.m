%
%>>>>>>>>>>>>>>>>>>>REVERSE-SINGLE STAGE LAPLACIAN OPERATOR<<<<<<<<<<<<<<<<
%
% input <- add laplacian to image <- img_smooth
% laplacian = input - img_smooth
% subsampled_image = resize(img_smooth,0.5)
%
function [img_upsam] = reverseLaplaceDecomp(img,h)  
    img_upsam = imresize(img,2)+h;
end