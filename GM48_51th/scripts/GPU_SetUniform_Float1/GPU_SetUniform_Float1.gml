

/**
* Set uniform.
* 
* @param {String} _label
* @param {Real}   _x
*/ 
function GPU_SetUniform_Float1(_label, _x)
{
  var _shader = shader_current();
  var _uniform = shader_get_uniform(_shader, _label);
  shader_set_uniform_f(_uniform, _x);
}