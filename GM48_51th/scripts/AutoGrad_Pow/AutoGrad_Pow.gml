


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
    self.output.OpDiv(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    var _capacity = self.input[0].itemCount;
    
    // dx : (y * power(x, y - 1))
    if (self.input[0].grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      var _tempB = Tensor_Workspace_Get(_capacity);
      _tempA.OpDecr(self.input[1]);
      _tempB.OpPow(self.input[0], _tempA);
      _tempA.OpMul(self.input[1], _tempB);
      self.input[0].grad.OpMul(_tempA, self.grad);
      self.input[0].Backward();
      Tensor_Workspace_End();
    }
    
    // dy : (power(x, y) * log(x))
    // -> Can use the output.
    if (self.input[1].grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      var _tempB = Tensor_Workspace_Get(_capacity);
      _tempA.OpLog(self.input[0]);
      _tempB.OpMul(self.output, _tempA);
      self.input[1].grad.OpMul(_tempB, self.grad);
      self.input[1].Backward();
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