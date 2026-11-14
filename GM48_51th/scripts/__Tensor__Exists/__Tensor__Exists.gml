

/**
* Returns whether the GPU data exists.
* 
* @context {Struct.Tensor}
* @returns {Bool}
*/ 
function __Tensor__Exists()
{
  return surface_exists(self.surface);
}