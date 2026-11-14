

/**
* Fills the tensor with given 1's.
* 
* @context Tensor
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSetOne()
{
  self.OpSetScalar(1.0);
}