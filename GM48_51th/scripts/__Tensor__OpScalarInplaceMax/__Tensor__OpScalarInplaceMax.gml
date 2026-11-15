

/**
* Selects maximum of tensor or scalar value
* 
* @context Tensor
* @param {Real} _value
*/ 
function __Tensor__OpScalarInplaceMax(_value=1.0)
{
  GPU_SetState();
  GPU_BlendMaximum(true);
  GPU_SetShader(SHD_TensorOp_ScalarSet);
  GPU_SetUniform_Float1("FSH_Value", _value);
  GPU_SetTarget(self);
  GPU_Dispatch();
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



