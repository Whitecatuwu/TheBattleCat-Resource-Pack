#version 150

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec3 Pos;
out vec4 vertexColor;

void main() {
    Pos = Position;
    vertexColor = Color;
    if(Color.r >=40.0/255.0 && Color.r <= 80.0/255.0 && Color.g == 0.0/255.0 && Color.b >= 127.0/255.0 && Color.b <= 255.0/255.0 && Color.a < 0.4 && Color.a > 0.3 && Pos.z == 400){
        vertexColor = vec4(121.0/255.0, 103.0/255.0, 62.0/255.0, 0.9); 
    }
    if(Color.r == 16.0/255.0  && Color.g == 0.0/255.0 && Color.b == 16.0/255.0 && Color.a < 1.0 && Pos.z == 400){
        vertexColor = vec4(53.0/255.0, 41.0/255.0, 12.0/255.0, 0.9);
    }
    /*spyglass background*/
    /*if(Pos.z == -90 && Color == vec4(0,0,0,1.0)){ 
        discard;
    }*/
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);   
}
