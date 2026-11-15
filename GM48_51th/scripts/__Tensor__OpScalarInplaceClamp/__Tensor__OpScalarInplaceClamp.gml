

/**
* Clamps tensor values between given values.
* 
* @context Tensor
* @param {Real} _lower
* @param {Real} _upper
*/ 
function __Tensor__OpScalarInplaceClamp(_lower=0.0, _upper=1.0)
{
  self.OpScalarInplaceMax(_lower);
  self.OpScalarInplaceMin(_upper);
}



