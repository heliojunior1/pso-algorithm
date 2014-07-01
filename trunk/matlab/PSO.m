% Simulador de colônia de pássaros na solução de problemas.
% Baseado no artigo Partical Swarm Optimization de James Kennedy.
%
% Por Marcos Perez Mokarzel
 
%Limpa qualquer variável criada em outra simulação.
clear;
 
%define as constantes da colônia
NUM_BIRDS = 200;
NUM_INTERACTIONS = 200;
MAX_SIZE = 10;
MAX_ERRO = 0.1;

%Define a posição da comida.
roostPoint = randn(3)*5;

%Geração da matriz de pássaros, cada pássaro é um conjunto 3D de pontos.
%Inicialmente a posição é aleatória.
birds = randn(3,NUM_BIRDS)*3;
 
%Geração do vetor de movimento de cada pássaro. Inicialmente aleatório.
velocities = randn(3,NUM_BIRDS)*0.03;
 
%Armezena o melhor valor ao logo de cada iteração
gbestVal = zeros(NUM_INTERACTIONS);
 
%Executa o voo.
for i=1:NUM_INTERACTIONS
    
    %Calcula a nova velocidade dos pássaros pelo método
    %Nearest Neighbor Velocity Matching.
    velocities=VelocityMatching(birds, velocities);
    
    %Introduz a variável Craziness.
    velocities=Craziness(velocities);
    
    %Encontra o passáro que tem amenor distância para a comida
    [gbest, gbestVal(i)] = Roost(birds, roostPoint);
    
    %Recalcula a velocidade baseada no pássaro de maior sucesso.
    velocities = CornfieldVector(birds, velocities, gbest);

    %Recalcula a posição de cada pássaro.
    birds = birds+velocities;
 
    %Desenha os pássaros
    hold;
    clf;
    plot3(birds(1,:),birds(2,:),birds(3,:),'r+', birds(1,gbest),birds(2,gbest),birds(3,gbest),'go');
    axis([-MAX_SIZE MAX_SIZE -MAX_SIZE MAX_SIZE -MAX_SIZE MAX_SIZE]);
    
    %Desenha a posição da comida
    hold;
    plot3(roostPoint(1),roostPoint(2),roostPoint(3), 'bx');
    
    %Muda a posição da comida.
    if gbestVal(i) < MAX_ERRO
        roostPoint = randn(3)*5;
    end
 
    pause(0.01);
end

clf;
plot(gbestVal);
