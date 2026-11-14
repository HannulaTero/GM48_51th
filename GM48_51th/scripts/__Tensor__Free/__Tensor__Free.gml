

/**
* Frees the GPU data.
* 
* @context Tensor
* @returns {Struct.Tensor}
*/ 
function __Tensor__Free()
{
  if (surface_exists(self.surface) == true)
  {
    surface_free(self.surface);
  }
  
  self.surface = undefined;
  return self;
}