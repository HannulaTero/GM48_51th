


/**
*
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_Silu(_src) : AutoGrad_Unary(_src) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpSilu(self.input[0]);
  };
  
  
  static Backward = function()
  {
    var _src = self.input[0];
    
    // dx : (exp(x) * (x + exp(x) + 1) / sqr(exp(x) + 1))
    if (_src.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_src.itemCount);
      _tempA.OpUnary(_src, SHD_TensorDx_Silu);
      _src.grad.OpMul(_tempA, self.grad);
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