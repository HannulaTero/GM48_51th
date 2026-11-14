

/**
* Set the target.
* 
* @param {Struct.Tensor} _target
*/ 
function GPU_SetTarget(_target)
{
  surface_set_target(_target.GetSurface());
}

