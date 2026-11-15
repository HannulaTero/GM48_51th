

/**
* Reshapes the GPU data.
* -> Doesn't free the previous GPU data.
* -> The Verify will recreate it whenever trying to access surface.
* 
* @context Tensor
* @param {Array<Real>} _shape   Tensor shape (ND).
* @param {Array<Real>} _layout  Surface layout (2D), how data is stored - Suggestion!
* @returns {Struct.Tensor}
*/ 
function __Tensor__Reshape(_shape, _layout=undefined)
{
  // Initialize the tensor metadata.
  self.shape      = variable_clone(_shape);
  self.rank       = array_length(_shape);
  self.itemCount  = 1;
  array_resize(self.stride, self.rank);
  
  
  // Calculate the tensor related meta-data.
  for(var i = 0; i < self.rank; i++)
  {
    self.stride[i] = self.itemCount;
    self.itemCount *= self.shape[i];
  }
  
  
  // Update the gradient shape.
  if (self.grad != undefined)
  {
    self.grad.Reshape(self.shape);
  }
  
  
  // Calculate surface layout and update metadata.
  if (_layout == undefined)
  {
    self.surfaceLayout[0] = ceil(sqrt(self.itemCount));
    self.surfaceLayout[1] = ceil(self.itemCount / self.surfaceLayout[0]);
  }
  else if (is_array(_layout) == true)
  {
    if (self.itemCount <= (_layout[0] * _layout[1]))
    {
      self.surfaceLayout[0] = _layout[0];
      self.surfaceLayout[1] = _layout[1];
    }
    else
    {
      self.surfaceLayout[0] = ceil(sqrt(self.itemCount));
      self.surfaceLayout[1] = ceil(self.itemCount / self.surfaceLayout[0]);
    }
  }
    
  
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
  
  
  return self;
}