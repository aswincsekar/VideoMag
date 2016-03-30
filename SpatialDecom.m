%
%>>>>>>>>>>>>>>>>>>>>>SPATIAL DECOMPOSITION<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%
% INPUTS : Image , levels
% Output : Laplacian pyramid of the Image
%
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function [pyd] = SpatialDecom(img,levels)
    
pyd = cell(levels,2);

pyd{1,1} = img;

for i = 2:levels
    [pyd{i-1,2},pyd{i,1}] = laplaceDecomp(pyd{i-1,1},2);
end

end
