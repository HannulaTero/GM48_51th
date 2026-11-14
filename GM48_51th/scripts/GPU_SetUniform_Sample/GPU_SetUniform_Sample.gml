

/**
* Set sampler.
* 
* @param {String}         _label
* @param {Struct.Tensor}  _tensor
*/ 
function GPU_SetUniform_Sample(_label, _tensor)
{
  var _shader = shader_current();
  var _sampler = shader_get_sampler_index(_shader, _label);
  texture_set_stage(_sampler, _tensor.GetTexture());
}