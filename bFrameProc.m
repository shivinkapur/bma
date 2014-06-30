function [B ,motionVect, flag,computationsB,psnrB] = bFrameProc(B,I,P,array,mbSize,p,mynumber,threshold)


if(mynumber==1)
%flag=0;
        %calculating MV  and Zero Matrixes  from I
        [motionVect1, zeroMatrixCount1,computations1]=BmotionEstDS(B,I,mbSize,p);
              
        %calculating MV  and Zero Matrixes  from P
        [motionVect2, zeroMatrixCount2,computations2]=BmotionEstDS(B,P,mbSize,p);
        
end      

if(mynumber==2)
%flag=0;
        %calculating MV  and Zero Matrixes  from I
        [motionVect1, zeroMatrixCount1,computations1]=BmotionEstARPS(B,I,mbSize,p);
              
        %calculating MV  and Zero Matrixes  from P
        [motionVect2, zeroMatrixCount2,computations2]=BmotionEstARPS(B,P,mbSize,p);
        
end      

if(mynumber==3)
%flag=0;
        %calculating MV  and Zero Matrixes  from I
        [motionVect1, zeroMatrixCount1,computations1]=BmotionEstARPSZMP(B,I,mbSize,p,threshold);
              
        %calculating MV  and Zero Matrixes  from P
        [motionVect2, zeroMatrixCount2,computations2]=BmotionEstARPSZMP(B,P,mbSize,p,threshold);
        
end      

        %chosing btw B2's
        if zeroMatrixCount1 <= zeroMatrixCount2
            flag=0;
            [B psnrB1]=bFrameCal(B,I,array,mbSize,p,motionVect1);
            motionVect=motionVect1;
            computationsB=computations1;
            psnrB=psnrB1;
        else
            flag=1;
            [B psnrB2]=bFrameCal(B,P,array,mbSize,p,motionVect2);
            motionVect=motionVect2;
            computationsB=computations2;
            psnrB=psnrB2;
        end