

/**
* Pushes data to buffer from the tensor.
* 
* @context Tensor
* @param {Id.Buffer} _buffer
* @returns {Struct.Tensor}
*/ 
function __Tensor__BufferPush(_buffer)
{
  self.Verify();
  
  buffer_get_surface(_buffer, self.surface, 0);
  
  return self;
}