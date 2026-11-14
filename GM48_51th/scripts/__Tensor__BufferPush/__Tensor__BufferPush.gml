

/**
* Pushes data to buffer from the tensor.
* If buffer is not provided, it is created (remember to destroy when not used).
* 
* @context Tensor
* @param {Id.Buffer} _buffer
* @returns {Id.Buffer}
*/ 
function __Tensor__BufferPush(_buffer=undefined)
{
  self.Verify();
  
  var _bufferCreated = false;
  if (_buffer == undefined)
  {
    _bufferCreated = true;
    _buffer = buffer_create(1, buffer_grow, 1);
  }
  
  buffer_get_surface(_buffer, self.surface, 0);
  
  if (_bufferCreated == true)
  {
    buffer_resize(_buffer, self.itemCount * TENSOR_DSIZE);
  }
  
  return _buffer;
}