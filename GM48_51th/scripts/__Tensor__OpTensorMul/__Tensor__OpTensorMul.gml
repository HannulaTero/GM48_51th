

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
  
  
  // Permute the inputs.
  var _srcAxis = array_create_ext(_axisCount, function(_index)
  {
    return _index;
  });
  
  for(var i = 0; i < _axisCount; i++)
  {
    
  }
  
  lhsTemp.Permute(_lhs, _srcAxis, _lhsDstAxis);
  rhsTemp.Permute(_rhs, _srcAxis, _rhsDstAxis);
  
  
  // Apply the matrix multiplication.
  self.OpMatMul(lhsTemp, rhsTemp);
}



