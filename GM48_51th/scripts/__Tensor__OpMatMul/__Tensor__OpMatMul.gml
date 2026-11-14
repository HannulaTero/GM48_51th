

/**
* Applies matrix multiplication in specific way.
* -> Sumreducing happens by the first dimensions of both operands.
* -> shapes : lhs[MN] x rhs[MO] => out[NO]
* -> This allows assuming that each can be iterated by offsetting by 1.
* 
* @param {Struct.Tensor}  _lhs          Left operand.
* @param {Struct.Tensor}  _rhs          Right operand.
* @param {Real}           _reduceCount  
*/ 
function __Tensor__OpMatMul(_lhs, _rhs, _reduceCount)
{
  var _lhsReducedSize = floor(_lhs.itemCount / _reduceCount);
  var _rhsReducedSize = floor(_rhs.itemCount / _reduceCount);
  if (self.itemCount != _lhsReducedSize * _rhsReducedSize)
  {
    throw("Destination size isn't expected size.");
  }
  
  GPU_SetState();
  GPU_SetShader(SHD_TensorOp_MatMul);
  GPU_SetUniform_Sample("FSH_Lhs_Sampler",  _lhs);
  GPU_SetUniform_Sample("FSH_Rhs_Sampler",  _rhs);
  GPU_SetUniform_FloatN("FSH_Dst_Meta",     self.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Lhs_Meta",     _lhs.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Rhs_Meta",     _rhs.surfaceMeta);
  GPU_SetUniform_Float1("FSH_IndexDivisor", _lhsReducedSize);
  GPU_SetUniform_Float1("FSH_ReduceCount",  _reduceCount);
  GPU_SetTarget(self);
  GPU_Dispatch_Full();
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



