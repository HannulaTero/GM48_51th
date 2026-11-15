

/**
* Returns array containing values with respective indexes.
* 
* @param {Real} _count
* @returns {Array<Real>}
*/ 
function GetArrayOfIndexes(_count)
{
  array_create_ext(_count, function(_index)
  {
    return _index;
  });
}