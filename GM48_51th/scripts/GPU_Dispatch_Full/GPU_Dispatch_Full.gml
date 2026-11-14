


/**
* Updates whole target.
*/ 
function GPU_Dispatch_Full(_base=undefined)
{
  var _dst = surface_get_target();
  var _w = surface_get_width(_dst);
  var _h = surface_get_height(_dst);
  
  if (_base == undefined)
  {
    draw_sprite_stretched(SPR_GPU_1x1, 0, 0, 0, _w, _h);
    return;
  }
  
  if (is_struct(_base) == true)
  && (is_instanceof(_base, Tensor) == true)
  {
    draw_surface_stretched(_base.GetSurface(), 0, 0, _w, _h);
    return;
  }
  
  if (surface_exists(_base) == true)
  {
    draw_surface_stretched(_base, 0, 0, _w, _h);
    return;
  }
}