

/**
* Whether instead of replacing, 
* the minimum of results and previous values is taken.
* 
* @param {Bool} _bool
*/ 
function GPU_BlendMinimum(_bool=true)
{
  if (_bool == true)
  {
    gpu_set_blendenable(true);
    gpu_set_blendequation(bm_eq_max);
  }
  else
  {
    gpu_set_blendenable(false);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    gpu_set_blendequation(bm_eq_add);
  }
}