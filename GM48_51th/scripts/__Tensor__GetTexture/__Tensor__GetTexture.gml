

/**
* Returns the GPU data as texture.
* 
* @context Tensor
* @returns {Pointer.Texture}
*/ 
function __Tensor__GetTexture()
{
  return surface_get_texture(self.GetSurface());
}