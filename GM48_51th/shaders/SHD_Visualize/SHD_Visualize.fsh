//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
  float sample = texture2D( gm_BaseTexture, v_vTexcoord ).r;
  
  vec4 color = vec4(0.0, 0.0, 0.5, 1.0);
  
  color.r = max(0.0, -sample);
  color.g = max(0.0, sample);
  
  gl_FragColor = color;
}
