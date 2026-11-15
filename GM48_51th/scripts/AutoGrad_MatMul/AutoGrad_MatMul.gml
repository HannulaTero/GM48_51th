


/**
* Applies matrix multiplication in specific way.
* -> Sumreducing happens by the first dimensions of both operands.
* -> shapes : lhs[MN] x rhs[MO] => out[NO]
* 
* Doesn't care whether the tensor has actually higher dimensions.
* 
* @param {Struct.Tensor}  _lhs
* @param {Struct.Tensor}  _rhs
* @param {Real}           _reduceCount
*/ 
function AutoGrad_MatMul(_lhs, _rhs, _reduceCount) : Tensor() constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpMatMul(self.input[0], self.input[1], self.reduceCount);
  };
  
  
  static Backward = function()
  {
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    var _grad = self.grad;
    
    var _lhsWidth   = self.reduceCount;
    var _rhsWidth   = self.reduceCount;
    var _lhsHeight  = (_lhs.itemCount div _lhsWidth);
    var _rhsHeight  = (_rhs.itemCount div _rhsWidth);
    
    // dx : (y @ grad)
    // forward  : lhs[MN] x rhs[MO] => out[NO]
    // backward : rhs[MO] x out.grad[NO] => lhs.grad[MN]
    // Both needs to be permutated.
    // backward : rhs[OM] x out.grad[ON] => lhs.grad[MN]
    // -> Result doesn't need permutation.
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get();
      var _tempB = Tensor_Workspace_Get();
      _tempA.OpPermuteMatrix(_rhs,  _rhsWidth);
      _tempB.OpPermuteMatrix(_grad, _lhsHeight);
      _lhs.grad.OpMatMul(_tempA, _tempB, _rhsHeight);
      Tensor_Workspace_End();
      _lhs.Backward();
    }
    
    // dy : (x @ grad)
    // forward  : lhs[MN] x rhs[MO] => out[NO]
    // backward : lhs[MN] x out.grad[NO] => rhs.grad[MO]
    // Lhs only needs to be permutated.
    // backward : lhs[NM] x out.grad[NO] => rhs.grad[MO]
    // -> Result doesn't need permutation.
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get();
      _tempA.OpPermuteMatrix(_lhs, _lhsWidth);
      _rhs.grad.OpMatMul(_tempA, _tempB, _lhsHeight);
      Tensor_Workspace_End();
      _rhs.Backward();
    }
  };
  
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region DECLARE VARIABLES.
  
  
  // 
  self.reduceCount = _reduceCount;
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region APPLY THE ARGUMENTS.
  
  
  
  // Set the input tensors.
  self.input[0] = _lhs;
  self.input[1] = _rhs;
  
  
  // Reshape the output tensor.
  {
    
    self.Reshape(_shape);
  }
  
  
  // Reshape the gradient tensor.
  if (self.grad != undefined)
  {
    self.grad.Reshape(self.shape);
  }
  
  
  
  #endregion 
  // 
  //===========================================================
}