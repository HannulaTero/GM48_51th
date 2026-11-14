/// @desc 


// 
GameInitialize();


// Ensure the game window has properly initialized etc.
call_later(5, time_source_units_frames, function()
{
  // Do rest of settings.
  
  INITIALIZE_COLD_BOOTUP = false
  room_goto(RM_Gameplay);
});