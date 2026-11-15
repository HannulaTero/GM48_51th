


/**
*
* 
* @param {Struct.Tensor} _src
*/ 
function AutoGrad_Incr(_src) : AutoGrad_Unary(_src) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.output.OpIncr(self.input[0]);
  };
  
  
  static Backward = function()
  {
    var _src = self.input[0];
    
    // dx : 1.0
    if (_src.grad != undefined)
    {
      _src.grad.OpSet(self.grad);
      _src.Backward();
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