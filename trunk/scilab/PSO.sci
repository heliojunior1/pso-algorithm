// Simulador de colônia de pássaros na solução de problemas.
// Baseado no artigo Partical Swarm Optimization de James Kennedy.
//
// Por Marcos Perez Mokarzel
// Adaptado por Edielson Prevato Frigieri
function PSO() 
    
    //Limpa qualquer variável criada em outra simulação.
    clear;
     
    //define as constantes da colônia
    NUM_BIRDS = 200;
    NUM_INTERACTIONS = 200;
    MAX_SIZE = 10;
    MAX_ERRO = 0.1;
    
    //Define a posição da comida.
    roostPoint = rand(3,1,"normal")*5;

    //Geração da matriz de pássaros, cada pássaro é um conjunto 3D de pontos.
    //Inicialmente a posição é aleatória.
    birds = rand(3,NUM_BIRDS,"normal")*3;
     
    //Geração do vetor de movimento de cada pássaro. Inicialmente aleatório.
    velocities = rand(3,NUM_BIRDS,"normal")*0.03;
     
    //Armezena o melhor valor ao logo de cada iteração
    gbestVal = zeros(1,NUM_INTERACTIONS);
     
    //Executa o voo.
    for i=1:NUM_INTERACTIONS
    
        //Calcula a nova velocidade dos pássaros pelo método
        //Nearest Neighbor Velocity Matching.
        velocities=VelocityMatching(birds, velocities);
        
        //Introduz a variável Craziness.
        velocities=Craziness(velocities);

        //Acha o pássaro que está mais próximo da comida e sua distância.
        [gbest gbestVal(i)] = Roost(birds, roostPoint);
        
        //Recalcula a velocidade baseada no pássaro de maior sucesso.
        velocities = CornfieldVector(birds, velocities, gbest,gbestVal(i));

        //Recalcula a posição de cada pássaro.
        birds = birds+velocities;
     
        //Desenha os pássaros
        //set(gca(),"auto_clear","off");
        clf;
        colors = [-14,-2,-9];
        param3d1(birds(1,:)', birds(2,:)', list(birds(3,:)', colors(1)));
        param3d1(birds(1,gbest),birds(2,gbest),list(birds(3,gbest),colors(3)));
        a=get("current_axes");//get the handle of the newly created axes
        a.data_bounds=[-MAX_SIZE MAX_SIZE -MAX_SIZE MAX_SIZE -MAX_SIZE MAX_SIZE];
        
        //Desenha a comida
        param3d1(roostPoint(1)',roostPoint(2)',list(roostPoint(3)', colors(2)));
        
        //Show algorithm interaction
        disp("Interaction:"+string(i));
        disp("gBestVal="+string(gbestVal(i)))
        //Muda a posição da comida.
        if gbestVal(i) < MAX_ERRO
            roostPoint = rand(3,1,"normal")*5;
        end
    end
    //plot the gBestVal
    figure;
    plot(gbestVal);
endfunction
