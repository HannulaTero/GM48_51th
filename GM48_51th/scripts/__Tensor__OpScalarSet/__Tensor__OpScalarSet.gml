

/**
* Fills the tensor with given value.
* 
* @context Tensor
* @param {Real} _value
*/ 
function __Tensor__OpScalarSet(_value=0.0)
{
  GPU_SetState();
  GPU_SetShader(SHD_TensorOp_ScalarSet);
  GPU_SetUniform_Float1("FSH_Value", _value);
  GPU_SetTarget(self);
  GPU_Dispatch_Full();
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



/**
* Fills the tensor with given 1's.
* 
* @context Tensor
*/ 
function __Tensor__OpScalarSetOne()
{
  self.OpSetScalar(1.0);
}



/**
* Fills the tensor with given 0's.
* 
* @context Tensor
*/ 
function __Tensor__OpScalarSetZero()
{
  self.OpSetScalar(0.0);
}


