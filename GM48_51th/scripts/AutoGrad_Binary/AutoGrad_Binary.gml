


/**
* 
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function AutoGrad_Binary(_lhs, _rhs) : Tensor() constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region DECLARE VARIABLES.
  
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region APPLY THE ARGUMENTS.
  
  
  // Ensure that inputs match.
  if (_lhs.MatchShape(_rhs) == false)
  {
    throw("Input dimensions do not match!");
  }
  
  
  // Set the input tensors.
  self.input[0] = _lhs;
  self.input[1] = _rhs;
  
  
  // Reshape the output tensor.
  self.Reshape(_lhs.shape);
  
  
  // Reshape the gradient tensor.
  if (self.grad != undefined)
  {
    self.grad.Reshape(self.shape);
  }
  
  
  #endregion 
  // 
  //===========================================================
}