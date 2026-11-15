


/**
*
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_Cos(_src) : AutoGrad_Unary(_src) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpCos(self.input[0]);
  };
  
  
  static Backward = function()
  {
    var _src = self.input[0];
    
    // dx : -sin(x)
    if (_src.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_src.itemCount);
      var _tempB = Tensor_Workspace_Get(_src.itemCount);
      _tempA.OpSin(_src);
      _tempB.OpNeg(_tempA);
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