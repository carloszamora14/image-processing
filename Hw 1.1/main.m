A=[1,2,3;-1,0,2;4,5,6]
B=ones(3)
C=[1 3 0;-1 5 6; -2 4 3; 1 -1 6]

size(A)
A+B
%A+C
%A-C

[vmax, vmin] = maxminImage(A);

function [biggest] = max_value(a,b,c)
    if (a >= b && a >= c)
        biggest = a;
    elseif (b >= c)
        biggest = b;
    else
        biggest = c;
    end
end

m = max_value(45,-32, 46)

% Estructuras de control



if (size(A, 1) ~= size(B, 1))
    disp("Las matrices tienen longitudes de filas diferentes.")
elseif (size(A, 2) ~= size(B, 2))
    disp("Las matrices tienen longitudes de columnas diferentes.")
else
    disp("La suma de A + B es igual a:")
    A + B
end


% Ciclo for para obtener la suma de todos los elementos de la matriz
suma = 0;
for i = 1:1:size(A, 1)
    for j = 1:1:size(A, 2)
        suma = suma + A(i, j);
    end
end

disp("La suma de todos los elementos de la matriz A es " + suma)

% Ciclo while
a=153;
b=34;
while (a ~= 0 && b ~= 0)
    if (a > b)
        a = mod(a, b);
    else
        b = mod(b, a);
    end
end

gcd = max(a, b);
disp("El máximo común divisor de a y b es " + gcd)

% Break and continue
% Con el siguiente ciclo for haremos la suma de todos los números del 1 al
% 1000 sin contar los múltiplos de 50

suma = 0;
for idx = 1:100
    if (mod(idx, 5) == 0)
        continue
    end

    suma = suma + idx;
end

disp("El resultado de la suma es " + suma)

for i = 1:10
    % Si i es igual a 5, salimos del bucle
    if i == 5
        disp('Se alcanzó el valor 5, saliendo del bucle.')
        break;
    end
end

vec = [4, 9, 15, 7, 2, 8];
valorBuscado = 7;
idx = 1;
encontrado = false;

while idx <= length(vec) && ~encontrado
    if vec(idx) == valorBuscado
        encontrado = true;
    end

    idx = idx + 1
end

disp("¿Se encontró el valor buscado? " + encontrado)
