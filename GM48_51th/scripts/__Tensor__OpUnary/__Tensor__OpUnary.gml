

/**
* Applies piecewise unary operation.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @param {Asset.GMShader}
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpUnary(_src, _shader)
{
  if (self.MatchSize(_src) == false)
  {
    throw("Tensor input and output size do not match.");
  }
  
  GPU_SetState();
  GPU_SetShader(_shader);
  GPU_SetUniform_FloatN("FSH_Dst_Meta", self.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Src_Meta", _src.surfaceMeta);
  GPU_SetTarget(self);
  GPU_Dispatch_Full(_src);
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



/**
* Applies abs(x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpAbs(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Abs);
}



/**
* Applies ceil(x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpCeil(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Ceil);
}



/**
* Applies cosine
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpCos(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Cos);
}



/**
* Applies decrement
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpDecr(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Decr);
}



/**
* Applies exp(x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpExp(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Exp);
}



/**
* Applies floor(x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpFloor(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Floor);
}



/**
* Applies frac(x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpFrac(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Frac);
}



/**
* Applies increment
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpIncr(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Incr);
}



/**
* Inverses the input (1 / x).
* Remember to sanitize input, so there are no zeroes!
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpInv(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Inv);
}



/**
* Applies natural logarithm.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpLog(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Log);
}



/**
* Applies log2(x).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpLog2(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Log2);
}



/**
* Applies log10(x).
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpLog10(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Log10);
}



/**
* Negates the input.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpNeg(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Neg);
}



/**
* Applies (x < 0.5)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpNot(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Not);
}



/**
* Applies relu: max(0.0, x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpRelu(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Relu);
}



/**
* Applies leaky relu: max(0.1, x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpReluLeaky(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_ReluLeaky);
}



/**
* Applies rounding
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpRound(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Round);
}



/**
* Just copies values over.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSet(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Set);
}



/**
* Applies sigmoid activation function.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSigmoid(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Sigmoid);
}



/**
* Applies sign(x)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSign(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Sign);
}



/**
* Applies x / (1.0 + abs(x))
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSignSoft(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_SignSoft);
}



/**
* Applies x / (1.0 + exp(-x))
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSilu(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Silu);
}



/**
* Applies sine
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSin(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Sin);
}



/**
* Applies softplus activation function.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSoftPlus(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_SoftPlus);
}



/**
* Applies square
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSqr(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Sqr);
}



/**
* Applies square root
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpSqrt(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Sqrt);
}



/**
* Applies binary step (x >= 0.0)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpStep(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Step);
}



/**
* Applies tangent
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpTan(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Tan);
}



/**
* Applies hyperbolic tangent
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpTanh(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Tanh);
}



/**
* Applies (x >= 0.5)
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor__OpTruthy(_src)
{
  __Tensor__OpUnary(_src, SHD_TensorOp_Truthy);
}










