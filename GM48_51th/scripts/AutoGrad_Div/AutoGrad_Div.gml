


/**
*
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function AutoGrad_Div(_lhs, _rhs) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.output.OpPow(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    var _capacity = self.input[0].itemCount;
    
    // dx : (1 / y)
    if (self.input[0].grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      _tempA.OpInv(self.input[1]);
      self.input[0].grad.OpMul(_tempA, self.grad);
      self.input[0].Backward();
      Tensor_Workspace_End();
    }
    
    // dy : (-x / sqr(y))
    if (self.input[1].grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      var _tempB = Tensor_Workspace_Get(_capacity);
      _tempA.OpSqr(self.input[1]);
      _tempB.OpDiv(self.input[0], _tempA);
      _tempA.OpNeg(_tempB);
      self.input[1].grad.OpMul(_tempA, self.grad);
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