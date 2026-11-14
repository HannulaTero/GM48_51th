/// @desc 

if (keyboard_check(ord("Q")) == true)
{
  PRNG_Apply(self.tensor);
}


if (keyboard_check(ord("W")) == true)
{
  self.tensor.OpSetScalar(mouse_x / room_width);
}