//=============================================================
#pragma import(OpUnary)
//=============================================================

float Operation(float src)
{
  float tempA = exp(-src);
  float tempB = (tempA + 1.0);
  float tempC = (tempB * tempB);
  return (tempA / tempC);
}

//=============================================================