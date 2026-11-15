

/**
* Adds tensor with given scalar value
* 
* @context Tensor
* @param {Real} _value
*/ 
function __Tensor__OpScalarAdd(_value=0.0)
{
  GPU_SetState();
  GPU_BlendAdditive(true);
  GPU_SetShader(SHD_TensorOp_ScalarSet);
  GPU_SetUniform_Float1("FSH_Value", _value);
  GPU_SetTarget(self);
  GPU_Dispatch();
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



/**
* Adds one to the tensor.
* 
* @context Tensor
*/ 
function __Tensor__OpScalarIncr()
{
  self.OpScalarAdd(1.0);
}



/**
* Reduces one to the tensor.
* 
* @context Tensor
*/ 
function __Tensor__OpScalarDecr()
{
  self.OpScalarAdd(-1.0);
}


