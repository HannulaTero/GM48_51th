

/**
* Returns time taken in milliseconds.
* 
* @param {String} _message Put {0} where you want the time.
*/ 
function DebugTimingPop(_message=undefined)
{
  static timer = DebugTimingPush.timer;
  
  var _timeEnd = get_timer();
  var _timeStart = array_pop(timer);
  var _time = (_timeEnd - _timeStart) / 1000;
  
  if (_message != undefined)
  {
    show_debug_message(_message, _time)
  }
  
  return _time;
}
