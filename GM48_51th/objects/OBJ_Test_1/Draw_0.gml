/// @desc 

if (keyboard_check_pressed(vk_space) == true)
{
  // MO 
  var _lhsArray = [
    5, 2, 6, 1, 
    0, 6, 2, 0,
    3, 8, 1, 4,
    1, 8, 5, 6
  ];
  
  // MP
  var _rhsArray = [
    7, 1, 9, 5, 
    5, 8, 4, 3, 
    8, 2, 3, 7, 
    0, 6, 8, 9
  ];
   
  
  self.lhs.ArrayPull(_lhsArray);
  self.rhs.ArrayPull(_rhsArray);
  self.dst.Forward();
  
  self.dst.grad.OpScalarSetOne();
  self.dst.Backward();
  
  var _result = self.dst.ArrayPush();
  
  
  show_debug_message(_test);
  show_debug_message(_result);
  show_debug_message(array_equals(_test, _result));
  
  array_sort(_test, true);
  array_sort(_result, true);
  
  show_debug_message(_test);
  show_debug_message(_result);
  show_debug_message(array_equals(_test, _result));
}




