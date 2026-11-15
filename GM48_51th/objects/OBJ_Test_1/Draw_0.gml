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
  show_debug_message(self.dst.ArrayPush());
  
  self.dst.grad.OpScalarSetOne();
  self.dst.Backward();
  
  show_debug_message(self.dst.grad.ArrayPush());
  show_debug_message(self.lhs.grad.ArrayPush());
  show_debug_message(self.rhs.grad.ArrayPush());
  
  Tensor_Workspace_Begin();
  var _tempA = Tensor_Workspace_Get(self.lhs.shape);
  var _tempB = Tensor_Workspace_Get(_tempA.shape);
  _tempA.OpPermuteMatrix(self.lhs, self.lhs.shape[0]);
  _tempB.OpPermuteMatrix(_tempA, _tempA.shape[0]);
  show_debug_message(self.lhs.ArrayPush());
  show_debug_message(_tempA.ArrayPush());
  show_debug_message(_tempB.ArrayPush());
  Tensor_Workspace_End();
}




