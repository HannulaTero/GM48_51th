//=============================================================
#pragma import(Header)
//=============================================================
// 
#region UNIFORMS ETC.


// The uniforms.
uniform sampler2D FSH_Src_Sampler;
uniform vec4 FSH_Src_Meta;

uniform vec4 FSH_Dst_Meta;

uniform float FSH_Src_Width;
uniform float FSH_Dst_Width;


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  // Calculate the destination index.
  vec2 dstSurfacePosition = floor(gl_FragCoord.xy);
  float dstIndex = Permute(FSH_Dst_Meta, dstSurfacePosition);
  
  
  // Calculate the source index.
  vec2 position = IModDiv(dstIndex, FSH_Dst_Width);
  float srcIndex = (position.y + position.x * FSH_Src_Width);
  
  
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