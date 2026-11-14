//=============================================================
#pragma shady: skip_compilation
//=============================================================
// 
#region IMPORTS.


#pragma shady: import(SHD_Utility_IDiv)


#endregion
// 
//=============================================================


vec2 Permute(vec4 meta, float idx)
{
  vec2 pos;
  pos.y = IDiv(idx, meta.z);
  pos.x = idx - pos.y * meta.z;
  return pos;
}

float Permute(vec4 meta, vec2 pos)
{
  return (pos.x + pos.y * meta.z);
}
