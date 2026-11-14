


/**
* "Multi-dimensional array", data is stored in surface, which is 2D.
* So there can be padding.
* 
* @param {Array<Real>}  _shape
* @param {Bool}         _hasGrad
*/ 
function Tensor(_shape, _hasGrad=false) constructor 
{
  //=============================================================
  // 
  #region STATIC METHODS.
  
  
  // General methdos.
  static BufferPull = __Tensor__BufferPull;
  static BufferPush = __Tensor__BufferPush;
  static Exists     = __Tensor__Exists;
  static Free       = __Tensor__Free;
  static GetSurface = __Tensor__GetSurface;
  static GetTexture = __Tensor__GetTexture;
  static MatchShape = __Tensor__MatchShape;
  static MatchSize  = __Tensor__MatchSize;
  static Verify     = __Tensor__Verify;
  
  // Operations : Scalar.
  static OpSetOne     = __Tensor__OpSetOne;
  static OpSetScalar  = __Tensor__OpSetScalar;
  static OpSetZero    = __Tensor__OpSetZero;
  
  // Operations : Unary.
  static OpAbs        = __Tensor__OpAbs;
  static OpCeil       = __Tensor__OpCeil;
  static OpCos        = __Tensor__OpCos;
  static OpDecr       = __Tensor__OpDecr;
  static OpExp        = __Tensor__OpExp;
  static OpFloor      = __Tensor__OpFloor;
  static OpFrac       = __Tensor__OpFrac;
  static OpIncr       = __Tensor__OpIncr;
  static OpInv        = __Tensor__OpInv;
  static OpLog        = __Tensor__OpLog;
  static OpLog10      = __Tensor__OpLog10;
  static OpLog2       = __Tensor__OpLog2;
  static OpNeg        = __Tensor__OpNeg;
  static OpNot        = __Tensor__OpNot;
  static OpRelu       = __Tensor__OpRelu;
  static OpReluLeaky  = __Tensor__OpReluLeaky;
  static OpRound      = __Tensor__OpRound;
  static OpSet        = __Tensor__OpSet;
  static OpSigmoid    = __Tensor__OpSigmoid;
  static OpSign       = __Tensor__OpSign;
  static OpSignSoft   = __Tensor__OpSignSoft;
  static OpSilu       = __Tensor__OpSilu;
  static OpSin        = __Tensor__OpSin;
  static OpSqr        = __Tensor__OpSqr;
  static OpSqrt       = __Tensor__OpSqrt;
  static OpStep       = __Tensor__OpStep;
  static OpTan        = __Tensor__OpTan;
  static OpTanh       = __Tensor__OpTanh;
  static OpTruthy     = __Tensor__OpTruthy;
  
  // Operations : Binary.
  static OpAdd  = __Tensor__OpAdd;
  static OpDiv  = __Tensor__OpDiv;
  static OpEq   = __Tensor__OpEq;
  static OpGt   = __Tensor__OpGt;
  static OpGtEq = __Tensor__OpGtEq;
  static OpLt   = __Tensor__OpLt;
  static OpLtEq = __Tensor__OpLtEq;
  static OpMax  = __Tensor__OpMax;
  static OpMean = __Tensor__OpMean;
  static OpMin  = __Tensor__OpMin;
  static OpMod  = __Tensor__OpMod;
  static OpMul  = __Tensor__OpMul;
  static OpNtEq = __Tensor__OpNtEq;
  static OpPow  = __Tensor__OpPow;
  static OpSub  = __Tensor__OpSub;
  
  
  #endregion
  // 
  //=============================================================
  // 
  #region DECLARE STATIC VARIABLES.
  
  
  #endregion
  // 
  //=============================================================
  // 
  #region DECLARE VARIABLES.
  
  // The dimensions of tensor.
  self.shape = variable_clone(_shape);
  
  // Whether tensor should have gradient or not.
  self.hasGrad = _hasGrad;
  
  // The gradients of the tensor.
  self.grad = (self.hasGrad)
    ? new Tensor(_shape, false)
    : undefined;
  
  // The amount of dimensions.
  self.rank = array_length(self.shape);
  
  // How much have to jump to get next dimension.
  self.stride = array_create(self.rank);
  
  // The amount of elements in tensor.
  self.itemCount = 1;
  
  // GPU data, stored in 2D surface.
  self.surface = undefined;
  
  // The surface layout.
  self.surfaceLayout = [ 1, 1 ];
  
  // The surface texels.
  self.surfaceTexels = [ 1, 1 ];
  
  // The surface capacity.
  // -> The 2D layout might not map 1-to-1 with tensor shape,
  //    so there might be padding. The capacity tells true count.
  self.surfaceCapacity = 1;
  
  // The surface meta-data.
  // -> Stored in array, so it is easier to pass to shader.
  // [ texel.x, texel.y, surface.width, itemCount ]
  self.surfaceMeta = [ 1, 1, 1, 1 ];
  
  
  #endregion
  // 
  //=============================================================
  // 
  #region DEFINE VARIABLES.
  
  
  // Calculate the tensor related meta-data.
  for(var i = 0; i < self.rank; i++)
  {
    self.stride[i] = self.itemCount;
    self.itemCount *= self.shape[i];
  }
  
  // Calculate surface layout.
  self.surfaceLayout[0] = ceil(sqrt(self.itemCount));
  self.surfaceLayout[1] = ceil(self.itemCount / self.surfaceLayout[0]);
  
  // Pre-calculate texel sizes.
  self.surfaceTexels[0] = (1.0 / self.surfaceLayout[0]);
  self.surfaceTexels[1] = (1.0 / self.surfaceLayout[1]);
  
  // Update surface capacity.
  self.surfaceCapacity = self.surfaceLayout[0] * self.surfaceLayout[1];
  
  // Fill the surface meta-data.
  self.surfaceMeta[0] = self.surfaceTexels[0];
  self.surfaceMeta[1] = self.surfaceTexels[1];
  self.surfaceMeta[2] = self.surfaceLayout[0];
  self.surfaceMeta[3] = self.itemCount;
  
  
  
  #endregion 
  // 
  //=============================================================
}





