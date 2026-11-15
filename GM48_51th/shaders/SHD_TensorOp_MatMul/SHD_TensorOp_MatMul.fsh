//=============================================================
#pragma import(Header)
//=============================================================
// 
#region UNIFORMS ETC.


// The uniforms.
uniform sampler2D FSH_Lhs_Sampler;
uniform sampler2D FSH_Rhs_Sampler;

uniform vec4 FSH_Dst_Meta;
uniform vec4 FSH_Lhs_Meta;
uniform vec4 FSH_Rhs_Meta;
uniform float FSH_IndexDivisor;
uniform float FSH_ReduceCount;


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  // Calculate the destination index.
  vec2 dstPosition = floor(gl_FragCoord.xy);
  float dstIndex = Permute(FSH_Dst_Meta, dstPosition);
  vec2 indexes = IModDiv(dstIndex, FSH_IndexDivisor);
  indexes *= FSH_ReduceCount;
  
  
  // Iterate through sum-reduceable area, calculating dot-product.
  float result = 0.0;
  for(float i = 0.0; i < 16777215.0; i++)
  {
    // For webgl1 sheningans.
    if (i >= FSH_ReduceCount)
    {
      break;
    }
    
    // Read the values, advance forward.
    float lhsSample = Get(FSH_Lhs_Sampler, FSH_Lhs_Meta, indexes.x++);
    float rhsSample = Get(FSH_Rhs_Sampler, FSH_Rhs_Meta, indexes.y++);
    
    // Update the results.
    result += (lhsSample * rhsSample);
  }
  
  
  // Store the result.
  gl_FragData[0] = vec4(result);
}


#endregion
// 
//=============================================================