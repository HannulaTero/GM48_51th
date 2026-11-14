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
  // var _rhsArray = [
  //   7, 1, 9, 5, 
  //   5, 8, 4, 3, 
  //   8, 2, 3, 7, 
  //   0, 6, 8, 9
  // ];
  
  
  // MP
  var _rhsArray = [
    7, 5, 8, 0, 
    1, 8, 2, 6,
    9, 4, 3, 8,
    5, 3, 7, 9
  ];
  
  // OP
  var _test = [
    96,  68, 69,  69,
    24,  56, 18,  52,
    58,  95, 71,  92,
    90, 107, 81, 142
  ];
   
  
  self.lhs.ArrayPull(_lhsArray);
  self.rhs.ArrayPull(_rhsArray);
  
  // self.rhs.ArrayPull();
  
  // self.dst.OpMatMul(self.lhs, self.rhs, 4);
  self.dst.OpTensorMul(self.lhs, self.rhs, [ 0 ], [ 1 ]);
  
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




