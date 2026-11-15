

// What is the tensor data-format in GPU and CPU.
#macro TENSOR_FORMAT  surface_r32float
#macro TENSOR_DTYPE   buffer_f32
#macro TENSOR_DSIZE   buffer_sizeof(TENSOR_DTYPE)


// What tensor is being the rendering target
#macro TENSOR_TARGET \
  global.gTENSOR_TARGET 
  global.gTENSOR_TARGET = undefined;


// No operation - empty function.
#macro NO_OP \
  function() { }