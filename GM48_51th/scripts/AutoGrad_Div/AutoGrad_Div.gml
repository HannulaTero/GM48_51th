


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
    self.ForwardInputs();
    self.OpPow(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    
    // dx : (1 / y)
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(self.shape);
      _tempA.OpInv(_rhs);
      _lhs.grad.OpMul(_tempA, self.grad);
      Tensor_Workspace_End();
      _lhs.Backward();
    }
    
    // dy : (-x / sqr(y))
    if (self.input[1].grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(self.shape);
      var _tempB = Tensor_Workspace_Get(self.shape);
      _tempA.OpSqr(_rhs);
      _tempB.OpDiv(_lhs, _tempA);
      _tempA.OpNeg(_tempB);
      _rhs.grad.OpMul(_tempA, self.grad);
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