

// Whether game has just launched and starting.
// -> If game is restarted, then it is already "warm".
#macro INITIALIZE_COLD_BOOTUP \
  global.gINITIALIZE_COLD_BOOTUP
  global.gINITIALIZE_COLD_BOOTUP = true;
  


// What is the tensor data-format in GPU and CPU.
#macro TENSOR_FORMAT  surface_r32float
#macro TENSOR_DTYPE   buffer_f32
#macro TENSOR_DSIZE   buffer_sizeof(TENSOR_DTYPE)



/**
* 
*/ 
function GameInitialize()
{
  // Settings etc. which are defined anyways.
  
  
  // Decide whether it's Warm / Cold initialization.
  if (INITIALIZE_COLD_BOOTUP == true)
  {
    GameInitialize_Cold();
  }
  else
  {
    GameInitialize_Warm();
  }
}