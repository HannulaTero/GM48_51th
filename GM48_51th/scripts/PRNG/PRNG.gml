

/**
* Creates lookup-table for pseudo-random numbers.
* This is used to fill up the tensors.
*/ 
function PRNG()
{
  // Preparations.
  static layout = [ 1024, 1024 ];
  static count  = layout[0] * layout[1];
  static bytes  = count * TENSOR_DSIZE;
  static buffer = buffer_create(bytes, buffer_fixed, 1);
  static tensor = new Tensor(layout, false);
  static initialized = false;
  
  
  // Create pnrg-table CPU side.
  if (initialized == false)
  {
    PRNG.initialized = true;
    
    // I think using local variable is faster than static one.
    var _buffer = buffer; 
    buffer_seek(_buffer, buffer_seek_start, 0);
    repeat(count)
    {
      buffer_write(_buffer, TENSOR_DTYPE, random(1.0));
    }
    buffer_seek(_buffer, buffer_seek_start, 0);
  }
  
  // Push pnrg-table to GPU if it doesn't exist.
  if (tensor.Exists() == false)
  {
    tensor.BufferPull(buffer);
  }
  
  // Return the PRNG-tensor.
  return tensor;
}


