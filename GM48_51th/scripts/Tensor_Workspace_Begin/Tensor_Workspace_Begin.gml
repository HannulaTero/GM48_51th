


/**
* Begins new workspace scope.
*/ 
function Tensor_Workspace_Begin()
{
  static cached = [ ];
  static scopes = [ [ ] ];
  
  
  // Create new scope.
  array_push(scopes, [ ]);
  
  // Sort the cached by their capacities.
  if (array_length(cached) >= 2)
  {
    array_sort(cached, function(_lhs, _rhs)
    {
      return (_lhs.surfaceCapacity - _rhs.surfaceCapacity);
    });
  }
}