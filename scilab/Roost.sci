function [gbest, gbestVal] = Roost(birds, roostPoint)
 
    [a,b] = size(birds);
 
    gbestVal = 1000000;
    gbest = 1;
 
    for i=1:b                   //Para cada passaro do bando.
        //Calcula a distância euclidiana para a posição da comida.
        dist = sqrt((birds(1,i)-roostPoint(1))^2+(birds(2,i)-roostPoint(2))^2+(birds(3,i)-roostPoint(3))^2);
        if gbestVal>dist        //Se é menor que a já existente
            gbest = i;          //Substitui.
            gbestVal = dist;
        end
    end
endfunction
