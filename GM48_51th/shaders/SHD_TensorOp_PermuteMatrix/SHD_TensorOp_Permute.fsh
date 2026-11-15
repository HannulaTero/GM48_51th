//=============================================================
#pragma import(Header)
//=============================================================
// 
#region UNIFORMS ETC.


// The uniforms.
// The params store information in 2D, strides for dst and src.
uniform sampler2D FSH_Params_Sampler;
uniform vec4 FSH_Params_Meta;

uniform sampler2D FSH_Src_Sampler;
uniform vec4 FSH_Src_Meta;

uniform vec4 FSH_Dst_Meta;
uniform float FSH_Dst_Rank;


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
  float srcIndex = 0.0;
  float remainder = dstIndex;
  
  
  // Permute the index with tensor strides.
  for(float i = 0.0; i < 16384.0; i++)
  {
    // For webgl1 sheningans.
    if (i >= FSH_Dst_Rank)
    {
      break;
    }
    
    // Lookup the strides.
    float dstStride = Get(
      FSH_Params_Sampler, 
      FSH_Params_Meta, 
      vec2(0.0, i)
    );
    
    float srcStride = Get(
      FSH_Params_Sampler, 
      FSH_Params_Meta, 
      vec2(1.0, i)
    );
    
    
    // Update the index.
    vec2 moddiv = IModDiv(remainder, dstStride);
    remainder = moddiv.x;
    srcIndex += moddiv.y * srcStride;
  }
  
  
  // Snatch the source value.
  float sample = Get(
    FSH_Src_Sampler, 
    FSH_Src_Meta, 
    srcIndex
  );
  
  gl_FragData[0] = vec4(sample);
}


#endregion
// 
//=============================================================