

/**
* Set the target.
* 
* @param {Id.Surface} _target
*/ 
function GPU_SetTargetSurface(_target)
{
  if (surface_exists(_target) == false)
  {
    throw("Surface doesn't exist!");
  }
  
  surface_set_target(_target);
}

