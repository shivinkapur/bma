function [JQ1 psnrB]  = bFrameCal(ImB,bufferImageIP,array,mbSize,p,motionVector);
[JQ1 psnrB] =compensatedFrameB(ImB,bufferImageIP,mbSize,p,array,motionVector);
psnrB=psnrB;

