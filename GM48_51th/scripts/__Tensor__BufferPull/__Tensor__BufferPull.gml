

/**
* Pulls data from buffer to the tensor.
* 
* @context Tensor
* @param {Id.Buffer} _buffer
* @returns {Struct.Tensor}
*/ 
function __Tensor__BufferPull(_buffer)
{
  self.Verify();
  
  buffer_set_surface(_buffer, self.surface, 0);
  
  return self;
}