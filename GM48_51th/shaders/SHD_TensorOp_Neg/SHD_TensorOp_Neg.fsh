//=============================================================
// 
#region UNIFORMS ETC.


// Set the qualifiers.
precision highp float;


// The uniforms.
uniform vec4 FSH_Dst_Meta;
uniform vec4 FSH_Src_Meta;


#endregion
// 
//=============================================================
// 
#region DECLARE METHODS.


float IDiv(float lhs, float rhs);
float IMod(float lhs, float rhs);
vec2 Permute(vec4 meta, float idx);
float Permute(vec4 meta, vec2 pos);

float Get(sampler2D tex, vec4 meta, vec2 position);
float Get(sampler2D tex, vec4 meta, float idx)


#endregion
// 
//=============================================================
// 
#region MAIN FUNCTION.


void main()
{
  vec2 position = floor(gl_FragCoord.xy);
  
  float sample = Get(
    gm_BaseTexture, 
    FSH_PRNG_Meta, 
    position
  );
  
  float result = -sample;
  
  gl_FragData[0] = vec4(result);
}


#endregion
// 
//=============================================================
// 
#region DEFINE METHODS.


float IDiv(float lhs, float rhs)
{
  return floor((lhs + 0.5) / rhs);
}

float IMod(float lhs, float rhs)
{
  return lhs - IDiv(lhs, rhs) * rhs;
}

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

float Get(sampler2D tex, vec4 meta, vec2 position)
{
  return texture2D(tex, (position + 0.5) * meta.xy)[0];
}

float Get(sampler2D tex, vec4 meta, float idx)
{
  return Get(tex, meta, Permute(meta, idx));
}


#endregion
// 
//=============================================================