

/**
* Pulls data from array to the tensor.
* 
* @context Tensor
* @param {Array<Real>} _array
* @returns {Struct.Tensor}
*/ 
function __Tensor__ArrayPull(_array)
{
  self.Verify();
  
  var _bytes = self.surfaceCapacity * TENSOR_DSIZE;
  var _buffer = buffer_create(_bytes, buffer_fixed, 1);
  buffer_seek(_buffer, buffer_seek_start, 0);
  
  var _count = array_length(_array);
  for(var i = 0; i < _count; i++)
  {
    buffer_write(_buffer, TENSOR_DTYPE, _array[i]);
  }
  
  buffer_set_surface(_buffer, self.surface, 0);
  buffer_delete(_buffer);
  
  return self;
}