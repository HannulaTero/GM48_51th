


/**
*
* 
* @param {Struct.Tensor}  _lhs
* @param {Struct.Tensor}  _rhs
* @param {Array<Real>}    _lhsAxis
* @param {Array<Real>}    _rhsAxis
*/ 
function AutoGrad_TensorMul(_lhs, _rhs, _lhsAxis, _rhsAxis) : AutoGrad_Binary(_lhs, _rhs) constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.output.OpTensorMul(
      self.input[0], 
      self.input[1], 
      self.axis[0], 
      self.axis[1]
    );
  };
  
  
  static Backward = function()
  {
    /**
    * Shapes of the tensors
    * lhs : MNOPR
    * rhs : AMRPB
    * 
    * Sumreduce axis are MPR
    * -> Permute them in matmul order
    * lhs : MPRNO
    * rhs : MPRAB
    * out : NOAB
    *
    * When bacpropagating, need to reorder again.
    * 
    * lhs.grad = MPRAB @ ABNO
    * -> sumreducable axis are : AB
    * -> resulting is MRPNO
    * -> Permute them in correct order
    * 
    * rhs.grad = NOMPR @ NOAB
    * -> sumreducable axis are : NO
    * -> resulting is MPRAB
    * -> Permute them in correct order
    * 
    * 
    */ 
    
    var _lhs = self.input[0];
    var _rhs = self.input[1];
    var _grad = self.grad;
    var _dxAxis = self.dxAxis;
    var _dyAxis = self.dyAxis;
    
    // dx : (y @ grad)
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      _lhs.grad.OpTensorMul(_rhs, _grad, _dxAxis[0], _dxAxis[1]);
      Tensor_Workspace_End();
      _lhs.Backward();
    }
    
    // dy : (x @ grad)
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      _rhs.grad.OpTensorMul(_lhs, _grad, _dyAxis[0], _dyAxis[1]);
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
  self.axis = [ [ ], [ ] ];
  
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
  self.axis[0] = variable_clone(_lhsAxis);
  
  // 
  self.axis[1] = variable_clone(_rhsAxis);
  
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