


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
    self.output.OpMax(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    var _capacity = _lhs.itemCount;
    
    // dx : (x >= y) ? 1 : 0
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      _tempA.OpGtEq(_lhs, _rhs);
      _lhs.grad.OpMul(_tempA, self.grad);
      _lhs.Backward();
      Tensor_Workspace_End();
    }
    
    // dy : (x >= y) ? 0 : 1
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_capacity);
      _tempA.OpLt(_lhs, _rhs);
      _rhs.grad.OpMul(_lhs, self.grad);
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