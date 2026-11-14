

/**
* Fills the tensor with given value.
* 
* @context Tensor
* @param {Real} _value
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSetScalar(_value=0.0)
{
  GPU_SetState();
  GPU_SetShader(SHD_TensorOp_SetScalar);
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
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSetOne()
{
  self.OpSetScalar(1.0);
}



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


