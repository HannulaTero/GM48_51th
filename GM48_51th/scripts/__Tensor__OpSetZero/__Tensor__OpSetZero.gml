

/**
* Fills the tensor with given 0's.
* 
* @context Tensor
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSetZero()
{
  self.OpSetScalar(0.0);
}