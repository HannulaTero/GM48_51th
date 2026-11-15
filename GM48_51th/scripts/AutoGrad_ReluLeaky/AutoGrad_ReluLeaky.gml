


/**
*
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_ReluLeaky(_src) : AutoGrad_Unary(_src) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.output.OpReluLeaky(self.input[0]);
  };
  
  
  static Backward = function()
  {
    var _src = self.input[0];
    
    // dx : (x > 0) ? 1 : 0.01
    if (_src.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_src.itemCount);
      _tempA.OpUnary(_src, SHD_TensorDx_ReluLeaky);
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