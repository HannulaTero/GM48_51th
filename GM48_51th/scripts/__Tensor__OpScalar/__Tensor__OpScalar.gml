

/**
* Does operation with tensor and scalar value.
* 
* @context Tensor
* @param {Struct.Tensor}  _src
* @param {Real}           _value
* @param {Asset.GMShader} _shader
*/ 
function __Tensor__OpScalar(_src, _value, _shader)
{
  GPU_SetState();
  GPU_SetShader(_shader);
  GPU_SetUniform_Sample("FSH_Src_Sampler",  _src);
  GPU_SetUniform_FloatN("FSH_Src_Meta",     _src.meta);
  GPU_SetUniform_Float1("FSH_Value",        _value);
  GPU_SetTarget(self);
  GPU_Dispatch();
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



/**
* Adds value to tensor.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarAdd(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarAdd);
}



/**
* Clamps tensor between values.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _lower
* @param {Real} _upper
*/ 
function __Tensor__OpScalarClamp(_src, _lower=0.0, _upper=1.0)
{
  self.OpScalarMin(_src, _upper);
  self.OpScalarInplaceMax(_lower);
}



/**
* Decrements tensor by one.
* 
* @context Tensor
* @param {Struct.Tensor} _src
*/ 
function __Tensor__OpScalarDecr(_src)
{
  self.OpScalarAdd(_src, -1.0);
}



/**
* Divides tensor with value.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarDiv(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarDiv);
}



/**
* Checks (tensor == value).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarEq(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarEq);
}



/**
* Checks (tensor > value).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarGt(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarGt);
}



/**
* Checks (tensor >= value).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarGtEq(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarGtEq);
}



/**
* Increments tensor by one.
* 
* @context Tensor
* @param {Struct.Tensor} _src
*/ 
function __Tensor__OpScalarIncr(_src)
{
  self.OpScalarAdd(_src, +1.0);
}



/**
* Checks (tensor < value).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarLt(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarLt);
}



/**
* Checks (tensor <= value).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarLtEq(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarLtEq);
}



/**
* Takes maximum of tensor and value.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarMax(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarMax);
}



/**
* Takes minimum of tensor and value.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarMin(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarMin);
}



/**
* Multiplies tensor with value.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarMul(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarMul);
}



/**
* Checks (tensor != value).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarNtEq(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarNtEq);
}



/**
* Takes power of tensor and value.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarPow(_src, _value=0.0)
{
  self.OpScalar(_src, _value, SHD_TensorOp_ScalarPow);
}



/**
* Subtracts tensor by value.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Real} _value
*/ 
function __Tensor__OpScalarSub(_src, _value=0.0)
{
  self.OpScalarAdd(_src, -_value);
}



