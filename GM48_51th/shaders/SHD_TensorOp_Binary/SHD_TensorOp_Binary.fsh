//=============================================================
#pragma shady: macro_begin BODY
//=============================================================
#pragma shady: inline(SHD_Utility.HEADER)
//=============================================================
// 
#region UNIFORMS ETC.


// The uniforms.
uniform sampler2D FSH_Lhs_Sampler;
uniform sampler2D FSH_Rhs_Sampler;

uniform vec4 FSH_Dst_Meta;
uniform vec4 FSH_Lhs_Meta;
uniform vec4 FSH_Rhs_Meta;

// Imports.
#pragma shady: import(SHD_Utility_Get)


// OPERATION - DEFINE FUNCTION WHERE INLINED.
float Operation(float lhs, float rhs);


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  vec2 dstPosition = floor(gl_FragCoord.xy);
  float dstIndex = Permute(FSH_Dst_Meta, dstPosition);
  
  float lhsSample = Get(
    FSH_Lhs_Sampler, 
    FSH_Lhs_Meta, 
    dstIndex
  );
  
  float rhsSample = Get(
    FSH_Rhs_Sampler, 
    FSH_Rhs_Meta, 
    dstIndex
  );
  
  float result = Operation(lhsSample, rhsSample);
  
  gl_FragData[0] = vec4(result);
}


#endregion
// 
//=============================================================
#pragma shady: macro_end
//=============================================================