

/**
* Set uniform.
* 
* @param {String} _label
* @param {Real}   _x
* @param {Real}   _y
*/ 
function GPU_SetUniform_Float2(_label, _x, _y)
{
  var _shader = shader_current();
  var _uniform = shader_get_uniform(_shader, _label);
  shader_set_uniform_f(_uniform, _x, _y);
}