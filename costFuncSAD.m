% Computes Sum of Absolute Differece (SAD) for the given two blocks
% Input
%       currentBlk : The block for which we are finding the MAD
%       refBlk : the block w.r.t. which the MAD is being computed
%       n : the side of the two square blocks
%
% Output
%       cost : The SAD for the two blocks


function cost = costFuncSAD(currentBlk,refBlk, n)


err = 0;
for i = 1:n
    for j = 1:n
        err = err + abs((currentBlk(i,j) - refBlk(i,j)));
    end
end

disp(err);
cost=err;

