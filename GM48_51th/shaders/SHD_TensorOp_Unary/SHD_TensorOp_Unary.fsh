//=============================================================
#pragma shady: macro_begin BODY
//=============================================================
#pragma shady: inline(SHD_Utility.HEADER)
//=============================================================
// 
#region UNIFORMS ETC.


// The uniforms.
uniform vec4 FSH_Dst_Meta;
uniform vec4 FSH_Src_Meta;

// Imports.
#pragma shady: import(SHD_Utility_Get)


// OPERATION - DEFINE FUNCTION WHERE INLINED.
float Operation(float src);


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  vec2 dstPosition = floor(gl_FragCoord.xy);
  float dstIndex = Permute(FSH_Dst_Meta, dstPosition);
  
  float sample = Get(
    gm_BaseTexture, 
    FSH_Src_Meta, 
    dstIndex
  );
  
  float result = Operation(sample);
  
  gl_FragData[0] = vec4(result);
}


#endregion
// 
//=============================================================
#pragma shady: macro_end
//=============================================================