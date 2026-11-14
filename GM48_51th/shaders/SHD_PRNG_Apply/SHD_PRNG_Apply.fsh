//=============================================================
// 
#region UNIFORMS ETC.


// Set the qualifiers.
precision highp float;


// The uniforms.
uniform vec2 FSH_Offset;
uniform vec4 FSH_PRNG_Meta;
uniform vec2 FSH_Range;


#endregion
// 
//=============================================================
// 
#region DECLARE METHODS.


float Get(sampler2D tex, vec4 meta, vec2 position);


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  vec2 position = floor(gl_FragCoord.xy);
  
  float sample = Get(
    gm_BaseTexture, 
    FSH_PRNG_Meta, 
    FSH_Offset + position
  );
  
  float rerange = mix(FSH_Range[0], FSH_Range[1], sample);
  
  gl_FragData[0] = vec4(rerange);
}


#endregion
// 
//=============================================================
// 
#region DEFINE METHODS.


float Get(sampler2D tex, vec4 meta, vec2 position)
{
  return texture2D(tex, (position + 0.5) * meta.xy)[0];
}


#endregion
// 
//=============================================================