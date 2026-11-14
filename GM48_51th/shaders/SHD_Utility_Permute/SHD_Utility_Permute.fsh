//=============================================================
#pragma shady: skip_compilation
//=============================================================
// 
#region IMPORTS.


#pragma shady: import(SHD_Utility_IModDiv)


#endregion
// 
//=============================================================


vec2 Permute(vec4 meta, float idx)
{
  return IModDiv(idx, meta.z);
}

float Permute(vec4 meta, vec2 pos)
{
  return (pos.x + pos.y * meta.z);
}
