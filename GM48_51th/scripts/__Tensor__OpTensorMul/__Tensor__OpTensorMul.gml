

/**
* Applies tensor multiplication.
* 
* @param {Struct.Tensor}  _lhs      Left operand.
* @param {Struct.Tensor}  _rhs      Right operand.
* @param {Array<Real>}    _lhsAxis  Chosen sum-reduced axis
* @param {Array<Real>}    _rhsAxis  Chosen sum-reduced axis
*/ 
function __Tensor__OpTensorMul(_lhs, _rhs, _lhsAxis, _rhsAxis)
{
  static lhsTemp = new Tensor();
  static rhsTemp = new Tensor();
  
  
  // Sanity checks. 
  var _axisCount = array_length(_lhsAxis);
  if (_axisCount != array_length(_rhsAxis))
  {
    throw("Axis count must match!");
  }
  
  var _reduceCount = 1;
  for(var i = 0; i < _axisCount; i++)
  {
    var _axisSize = _lhs.shape[_lhsAxis[i]];
    if (_axisSize != _rhs.shape[_rhsAxis[i]])
    {
      throw("Mismatching axis sizes!");
    }
    _reduceCount *= _axisSize;
  }
  
  
  // Resize the helper tensors.
  if (lhsTemp.surfaceCapacity < _lhs.itemCount)
  {
    var _log  = ceil(log2(_lhs.itemCount));
    var _logW = ceil(_log * 0.5);
    var _logH = (_log - _logW);
    var _w = power(2.0, _logW);
    var _h = power(2.0, _logH);
    lhsTemp.Reshape(_lhs.shape, [ _w, _h ]);
  }
  
  if (rhsTemp.surfaceCapacity < _rhs.itemCount)
  {
    var _log  = ceil(log2(_lhs.itemCount));
    var _logW = ceil(_log * 0.5);
    var _logH = (_log - _logW);
    var _w = power(2.0, _logW);
    var _h = power(2.0, _logH);
    rhsTemp.Reshape(_rhs.shape, [ _w, _h ]);
  }
  
  
  // Find how the axis need to be moved.
  var _lhsDstAxis = [ ];
  var _rhsDstAxis = [ ];
  for(var i = 0; i < _axisCount; i++)
  {
    array_push(_lhsDstAxis, _lhsAxis[i]);
    array_push(_rhsDstAxis, _rhsAxis[i]);
  }
  
  for(var i = 0; i < self.rank; i++)
  {
    if (array_get_index(_lhsAxis, i) < 0)
    {
      array_push(_lhsDstAxis, i);
    }
    if (array_get_index(_rhsAxis, i) < 0)
    {
      array_push(_rhsDstAxis, i);
    }
  }
  
  
  // Permute the inputs.
  var _srcAxis = array_create_ext(self.rank, function(_index)
  {
    return _index;
  });
  
  lhsTemp.OpPermute(_lhs, _srcAxis, _lhsDstAxis);
  rhsTemp.OpPermute(_rhs, _srcAxis, _rhsDstAxis);
  
  
  // Apply the matrix multiplication.
  self.OpMatMul(lhsTemp, rhsTemp, _reduceCount);
}



