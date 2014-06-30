
% Input
%   imgP : The image for which we want to find motion vectors
%   imgI : The reference image
%   mbSize : Size of the macroblock
%   p : Search parameter  
%
% Ouput
%   motionVect : the motion vectors for each integral macroblock in imgP
%   ARPSZMPcomputations: The average number of points searched for a macroblock



function [motionVect,zeroCount,ARPSZMPcomputations] = BmotionEstARPSZMP(imgP, imgI, mbSize, p,threshold)

zeroCount=0;
[row col] = size(imgI);
disp(size(imgI));
vectors = zeros(2,row*col/mbSize^2);

costs = ones(1, 6) * 65537;


% The index points for Small Diamond search pattern
SDSP(1,:) = [ 0 -1];
SDSP(2,:) = [-1  0];
SDSP(3,:) = [ 0  0];
SDSP(4,:) = [ 1  0];
SDSP(5,:) = [ 0  1];

checkMatrix = zeros(2*p+1,2*p+1);

computations = 0;


checkvalue=0;

mbCount = 1;
for i = 1 : mbSize : row-mbSize+1
    for j = 1 : mbSize : col-mbSize+1
        
   
        
        x = j;
        y = i;
        
        checkvalue=costFuncSAD(imgP(i:i+mbSize-1,j:j+mbSize-1), ...
        imgI(i:i+mbSize-1,j:j+mbSize-1),mbSize);

        if(checkvalue<threshold)
          vectors(1,mbCount) = 0;    % row co-ordinate for the vector
          vectors(2,mbCount) = 0;    % col co-ordinate for the vector    
          mbCount = mbCount + 1;
          costs = ones(1,6) * 65537;
          checkMatrix = zeros(2*p+1,2*p+1);
        
        else

        costs(3) = costFuncMAD(imgP(i:i+mbSize-1,j:j+mbSize-1), ...
    imgI(i:i+mbSize-1,j:j+mbSize-1),mbSize);
%      
        checkMatrix(p+1,p+1) = 1;
        computations =  computations + 1; 

        if (j-1 < 1)
            stepSize = 2;
            maxIndex = 5;
        else 
            stepSize = max(abs(vectors(1,mbCount-1)), abs(vectors(2,mbCount-1)));

        
            if ( (abs(vectors(1,mbCount-1)) == stepSize && vectors(2,mbCount-1) == 0) ...
                 || (abs(vectors(2,mbCount-1)) == stepSize && vectors(1,mbCount-1) == 0)) ...
                 
                maxIndex = 5; % we just have to check at the rood pattern 5 points
                
            else
                maxIndex = 6; % we have to check 6 points
                LDSP(6,:) = [ vectors(2, mbCount-1)  vectors(1, mbCount-1)];
            end
        end
        
        % The index points for first and only Large Diamond search pattern
        
        LDSP(1,:) = [ 0 -stepSize];
        LDSP(2,:) = [-stepSize 0]; 
        LDSP(3,:) = [ 0  0];
        LDSP(4,:) = [stepSize  0];
        LDSP(5,:) = [ 0  stepSize];
        
        
        % do the LDSP
        
        
        for k = 1:maxIndex
            refBlkVer = y + LDSP(k,2);   % row/Vert co-ordinate for ref block
            refBlkHor = x + LDSP(k,1);   % col/Horizontal co-ordinate
            if ( refBlkVer < 1 || refBlkVer+mbSize-1 > row ...
                 || refBlkHor < 1 || refBlkHor+mbSize-1 > col)
             
                continue; % outside image boundary
            end

            if (k == 3 || stepSize == 0)
                continue; % center point already calculated
            end
            costs(k) = costFuncMAD(imgP(i:i+mbSize-1,j:j+mbSize-1), ...
                  imgI(refBlkVer:refBlkVer+mbSize-1, refBlkHor:refBlkHor+mbSize-1), mbSize);
            computations =  computations + 1;
            checkMatrix(LDSP(k,2) + p+1, LDSP(k,1) + p+1) = 1;
            
        end
        
        [cost, point] = min(costs);
        
        
        % The doneFlag is set to 1 when the minimum
        % is at the center of the diamond           

        x = x + LDSP(point, 1);
        y = y + LDSP(point, 2);
        costs = ones(1,5) * 65537;
        costs(3) = cost;
       

        doneFlag = 0;   
        while (doneFlag == 0)
            for k = 1:5
                refBlkVer = y + SDSP(k,2);   % row/Vert co-ordinate for ref block
                refBlkHor = x + SDSP(k,1);   % col/Horizontal co-ordinate
                if ( refBlkVer < 1 || refBlkVer+mbSize-1 > row ...
                      || refBlkHor < 1 || refBlkHor+mbSize-1 > col)
                      continue;
                end

                if (k == 3)
                    continue
                elseif (refBlkHor < j-p || refBlkHor > j+p || refBlkVer < i-p ...
                            || refBlkVer > i+p)
                        continue;
                elseif (checkMatrix(y-i+SDSP(k,2)+p+1 , x-j+SDSP(k,1)+p+1) == 1)
                    continue
                end
            
                costs(k) = costFuncMAD(imgP(i:i+mbSize-1,j:j+mbSize-1), ...
                             imgI(refBlkVer:refBlkVer+mbSize-1, ...
                                 refBlkHor:refBlkHor+mbSize-1), mbSize);
                checkMatrix(y-i+SDSP(k,2)+p+1, x-j+SDSP(k,1)+p+1) = 1;
                computations =  computations + 1;
                
  
            end
            
            [cost, point] = min(costs);
           
            if (point == 3)
                doneFlag = 1;
            else
                x = x + SDSP(point, 1);
                y = y + SDSP(point, 2);
                costs = ones(1,5) * 65537;
                costs(3) = cost;
            end
            
        end  % while loop ends here
        
        vectors(1,mbCount) = y - i;    % row co-ordinate for the vector
        vectors(2,mbCount) = x - j;    % col co-ordinate for the vector            
        mbCount = mbCount + 1;
        costs = ones(1,6) * 65537;
        
        checkMatrix = zeros(2*p+1,2*p+1);
        end
    end
end 
motionVect = vectors;
ARPSZMPcomputations = computations/(mbCount-1) ; 
sizeVect=size(motionVect);
for i=1:sizeVect(2)
    if motionVect(1,i)==0 & motionVect(2,i)==0
        zeroCount=zeroCount+1;
    end
end    
    
 