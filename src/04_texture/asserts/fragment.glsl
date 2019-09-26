#version 330 core

in vec2 test_out;

out vec4 FragmentColor;

uniform sampler2D ourTexture;

void main()
{
       FragmentColor = texture(ourTexture, test_out);
}
