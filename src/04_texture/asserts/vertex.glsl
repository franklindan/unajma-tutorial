#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec2 test;

out vec2 test_out;

void main()
{
    test_out = test;
    gl_Position = vec4(vertex.x, vertex.y, vertex.z, 1.0);
}
    
