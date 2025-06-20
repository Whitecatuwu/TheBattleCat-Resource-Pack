#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec3 Pos;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    Pos = Position;
    vertexDistance = cylindrical_distance(ModelViewMat, IViewRotMat * Position);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;

    if(Position.z == 0){
        gl_Position = ProjMat * ModelViewMat * vec4(Position.x - 0.4 ,Position.y - 0.4 ,Position.z, 1.0);
    }
    if(Position.z == 0.03){
        gl_Position = ProjMat * ModelViewMat * vec4(Position.x + 0.6 ,Position.y + 0.6 ,Position.z, 1.0);
    }
}
