

// Whether game has just launched and starting.
// -> If game is restarted, then it is already "warm".
#macro INITIALIZE_COLD_BOOTUP \
  global.gINITIALIZE_COLD_BOOTUP
  global.gINITIALIZE_COLD_BOOTUP = true;




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