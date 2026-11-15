


/**
* Partial derivative for division
* 
* @context Tensor
* @param {Struct.Tensor} _lhs Other input
* @param {Struct.Tensor} _rhs Gradient
* @returns {Struct.Tensor}
*/ 
function __Tensor__DxDiv(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorDx_Div);
}
