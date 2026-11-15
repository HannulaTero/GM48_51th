//=============================================================
#pragma import(Header)
//=============================================================
// 
#region UNIFORMS ETC.


// The uniforms.
uniform sampler2D FSH_PRNG_Sampler;
uniform vec4 FSH_PRNG_Meta;

uniform vec2 FSH_Offset;
uniform vec2 FSH_Range;


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  vec2 position = floor(gl_FragCoord.xy);
  
  float sample = Get(
    FSH_PRNG_Sampler, 
    FSH_PRNG_Meta, 
    FSH_Offset + position
  );
  
  float rerange = mix(FSH_Range[0], FSH_Range[1], sample);
  
  gl_FragData[0] = vec4(rerange);
}


#endregion
// 
//=============================================================