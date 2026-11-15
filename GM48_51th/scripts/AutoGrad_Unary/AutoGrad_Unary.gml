


/**
* 
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_Unary(_src) : AutoGrad() constructor
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
  
  
  // Set the input tensors.
  self.input[0] = _src;
  
  
  // Reshape the output tensor.
  self.output.Reshape(_src.shape);
  
  
  // Reshape the gradient tensor.
  if (self.grad != undefined)
  {
    self.grad.Reshape(_src.shape);
  }
  
  
  #endregion 
  // 
  //===========================================================
}