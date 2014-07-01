function x = Craziness(velocities)
 
    [a,b] = size(velocities);
    x = velocities;
 
    for i=1:b
        crazinessBird = rand();
        
        if crazinessBird < 0.02
            newVel = rand(3,1,"normal")*0.03;
            x(1,i) = newVel(1);
            x(2,i) = newVel(2);
            x(3,i) = newVel(3);
        end
    end
endfunction
