


/**
*
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_Log10(_src) : AutoGrad_Unary(_src) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpLog10(self.input[0]);
  };
  
  
  static Backward = function()
  {
    var _src = self.input[0];
    
    // dx : (1 / (x * log(10)))
    if (_src.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_src.shape);
      var _tempB = Tensor_Workspace_Get(_src.shape);
      _tempA.OpScalarMul(_src, ln(10));
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