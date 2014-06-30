function [bufferImageP,streamP,motionVect,psnrI,computationsI]=compensatedFrame(Im,bufferImage,mbSize,p,array,mynumber,threshold)

if(mynumber==1)
     [motionVect,computations ] = motionEstDS(Im,bufferImage,mbSize,p);
end

if (mynumber==2)
    [motionVect computations] = motionEstARPS(Im,bufferImage,mbSize,p);
end

if(mynumber==3)
    [motionVect computations] = motionEstARPSZMP(Im,bufferImage,mbSize,p,threshold);
end   
     
    imgComp = motionComp(bufferImage, motionVect, mbSize);
    psnrI = imgPSNR(Im, imgComp, 255); 
    computationsI = computations;
    
imageSubtract=double(imsubtract(uint8(Im),uint8(imgComp)));
streamP=forwardDCT(imageSubtract,array);
JQ2=inverseDCT(streamP,array);

%imageSubtract2=double(imageSubtract2);
%imageSubtract=imageSubtract-128;



%figure;imshow(uint8(JQ2))
%bufferImageP=JQ2+imageSubtract1;
%bufferImageP=uint8(bufferImageP);
bufferImageP=double(imadd(JQ2,imgComp));

