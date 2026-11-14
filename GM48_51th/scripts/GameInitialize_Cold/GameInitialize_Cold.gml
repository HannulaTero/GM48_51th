


/**
* 
*/ 
function GameInitialize_Cold()
{
  // Ensure that required surface formats are supported on machine.
  if (surface_format_is_supported(TENSOR_FORMAT) == false)
  {
    room_goto(RM_NotSupported);
    return;
  }
  
}