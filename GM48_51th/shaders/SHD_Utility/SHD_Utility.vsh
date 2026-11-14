//=============================================================
#pragma shady: skip_compilation
//=============================================================


#pragma shady: macro_begin HEADER

// Set the qualifiers.
precision highp float;

#pragma shady: macro_end


//=============================================================


#pragma shady: macro_begin DEFAULT

// Simplified passthrough vertex shader
attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

void main()
{
  gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}

#pragma shady: macro_end


//=============================================================
