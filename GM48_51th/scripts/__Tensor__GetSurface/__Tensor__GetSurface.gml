

/**
* Returns the GPU data.
* 
* @context {Struct.Tensor}
* @returns {Id.Surface}
*/ 
function __Tensor__GetSurface()
{
  return self.Verify().surface;
}