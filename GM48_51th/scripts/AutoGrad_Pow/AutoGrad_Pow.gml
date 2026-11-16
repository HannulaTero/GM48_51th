


/**
*
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function AutoGrad_Pow(_lhs, _rhs) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpPow(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    
    // dx : (y * power(x, y - 1))
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(self.shape);
      var _tempB = Tensor_Workspace_Get(self.shape);
      _tempA.OpDecr(_rhs);
      _tempB.OpPow(_lhs, _tempA);
      _tempA.OpMul(_rhs, _tempB);
      _lhs.grad.OpMul(_tempA, self.grad);
      Tensor_Workspace_End();
      _lhs.Backward();
    }
    
    // dy : (power(x, y) * log(x))
    // -> Can use the output.
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(self.shape);
      var _tempB = Tensor_Workspace_Get(self.shape);
      _tempA.OpLog(_lhs);
      _tempB.OpMul(self, _tempA);
      _rhs.grad.OpMul(_tempB, self.grad);
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