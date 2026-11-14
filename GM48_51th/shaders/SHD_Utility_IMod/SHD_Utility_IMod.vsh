//=============================================================
#pragma shady: skip_compilation
//=============================================================
// 
#region IMPORTS.


#pragma shady: import(SHD_Utility_IDiv)


#endregion
// 
//=============================================================


float IMod(float lhs, float rhs)
{
  return lhs - IDiv(lhs, rhs) * rhs;
}
