//=============================================================
// 
#region UNIFORMS ETC.


// Set the qualifiers.
precision highp float;


// The uniforms.
uniform float FSH_Value;


#endregion
// 
//=============================================================
// 
#region DECLARE METHODS.


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
// 
#region DEFINE METHODS.



#endregion
// 
//=============================================================