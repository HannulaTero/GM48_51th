

/**
* Returns whether the GPU data exists.
* 
* @context Tensor
* @returns {Bool}
*/ 
function __Tensor__Exists()
{
  return surface_exists(self.surface);
}