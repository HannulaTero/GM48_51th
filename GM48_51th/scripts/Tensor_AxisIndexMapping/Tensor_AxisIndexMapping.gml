

/**
* Generates index-mapping for exis, 
* where to read each value.
* 
* @param {Array<Real>}  _axis
* @param {Real}         _rank
*/ 
function Tensor_AxisIndexMapping(_axis, _rank)
{
  var _mapping = [ ];
  
  var _count = array_length(_axis);
  for(var i = 0; i < _count; i++)
  {
    array_push(_mapping, _axis[i]);
  }
  
  for(var i = 0; i < _rank; i++)
  {
    if (array_get_index(_axis, i) < 0)
    {
      array_push(_mapping, i);
    }
  }
  
  return _mapping;
}