


/**
*
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function Tensor_Mul(_lhs, _rhs) : Tensor_Binary(_lhs, _rhs) constructor
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
    if (self.input[0].grad != undefined)
    {
      self.input[0].grad.OpMul(self.input[1], self.grad);
      self.input[0].Backward();
    }
    
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