

/**
* Selects minimum of tensor or scalar value
* 
* @context Tensor
* @param {Real} _value
*/ 
function __Tensor__OpScalarInplaceMin(_value=1.0)
{
  GPU_SetState();
  GPU_BlendMinimum(true);
  GPU_SetShader(SHD_TensorOp_ScalarSet);
  GPU_SetUniform_Float1("FSH_Value", _value);
  GPU_SetTarget(self);
  GPU_Dispatch();
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



