


/**
*
* 
* @param {Struct.Tensor} _lhs
* @param {Struct.Tensor} _rhs
*/ 
function AutoGrad_Mean(_lhs, _rhs) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.output.OpMean(self.input[0], self.input[1]);
  };
  
  
  static Backward = function()
  {
    // dx : 0.5
    if (self.input[0].grad != undefined)
    {
      self.input[0].grad.OpSet(self.grad);
      self.input[0].Backward();
    }
    
    // dx : 0.5
    if (self.input[1].grad != undefined)
    {
      self.input[1].grad.OpSet(self.grad);
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