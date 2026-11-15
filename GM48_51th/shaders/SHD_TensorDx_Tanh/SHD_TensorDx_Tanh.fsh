//=============================================================
#pragma import(OpUnary)
//=============================================================

float Operation(float src)
{
  float tempA = exp(src);
  float tempB = exp(-src);
  float tempC = (2.0 / (tempA + tempB));
  return (tempC * tempC);
}

//=============================================================