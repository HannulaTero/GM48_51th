

/**
* Returns usable workspace-tensor in current workspace-scope.
* Reuses old ones, or creates new one if necessary.
* 
* @param {Array<Real>} _shape
* @returns {Struct.Tensor}
*/ 
function Tensor_Workspace_Get(_shape)
{
  static cached = Tensor_Workspace_Begin.cached;
  static scopes = Tensor_Workspace_Begin.scopes;
  
  var _tensor = (array_length(cached) > 0)
    ? array_pop(cached)
    : new Tensor(undefined, false);
  array_push(array_last(scopes), _tensor);
    
  _tensor.Reshape(_shape, _tensor.surfaceLayout);
  
  return _tensor;
}