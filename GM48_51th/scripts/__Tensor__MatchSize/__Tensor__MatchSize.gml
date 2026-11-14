

/**
* Returns whether tensors match the size.
* 
* @context Tensor
* @param {Struct.Tensor} _tensor
* @returns {Bool}
*/ 
function __Tensor__MatchSize(_tensor)
{
  return (self.itemCount == _tensor.itemCount);
}