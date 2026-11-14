


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
  static Verify     = __Tensor__Verify;
  
  // Operations : Scalar.
  static OpSetOne     = __Tensor__OpSetOne;
  static OpSetScalar  = __Tensor__OpSetScalar;
  static OpSetZero    = __Tensor__OpSetZero;
  
  // Operations : Unary.
  
  // Operations : Binary.
  
  
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
  
  // Fill the surface meta-data.
  self.surfaceMeta[0] = self.surfaceTexels[0];
  self.surfaceMeta[1] = self.surfaceTexels[1];
  self.surfaceMeta[2] = self.surfaceLayout[0];
  self.surfaceMeta[3] = self.itemCount;
  
  
  
  #endregion 
  // 
  //=============================================================
}





