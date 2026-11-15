


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
function AutoGrad_MatMul(_lhs, _rhs, _reduceCount) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.output.OpMatMul(self.input[0], self.input[1], self.reduceCount);
  };
  
  
  static Backward = function()
  {
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    var _grad = self.grad;
    
    // dx : (y @ grad)
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      _lhs.grad.OpMatMul(_rhs, _grad, self.dxReduceCount);
      Tensor_Workspace_End();
      _lhs.Backward();
    }
    
    // dy : (x @ grad)
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      _rhs.grad.OpMatMul(_lhs, _grad, self.dyReduceCount);
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
  
  // 
  self.dxReduceCount = 1;
  
  // 
  self.dyReduceCount = 1;
  
  // What axis should be used partial derivative dx
  self.dxAxis = [ [ ], [ ] ];
  
  // What axis should be used partial derivative dy
  self.dyAxis = [ [ ], [ ] ];
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region APPLY THE ARGUMENTS.
  
  
  // 
  self.reduceCount = _reduceCount;
  
  // 
  self.dxAxis[0] = 0
  self.dxAxis[1] = 0
  
  // 
  self.dyAxis[0] = 0
  self.dyAxis[1] = 0
  
  
  #endregion 
  // 
  //===========================================================
}