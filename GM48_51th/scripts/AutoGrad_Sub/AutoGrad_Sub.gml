


/**
*
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function AutoGrad_Sub(_lhs, _rhs) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpSub(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    
    // dx : 1.0
    if (_lhs.grad != undefined)
    {
      _lhs.grad.OpSet(self.grad);
      _lhs.Backward();
    }
    
    // dy : -1.0
    if (_rhs.grad != undefined)
    {
      _rhs.grad.OpNeg(self.grad);
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