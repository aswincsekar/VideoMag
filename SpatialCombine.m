%
%>>>>>>>>>>>>>>>>>>>>>SPATIAL COMBINE<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%
% INPUTS : Laplacian pyramid
% Output : original image
%
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function [rePyd] = SpatialCombine(pyd)
[a b] = size(pyd);
rePyd = cell(a-1,1);

for i = a:-1:2
    tmpSize = size(pyd{i-1,2});
    rePyd{i-1,1} = imresize(pyd{i,1},tmpSize(1:2)) + pyd{i-1,2};
end

end
