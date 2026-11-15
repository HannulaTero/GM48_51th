


/**
* This function reserves larger surface, so it atleast fits target capacity.
* This might actually be larger, as it's 2D surface.
* 
* @param {Real} _capacity
*/ 
function __Tensor__ReserveCapacity(_capacity)
{
  static layout = [ 1, 1 ];
  
  if (self.surfaceCapacity < _capacity)
  {
    var _log  = ceil(log2(self.itemCount));
    var _logW = ceil(_log * 0.5);
    var _logH = (_log - _logW);
    layout[0] = power(2.0, _logW);
    layout[1] = power(2.0, _logH);
    self.Reshape(self.shape, layout);
  }
}