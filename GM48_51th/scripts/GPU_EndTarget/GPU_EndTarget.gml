

/**
* Turn off the target.
*/ 
function GPU_EndTarget()
{
  TENSOR_TARGET = undefined;
  surface_reset_target();
}