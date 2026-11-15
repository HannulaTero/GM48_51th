

/**
* Returns usable workspace-tensor in current workspace-scope.
* Reuses old ones, or creates new one if necessary.
*/ 
function Tensor_Workspace_Get(_capacity)
{
  static cached = Tensor_Workspace_Begin.cached;
  static scopes = Tensor_Workspace_Begin.scopes;
  
  var _tensor = (array_length(cached) > 0)
    ? array_pop(cached)
    : new Tensor(undefined, false);
    
  _tensor.ReserveCapacity(_capacity);
  array_push(array_last(scopes), _tensor);
}