function x = CornfieldVector(birds, velocities, gbest,gbestVal)
 
    [a,b] = size(velocities);
    x = velocities;
     
    // Alternar entre valores: 0.01, 0.007, 0.005, 0.003, 0.001
    if(gbestVal<0.5)
        INCREMENT = 0.0001;
    else
        INCREMENT = 0.03;
    end    
    
    LIMIT = 0.07;
     
    for i=1:b
        if (birds(1,i)>birds(1,gbest)) & (x(1,i)>-LIMIT)
            x(1,i) = x(1,i) - (rand()*INCREMENT);    
        elseif (birds(1,i)<birds(1,gbest)) & (x(1,i)<LIMIT)
            x(1,i) = x(1,i) + (rand()*INCREMENT);    
        end
        
        if (birds(2,i)>birds(2,gbest)) & (x(2,i)>-LIMIT)
            x(2,i) = x(2,i) - (rand()*INCREMENT);    
        elseif (birds(2,i)<birds(2,gbest)) & (x(2,i)<LIMIT)     
            x(2,i) = x(2,i) + (rand()*INCREMENT);    
        end
        
        if (birds(3,i)>birds(3,gbest)) & (x(3,i)>-LIMIT)       
            x(3,i) = x(3,i) - (rand()*INCREMENT);    
        elseif (birds(3,i)<birds(3,gbest)) & (x(3,i)<LIMIT)    
            x(3,i) = x(3,i) + (rand()*INCREMENT);    
        end
    end
endfunction
