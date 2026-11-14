

/**
* Whether the results are subtracted from the target,
* instead of replacing.
* 
* @param {Bool} _bool
*/ 
function GPU_BlendSubtract(_bool=true)
{
  if (_bool == true)
  {
    gpu_set_blendenable(true);
    gpu_set_blendmode_ext(bm_one, bm_one);
    gpu_set_blendequation(bm_eq_subtract);
  }
  else
  {
    gpu_set_blendenable(false);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    gpu_set_blendequation(bm_eq_add);
  }
}