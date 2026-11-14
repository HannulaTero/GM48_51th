

/**
* Set GPU state for better for faking compute.
*/ 
function GPU_SetState()
{
  // Create the state.
  static state = method_call(function()
  {
    gpu_push_state();
    gpu_set_tex_filter(false);
    gpu_set_tex_repeat(true); // PRNG handling easier.
    gpu_set_alphatestenable(false);
    gpu_set_blendenable(false);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    gpu_set_blendequation(bm_eq_add);
    gpu_set_alphatestref(0);
    gpu_set_colourwriteenable(true, false, false, false); // Because r32float
    gpu_set_fog(false, c_black, 0, 1);
    gpu_set_zwriteenable(false);
    gpu_set_ztestenable(false);
    gpu_set_stencil_enable(false);
    gpu_set_tex_mip_enable(false);
    gpu_set_cullmode(cull_noculling);
    
    var _state = gpu_get_state();
    gpu_pop_state();
    return _state;
  });
  
  // Set the state.
  gpu_push_state();
  gpu_set_state(state);
}