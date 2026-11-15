


/**
*
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function AutoGrad_Max(_lhs, _rhs) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpMax(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    
    // dx : (x >= y) ? 1 : 0
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(self.shape);
      _tempA.OpGtEq(_lhs, _rhs);
      _lhs.grad.OpMul(_tempA, self.grad);
      Tensor_Workspace_End();
      _lhs.Backward();
    }
    
    // dy : (x >= y) ? 0 : 1
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(self.shape);
      _tempA.OpLt(_lhs, _rhs);
      _rhs.grad.OpMul(_lhs, self.grad);
      Tensor_Workspace_End();
      _rhs.Backward();
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