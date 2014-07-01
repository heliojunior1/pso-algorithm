function x = VelocityMatching(birds, velocities)
 
[a,b] = size(velocities);
Nears = Nearest(birds);
x = zeros(a,b);
for i=1:b
    x(1,i) = velocities(1,Nears(i));
    x(2,i) = velocities(2,Nears(i));
    x(3,i) = velocities(3,Nears(i));
end
