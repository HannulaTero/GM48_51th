

/**
* Returns whether tensors match the shape.
* 
* @context Tensor
* @param {Struct.Tensor} _tensor
* @returns {Bool}
*/ 
function __Tensor__MatchShape(_tensor)
{
  if (self.rank != _tensor.rank)
  {
    return false;
  }
  
  return array_all(_tensor.shape, function(_dim, _index)
  {
    return (self.shape[_index] == _dim);
  });
}