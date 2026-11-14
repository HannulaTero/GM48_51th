

/**
* Verifies that GPU data exists, recreates it if necessary.
* 
* @context Tensor
* @returns {Struct.Tensor}
*/ 
function __Tensor__Verify()
{
  // Check whether surface has expected dimensions.
  if (surface_exists(self.surface) == true)
  {
    if (self.surfaceLayout[0] != surface_get_width(self.surface))
    || (self.surfaceLayout[1] != surface_get_height(self.surface))
    {
      var _depthDisabled = surface_get_depth_disable();
      surface_depth_disable(false);
      surface_free(self.surface);
      surface_depth_disable(_depthDisabled);
    }
  }
  
  // Ensure the surface exists.
  if (surface_exists(self.surface) == false)
  {
    self.surface = surface_create(
      self.surfaceLayout[0], 
      self.surfaceLayout[1], 
      TENSOR_FORMAT
    );
  }
  
  return self;
}