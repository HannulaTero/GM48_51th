

/**
* 
*/ 
function DebugTimingPush()
{
  static timer = [ ];
  array_push(timer, get_timer());
}
