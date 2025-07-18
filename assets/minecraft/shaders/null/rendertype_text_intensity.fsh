#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec3 Pos;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0).rrrr * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    if(vertexColor.g < 62.5/255.0 && !(vertexColor.r > 64.0/255.0) && !(vertexColor.r > 64.0/255.0) && Pos.z == 0){
        if(!(vertexColor.r == 0.0) || !(vertexColor.g == 0.0) || !(vertexColor.b == 0.0)){
            discard;
        }
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
