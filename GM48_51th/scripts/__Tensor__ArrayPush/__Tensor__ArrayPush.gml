

/**
* Pushes data to array from the tensor.
* 
* @context Tensor
* @param {Array<Real>} _array
* @returns {Array<Real>}
*/ 
function __Tensor__ArrayPush(_array=array_create(self.itemCount))
{
  self.Verify();
  
  var _bytes = self.surfaceCapacity * TENSOR_DSIZE;
  var _buffer = buffer_create(_bytes, buffer_fixed, 1);
  buffer_get_surface(_buffer, self.surface, 0);
  buffer_seek(_buffer, buffer_seek_start, 0);
  
  var _count = array_length(_array);
  for(var i = 0; i < _count; i++)
  {
    _array[i] = buffer_read(_buffer, TENSOR_DTYPE);
  }
  
  buffer_delete(_buffer);
  
  return _array;
}