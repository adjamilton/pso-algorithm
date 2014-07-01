function [gbest, gbestVal] = Roost(birds, roostPoint)
 
[~,b] = size(birds);
 
gbestVal = inf;
gbest = 1;
 
for i=1:b                   %Para cada passaro do bando.
    %Calcula a dist�ncia euclidiana para a posi��o da comida.
    dist = sqrt((birds(1,i)-roostPoint(1))^2+(birds(2,i)-roostPoint(2))^2+(birds(3,i)-roostPoint(3))^2);
    if gbestVal>dist        %Se � menor que a j� existente
        gbest = i;          %Substitui.
        gbestVal = dist;
    end
end
