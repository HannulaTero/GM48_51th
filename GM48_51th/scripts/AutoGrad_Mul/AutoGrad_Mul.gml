


/**
*
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function AutoGrad_Mul(_lhs, _rhs) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.output.OpMul(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    // dx : y
    if (self.input[0].grad != undefined)
    {
      self.input[0].grad.OpMul(self.input[1], self.grad);
      self.input[0].Backward();
    }
    
    // dy : x
    if (self.input[1].grad != undefined)
    {
      self.input[1].grad.OpMul(self.input[0], self.grad);
      self.input[1].Backward();
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