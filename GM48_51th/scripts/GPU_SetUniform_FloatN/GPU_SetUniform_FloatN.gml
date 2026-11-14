

/**
* Set uniforms.
* 
* @param {String}       _label
* @param {Array<Real>}  _array
*/ 
function GPU_SetUniform_FloatN(_label, _array)
{
  var _shader = shader_current();
  var _uniform = shader_get_uniform(_shader, _label);
  shader_set_uniform_f_array(_uniform, _array);
}