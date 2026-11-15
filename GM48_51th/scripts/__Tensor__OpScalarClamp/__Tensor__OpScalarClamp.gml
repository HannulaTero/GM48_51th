

/**
* Clamps tensor values between given values.
* 
* @context Tensor
* @param {Real} _lower
* @param {Real} _upper
*/ 
function __Tensor__OpScalarClamp(_lower=0.0, _upper=1.0)
{
  self.OpScalarMax(_lower);
  self.OpScalarMin(_upper);
}



