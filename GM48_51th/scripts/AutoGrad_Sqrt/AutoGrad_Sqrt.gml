


/**
*
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_Sqrt(_src) : AutoGrad_Unary(_src) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.output.OpSqrt(self.input[0]);
  };
  
  
  static Backward = function()
  {
    var _src = self.input[0];
    
    // dx : 1 / (2 * sqrt(x))
    // -> Can use output.
    if (_src.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_src.itemCount);
      var _tempB = Tensor_Workspace_Get(_src.itemCount);
      _tempA.OpScalarMul(self.output, 2.0);
      _tempB.OpInv(_tempA);
      _src.grad.OpMul(_tempB, self.grad);
      Tensor_Workspace_End();
      _src.Backward();
    }
  };
  
  
  
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
  
  
  
  #endregion 
  // 
  //===========================================================
}