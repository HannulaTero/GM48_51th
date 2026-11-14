//=============================================================
#pragma shady: inline(SHD_TensorOp_Unary.BODY)
//=============================================================

float Operation(float src)
{
  // Warning! Possible NaN if not careful!
  return (1.0 / src);
}

//=============================================================