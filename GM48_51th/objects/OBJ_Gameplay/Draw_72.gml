/// @desc 

if (keyboard_check(ord("Q")) == true)
{
  PRNG_Apply(self.dst);
  PRNG_Apply(self.lhs);
  PRNG_Apply(self.mhs);
  PRNG_Apply(self.rhs);
}


if (keyboard_check(ord("W")) == true)
{
  self.dst.OpSetScalar(mouse_x / room_width);
}


if (keyboard_check(ord("E")) == true)
{
  self.dst.OpAdd(self.lhs, self.rhs);
}


if (keyboard_check(ord("R")) == true)
{
  self.dst.OpSub(self.lhs, self.rhs);
}


if (keyboard_check(ord("T")) == true)
{
  self.dst.OpMul(self.lhs, self.rhs);
}


if (keyboard_check(ord("Y")) == true)
{
  self.dst.OpDiv(self.lhs, self.rhs);
}


if (keyboard_check(ord("U")) == true)
{
  self.dst.OpPow(self.lhs, self.rhs);
}


if (keyboard_check(ord("I")) == true)
{
  self.dst.OpMod(self.lhs, self.rhs);
}


if (keyboard_check(ord("O")) == true)
{
  self.dst.OpIncr(self.lhs);
}


if (keyboard_check(ord("P")) == true)
{
  self.dst.OpTruthy(self.lhs);
}


if (keyboard_check(ord("A")) == true)
{
  self.mhs.OpSub(self.lhs, self.rhs);
}


if (keyboard_check(ord("S")) == true)
{
  self.dst.OpAdd(self.mhs, self.rhs);
}


if (keyboard_check(ord("D")) == true)
{
  self.dst.OpMax(self.mhs, self.rhs);
}


if (keyboard_check(ord("F")) == true)
{
  self.dst.OpMin(self.mhs, self.rhs);
}


if (keyboard_check(ord("G")) == true)
{
  self.dst.OpMean(self.mhs, self.rhs);
}