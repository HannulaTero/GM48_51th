//=============================================================
#pragma shady: skip_compilation
//=============================================================
// 
#region IMPORTS.


#pragma shady: import(SHD_Utility_IDiv)


#endregion
// 
//=============================================================


vec2 IModDiv(float lhs, float rhs)
{
  vec2 result;
  result.y = IDiv(lhs, rhs);
  result.x = lhs - result.y * rhs;
  return result;
}
