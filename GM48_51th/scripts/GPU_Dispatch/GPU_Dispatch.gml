


/**
* Updates all values of the tensor - skips the surface padding.
*/ 
function GPU_Dispatch()
{
  var _count      = TENSOR_TARGET.itemCount;
  var _width      = TENSOR_TARGET.surfaceLayout[0];
  var _height     = (_count div _width);
  var _remainder  = (_count mod _width);
  
  draw_sprite_stretched(SPR_GPU_1x1, 0, 0, 0, _width, _height);
  
  if (_remainder > 0)
  {
    draw_sprite_stretched(SPR_GPU_1x1, 0, 0, _height, _remainder, 1);
  }
}