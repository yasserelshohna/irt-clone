  function y = fatrix2_maskit(mask, x)
%|function y = fatrix2_maskit(mask, x)
%|
%| Apply mask to x (replicating if needed via bsxfun).
%| If mask is empty, then y := x.
%|
%| Used as part of many "back" (adjoint) methods to comply with fatrix2 
%| requirement that "back" method apply the mask.

if nargin < 2, help(mfilename), error(mfilename), end

if isempty(mask)
	y = x;
elseif isequal(size(mask), size(x))
	y = mask .* x;
else
	siz = size(x);
	if ~isequal(size(mask), siz(1:ndims(mask)))
		fail 'size mismatch'
	end
	y = bsxfun(@times, mask, x);
end
