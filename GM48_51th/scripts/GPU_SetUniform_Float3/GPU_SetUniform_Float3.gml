

/**
* Set uniform.
* 
* @param {String} _label
* @param {Real}   _x
* @param {Real}   _y
* @param {Real}   _z
*/ 
function GPU_SetUniform_Float3(_label, _x, _y, _z)
{
  var _shader = shader_current();
  var _uniform = shader_get_uniform(_shader, _label);
  shader_set_uniform_f(_uniform, _x, _y, _z);
}