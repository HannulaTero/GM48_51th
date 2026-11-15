

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
  static lhsTemp = new Tensor(undefined, false);
  static rhsTemp = new Tensor(undefined, false);
  
  
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
  
  
  // Ensure the helper tensors have enough capacity.
  lhsTemp.ReserveCapacity(_lhs.itemCount);
  rhsTemp.ReserveCapacity(_rhs.itemCount);
  
  
  // Permute the inputs.
  var _srcAxis = GetArrayOfIndexes(self.rank);
  var _lhsDstAxis = Tensor_AxisIndexMapping(_lhsAxis, self.rank);
  var _rhsDstAxis = Tensor_AxisIndexMapping(_rhsAxis, self.rank);
  lhsTemp.OpPermute(_lhs, _lhsDstAxis, _srcAxis);
  rhsTemp.OpPermute(_rhs, _rhsDstAxis, _srcAxis);
  
  
  // Apply the matrix multiplication.
  self.OpMatMul(lhsTemp, rhsTemp, _reduceCount);
}



