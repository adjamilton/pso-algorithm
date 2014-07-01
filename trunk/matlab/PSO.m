% Simulador de col�nia de p�ssaros na solu��o de problemas.
% Baseado no artigo Partical Swarm Optimization de James Kennedy.
%
% Por Marcos Perez Mokarzel
 
%Limpa qualquer vari�vel criada em outra simula��o.
clear;
 
%define as constantes da col�nia
NUM_BIRDS = 200;
NUM_INTERACTIONS = 200;
MAX_SIZE = 10;
MAX_ERRO = 0.1;

%Define a posi��o da comida.
roostPoint = randn(3)*5;

%Gera��o da matriz de p�ssaros, cada p�ssaro � um conjunto 3D de pontos.
%Inicialmente a posi��o � aleat�ria.
birds = randn(3,NUM_BIRDS)*3;
 
%Gera��o do vetor de movimento de cada p�ssaro. Inicialmente aleat�rio.
velocities = randn(3,NUM_BIRDS)*0.03;
 
%Armezena o melhor valor ao logo de cada itera��o
gbestVal = zeros(NUM_INTERACTIONS);
 
%Executa o voo.
for i=1:NUM_INTERACTIONS
    
    %Calcula a nova velocidade dos p�ssaros pelo m�todo
    %Nearest Neighbor Velocity Matching.
    velocities=VelocityMatching(birds, velocities);
    
    %Introduz a vari�vel Craziness.
    velocities=Craziness(velocities);
    
    %Encontra o pass�ro que tem amenor dist�ncia para a comida
    [gbest, gbestVal(i)] = Roost(birds, roostPoint);
    
    %Recalcula a velocidade baseada no p�ssaro de maior sucesso.
    velocities = CornfieldVector(birds, velocities, gbest);

    %Recalcula a posi��o de cada p�ssaro.
    birds = birds+velocities;
 
    %Desenha os p�ssaros
    hold;
    clf;
    plot3(birds(1,:),birds(2,:),birds(3,:),'r+', birds(1,gbest),birds(2,gbest),birds(3,gbest),'go');
    axis([-MAX_SIZE MAX_SIZE -MAX_SIZE MAX_SIZE -MAX_SIZE MAX_SIZE]);
    
    %Desenha a posi��o da comida
    hold;
    plot3(roostPoint(1),roostPoint(2),roostPoint(3), 'bx');
    
    %Muda a posi��o da comida.
    if gbestVal(i) < MAX_ERRO
        roostPoint = randn(3)*5;
    end
 
    pause(0.01);
end

clf;
plot(gbestVal);
