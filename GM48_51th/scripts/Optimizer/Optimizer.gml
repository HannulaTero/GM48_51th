

/**
* Apply gradients to the values,
* if tensor is set to learn.
* Recursively goes through all inputs.
* 
* @param {Struct.Tensor}  _tensor
* @param {Real}           _learningRate
*/ 
function Optimizer(_tensor, _learningRate=0.01)
{
  // Apply the optimizer to the tensor itself.
  if (_tensor.learnable == true)
  {
    Tensor_Workspace_Begin();
    var _tempA = Tensor_Workspace_Get(_tensor.shape);
    var _tempB = Tensor_Workspace_Get(_tensor.shape);
    _tempA.OpScalarMul(_tensor.grad, _learningRate);
    _tempB.OpSub(_tensor, _tempA);
    _tensor.OpSet(_tempB);
    Tensor_Workspace_End();
  }
  
  // Apply the optimizer to the inputs.
  var _input = _tensor.input; 
  var _count = array_length(_input);
  for(var i = 0; i < _count; i++)
  {
    Optimizer(_input[i], _learningRate);
  }
}