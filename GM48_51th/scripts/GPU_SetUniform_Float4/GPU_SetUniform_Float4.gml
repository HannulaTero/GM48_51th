

/**
* Set uniform.
* 
* @param {String} _label
* @param {Real}   _x
* @param {Real}   _y
* @param {Real}   _z
* @param {Real}   _w
*/ 
function GPU_SetUniform_Float4(_label, _x, _y, _z, _w)
{
  var _shader = shader_current();
  var _uniform = shader_get_uniform(_shader, _label);
  shader_set_uniform_f(_uniform, _x, _y, _z, _w);
}