

/**
* Permutes the tensor datavalues like matrix.
* 
* Doesn't care whether the tensor has actually higher dimensions.
* 
* @param {Struct.Tensor}  _src    Source tensor, permuted like matrix.
* @param {Real}           _width  The source matrix width.
*/ 
function __Tensor__OpPermuteMatrix(_src, _width)
{
  // Sanity check.
  if ((_src.itemCount mod _width) != 0)
  {
    throw("Tensor couldn't be permuted as matrix!");
  }
  
  if (self.itemCount != _src.itemCount)
  {
    throw("Destination and source sizes do not match!");
  }
  
  
  // Apply the permutation.
  GPU_SetState();
  GPU_SetShader(SHD_TensorOp_PermuteMatrix);
  GPU_SetUniform_Sample("FSH_Src_Sampler",  _src);
  GPU_SetUniform_FloatN("FSH_Src_Meta",     _src.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Dst_Meta",     self.surfaceMeta);
  GPU_SetUniform_Float1("FSH_Src_Width",    _width);
  GPU_SetUniform_Float1("FSH_Dst_Width",    (_src.itemCount div _width));
  GPU_SetTarget(self);
  GPU_Dispatch();
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



