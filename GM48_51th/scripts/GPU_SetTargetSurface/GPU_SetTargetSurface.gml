

/**
* Set the target.
* 
* @param {Id.Surface} _target
*/ 
function GPU_SetTargetSurface(_target)
{
  static tensor = new Tensor(undefined, false);
  
  if (surface_exists(_target) == false)
  {
    throw("Surface doesn't exist!");
  }
  
  var _w = surface_get_width(_target);
  var _h = surface_get_height(_target);
  var _shape = [ _w, _h ];
  tensor.Reshape(_shape, _shape);
  TENSOR_TARGET = tensor;
  
  surface_set_target(_target);
}

