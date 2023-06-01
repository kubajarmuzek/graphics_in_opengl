#version 330

//Zmienne jednorodne
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;

//Atrybuty
in vec4 vertex; //wspolrzedne wierzcholka w przestrzeni modelu
in vec4 normal; //wektor normalny w przestrzeni modelu
in vec2 texCoord0;

//Zmienne interpolowane
out vec4 l;
out vec4 l2;
out vec4 n;
out vec4 v;
out vec2 iTexCoord0; 

void main(void) {
    vec4 lp = vec4(7, -15, -30, 1); //pozcyja �wiat�a, przestrze� �wiata
    vec4 lp2 = vec4(-5, 15, -10, 1); //pozcyja �wiat�a, przestrze� �wiata

    l = normalize(V * lp - V*M*vertex); //wektor do �wiat�a w przestrzeni oka
    l2 = normalize(V * lp2 - V*M*vertex); //wektor do �wiat�a w przestrzeni oka

    v = normalize(vec4(0, 0, 0, 1) - V * M * vertex); //wektor do obserwatora w przestrzeni oka
    n = normalize(V * M * normal); //wektor normalny w przestrzeni oka
    
    iTexCoord0 = texCoord0;
    
    gl_Position=P*V*M*vertex;
}




    