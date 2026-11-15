

/**
* End the current workspace scope.
* Pushes tensors to cached, so recreation isn't needed.
*/ 
function Tensor_Workspace_End()
{
  static cached = Tensor_Workspace_Begin.cached;
  static scopes = Tensor_Workspace_Begin.scopes;
  
  var _scope = array_pop(scopes);
  var _count = array_length(_scope);
  for(var i = 0; i < _count; i++)
  {
    array_push(cached, _scope[i]);
  }
}