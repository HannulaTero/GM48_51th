


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
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    var _capacity = _lhs.itemCount;
    
    // dx : (y * power(x, y - 1))
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      var _tempB = Tensor_Workspace_Get(_capacity);
      _tempA.OpDecr(_rhs);
      _tempB.OpPow(_lhs, _tempA);
      _tempA.OpMul(_rhs, _tempB);
      _lhs.grad.OpMul(_tempA, self.grad);
      _lhs.Backward();
      Tensor_Workspace_End();
    }
    
    // dy : (power(x, y) * log(x))
    // -> Can use the output.
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      var _tempB = Tensor_Workspace_Get(_capacity);
      _tempA.OpLog(_lhs);
      _tempB.OpMul(self.output, _tempA);
      _rhs.grad.OpMul(_tempB, self.grad);
      _rhs.Backward();
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