//=============================================================
// 
#region UNIFORMS ETC.


#pragma shady: inline(SHD_Utility.HEADER)


// The uniforms.
uniform vec2 FSH_Offset;
uniform vec4 FSH_PRNG_Meta;
uniform vec2 FSH_Range;

// Imports.
#pragma shady: import(SHD_Utility_Get)


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