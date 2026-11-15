

/**
* 
*/ 
function Tensor_AutoGrad() constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward  = NO_OP;
  static Backward = NO_OP;
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region DECLARE VARIABLES.
  
  
  // The input tensors.
  self.input = [ ];
  
  // The output tensor.
  self.output = new Tensor(undefined, true);
  
  // Whether this has a gradient.
  self.grad = new Tensor(undefined, false);
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region CONSTRUCTOR INITIALIZATION.
  
  
  #endregion 
  // 
  //===========================================================
}