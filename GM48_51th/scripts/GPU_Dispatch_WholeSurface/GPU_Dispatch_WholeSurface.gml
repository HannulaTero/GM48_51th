


/**
* Updates whole surface target - doesn't care about padding.
*/ 
function GPU_Dispatch_WholeSurface()
{
  var _dst = surface_get_target();
  var _w = surface_get_width(_dst);
  var _h = surface_get_height(_dst);
  
  draw_sprite_stretched(SPR_GPU_1x1, 0, 0, 0, _w, _h);
}