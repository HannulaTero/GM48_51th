//=============================================================
#pragma import(Header)
//=============================================================
// 
#region UNIFORMS ETC.


// The uniforms.
uniform float FSH_Value;


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  gl_FragData[0] = vec4(FSH_Value);
}


#endregion
// 
//=============================================================