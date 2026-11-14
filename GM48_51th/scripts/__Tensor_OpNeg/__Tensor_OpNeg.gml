

/**
* Negates the input.
* 
* @context Tensor
* @param {Struct.Tensor} _src
* @returns {Struct.Tensor}
*/ 
function __Tensor_OpNeg(_src)
{
  GPU_SetState();
  GPU_SetShader(SHD_TensorOp_Neg);
  GPU_SetUniform_FloatN("FSH_Dst_Meta", self.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Src_Meta", _src.surfaceMeta);
  GPU_SetTarget(self);
  GPU_Dispatch_Full(_src);
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}