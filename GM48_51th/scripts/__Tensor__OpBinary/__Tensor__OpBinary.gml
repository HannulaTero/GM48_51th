

/**
* Applies piecewise binary operation.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @param {Asset.GMShader}
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpBinary(_lhs, _rhs, _shader)
{
  if (self.MatchSize(_lhs) == false)
  || (self.MatchSize(_rhs) == false)
  {
    throw("Tensor inputs and output sizes do not match.");
  }
  
  GPU_SetState();
  GPU_SetShader(_shader);
  GPU_SetUniform_Sample("FSH_Lhs_Sampler", _lhs);
  GPU_SetUniform_FloatN("FSH_Dst_Meta", self.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Lhs_Meta", _lhs.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Rhs_Meta", _rhs.surfaceMeta);
  GPU_SetTarget(self);
  GPU_Dispatch_Full(_rhs);
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



/**
* Applies piecewise addition.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpAdd(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Add);
}



/**
* Applies piecewise division.
* Remember to sanitize the input to avoid division by zero!
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpDiv(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Div);
}



/**
* Applies piecewise equality check.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpEq(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Eq);
}



/**
* Applies piecewise greater than check.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpGt(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Gt);
}



/**
* Applies piecewise greater than or equal check.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpGtEq(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_GtEq);
}



/**
* Applies piecewise less than check.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpLt(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Lt);
}



/**
* Applies piecewise less than or equal check.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpLtEq(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_LtEq);
}



/**
* Applies piecewise maximum.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpMax(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Max);
}



/**
* Applies piecewise mean.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpMean(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Mean);
}



/**
* Applies piecewise minimum.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpMin(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Min);
}



/**
* Applies piecewise modulo.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpMod(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Mod);
}



/**
* Applies piecewise multiplication.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpMul(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Mul);
}



/**
* Applies piecewise not equal check.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpNtEq(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_NtEq);
}



/**
* Applies piecewise power(lhs, rhs).
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpPow(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Pow);
}



/**
* Applies piecewise subtraction.
* 
* @context Tensor
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSub(_lhs, _rhs)
{
  __Tensor__OpBinary(_lhs, _rhs, SHD_TensorOp_Sub);
}





