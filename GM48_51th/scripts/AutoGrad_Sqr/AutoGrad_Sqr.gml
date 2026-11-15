


/**
*
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_Sqr(_src) : AutoGrad_Unary(_src) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.output.OpSqr(self.input[0]);
  };
  
  
  static Backward = function()
  {
    var _src = self.input[0];
    
    // dx : (2 * x)
    if (_src.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_src.itemCount);
      _tempA.OpScalarMul(_src, 2.0);
      _src.grad.OpMul(_tempA, self.grad);
      _src.Backward();
      Tensor_Workspace_End();
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