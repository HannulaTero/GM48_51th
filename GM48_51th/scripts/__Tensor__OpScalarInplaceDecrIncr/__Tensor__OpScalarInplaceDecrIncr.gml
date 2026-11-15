

/**
* Reduces one to the tensor.
* 
* @context Tensor
*/ 
function __Tensor__OpScalarInplaceDecr()
{
  self.OpScalarInplaceAdd(-1.0);
}



/**
* Adds one to the tensor.
* 
* @context Tensor
*/ 
function __Tensor__OpScalarInplaceIncr()
{
  self.OpScalarInplaceAdd(1.0);
}
