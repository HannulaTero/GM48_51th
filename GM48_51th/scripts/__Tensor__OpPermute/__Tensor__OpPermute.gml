

/**
* Permutes the tensor datavalues, changes axis order.
* Argument is array, which takes shape's axis-index, and states what is new axis-index.
* 
* @param {Struct.Tensor}  _src      Source tensor.
* @param {Array<Real>}    _srcAxis  Old axis position for shape axis.
* @param {Array<Real>}    _dstAxis  New axis position for shape axis.
*/ 
function __Tensor__OpPermute(_src, _srcAxis, _dstAxis)
{
  static params = new Tensor();
  static buffer = buffer_create(1, buffer_fixed, TENSOR_DSIZE);
  
  
  // Sanity check.
  if (self.rank != _src.rank)
  {
    throw("Destination and source ranks must match!");
  }
  
  if (array_length(_srcAxis) != array_length(_dstAxis))
  {
    throw("Axis count must match!");
  }
  
  
  // Resize the parameter tensor.
  var _paramsShape = [ 2, self.rank ];
  var _paramsCount = (_paramsShape[0] * _paramsShape[1]); 
  if (array_equals(params.shape, _paramsShape) == false)
  {
    params.Reshape(_paramsShape, _paramsShape);
  }
  
  
  // Calculate the stride for permutations.
  // -> Need to be in order biggest source to smallest.
  var _strides = array_create(self.rank);
  for(var i = 0; i < self.rank; i++)
  {
    _strides[i] = {
      dst : self.stride[i],
      src : _src.stride[i],
    };
  }
  
  var _axisCount = array_length(_srcAxis);
  for(var i = 0; i < _axisCount; i++)
  {
    _strides[ i ].dst = self.stride[ _dstAxis[i] ];
    _strides[ i ].src = _src.stride[ _srcAxis[i] ];
  }
  
  array_sort(_strides, function(_lhs, _rhs)
  {
    return (_rhs.dst - _lhs.dst);
  });
  
  
  // Update the buffer contents, push to the tensor.
  buffer_resize(buffer, TENSOR_DSIZE * _paramsCount);
  for(var i = 0; i < self.rank; i++)
  {
    buffer_write(buffer, TENSOR_DTYPE, _strides[i].dst);
    buffer_write(buffer, TENSOR_DTYPE, _strides[i].src);
  }
  params.BufferPull(buffer);
  
  
  // Apply the permutation.
  GPU_SetState();
  GPU_SetShader(SHD_TensorOp_Permute);
  GPU_SetUniform_Sample("FSH_Params_Sampler", params);
  GPU_SetUniform_FloatN("FSH_Params_Meta",    params.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Dst_Meta",       self.surfaceMeta);
  GPU_SetUniform_FloatN("FSH_Src_Meta",       _src.surfaceMeta);
  GPU_SetUniform_Float1("FSH_Dst_Rank",       self.rank);
  GPU_SetTarget(self);
  GPU_Dispatch_WholeSurface(_src);
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}



