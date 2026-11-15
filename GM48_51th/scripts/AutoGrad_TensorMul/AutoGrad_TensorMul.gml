


/**
*
* 
* @param {Struct.Tensor}  _lhs
* @param {Struct.Tensor}  _rhs
* @param {Array<Real>}    _lhsAxis
* @param {Array<Real>}    _rhsAxis
*/ 
function AutoGrad_TensorMul(_lhs, _rhs, _lhsAxis, _rhsAxis) : Tensor() constructor
{
  //===========================================================
  // 
  #region STATIC METHODS.
  
  
  static Forward = function()
  {
    self.ForwardInputs();
    self.OpTensorMul(
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
    var _dyAxis = self.dyAxis;
    
    // dx : (y @ grad)
    if (_lhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_lhs.grad.shape);
      _tempA.OpTensorMul(_rhs, _grad, self.dxAxis[0], self.dxAxis[1]);
      _lhs.grad.OpPermute(_tempA, self.dxPermute[0], self.dxPermute[1]);
      Tensor_Workspace_End();
      _lhs.Backward();
    }
    
    // dy : (x @ grad)
    if (_rhs.grad != undefined)
    {
      Tensor_Workspace_Begin();
      var _tempA = Tensor_Workspace_Get(_rhs.grad.shape);
      _tempA.OpTensorMul(_lhs, _grad, self.dyAxis[0], self.dyAxis[1]);
      _rhs.grad.OpPermute(_tempA, self.dyPermute[0], self.dyPermute[1]);
      Tensor_Workspace_End();
      _rhs.Backward();
    }
  };
  
  
  
  #endregion 
  // 
  //===========================================================
  // 
  #region DECLARE VARIABLES.
  
  
  // Forward axis.
  self.axis = [ [ ], [ ] ];
  
  // What axis should be used partial derivative dx
  self.dxAxis = [ [ ], [ ] ];
  
  // What axis should be used partial derivative dy
  self.dyAxis = [ [ ], [ ] ];
  
  // How dx should be permuted.
  self.dxPermute = [ [ ], [ ] ];
  
  // How dy should be permuted.
  self.dyAxis = [ [ ], [ ] ];
  
  
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
    var _shape = [ ];
    
    for(var i = 0; i < _lhs.rank; i++)
    {
      if (array_get_index(_lhsAxis, i) < 0)
      {
        array_push(_shape, _lhs.shape[i]);
      }
    }
    
    for(var i = 0; i < _rhs.rank; i++)
    {
      if (array_get_index(_rhsAxis, i) < 0)
      {
        array_push(_shape, _rhs.shape[i]);
      }
    }
    
    self.Reshape(_shape);
  }
  
  
  // Reshape the gradient tensor.
  if (self.grad != undefined)
  {
    self.grad.Reshape(self.shape);
  }
  
  
  // 
  self.axis[0] = variable_clone(_lhsAxis);
  
  // 
  self.axis[1] = variable_clone(_rhsAxis);
  
  
  // Solve the partial derivative dy axis indexes.
  {
    self.dyAxis[0] = GetArrayOfIndexes(self.input[0].rank);
    var _count = array_filter_ext(self.dyAxis[0], function(_element)
    {
      return (array_get_index(self.axis[0], _element) < 0);
    });
    array_resize(self.dyAxis[0], _count);
  
    var _target = self.dyAxis[1];
    for(var i = 0; i < _count; i++)
    {
      array_push(_target, i);
    }
  }
  
  
  // Solve the partial derivative dx axis indexes for input.
  {
    self.dxAxis[0] = GetArrayOfIndexes(self.input[1].rank);
    var _count = array_filter_ext(self.dxAxis[0], function(_element)
    {
      return (array_get_index(self.axis[1], _element) < 0);
    });
    array_resize(self.dxAxis[0], _count);
    
    var _start = array_length(self.dyAxis[0]);
    var _target = self.dxAxis[1];
    for(var i = _start; i < self.rank; i++)
    {
      array_push(_target, i);
    }
  }
  
  
  // Solve the permutations for dx.
  {
    var _rank = self.input[0].rank;
    self.dxPermute[0] = GetArrayOfIndexes(_rank);
    self.dxPermute[1] = Tensor_AxisIndexMapping(_lhsAxis, _rank);
  }
  
  
  // Solve the permutations for dy.
  {
    var _rank = self.input[1].rank;
    self.dyPermute[0] = GetArrayOfIndexes(_rank);
    self.dyPermute[1] = Tensor_AxisIndexMapping(_rhsAxis, _rank);
  }
  
  
  #endregion 
  // 
  //===========================================================
}