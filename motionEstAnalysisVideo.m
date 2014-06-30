function motionEstAnalysisVideo(FileName,threshold,NumberFrames) 



 mbSize = 16;
 p = 7;

readerobj = VideoReader(FileName, 'tag', 'myreader1');

    vidFrames = read(readerobj);
    noframe = get(readerobj, 'NumberOfFrames');
      for k = 1 : noframe
            mov(k).cdata = vidFrames(:,:,:,k);
            mov(k).colormap = [];
      end
    display(noframe);
       
 for  i = 1:NumberFrames
    
    imgI=frame2im(mov(i));
    imgP=frame2im(mov(i+1));
     
    imgI = double(imgI);
    imgP = double(imgP);
    imgI = imgI(:,1:352);
    imgP = imgP(:,1:352);
    
    % Diamond Search
    [motionVect, computations] = motionEstDS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    DSpsnr(i) = imgPSNR(imgP, imgComp, 255); 
    DScomputations(i) = computations;

     % Adaptive Rood Patern Search
    [motionVect, computations] = motionEstARPS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    ARPSpsnr(i) = imgPSNR(imgP, imgComp, 255); 
    ARPScomputations(i) = computations;
 
    % Adaptive Rood Patern Zero Motion Prediction Search
    [motionVect, computations] = motionEstARPSZMP(imgP,imgI,mbSize,p,threshold);
    imgComp = motionComp(imgI, motionVect, mbSize);
    ARPSZMPpsnr(i) = imgPSNR(imgP, imgComp, 255); 
    ARPSZMPcomputations(i) = computations;

 end



 save dsplots2 ARPSZMPpsnr ARPSZMPcomputations DSpsnr DScomputations ARPSpsnr ARPScomputations ...


     