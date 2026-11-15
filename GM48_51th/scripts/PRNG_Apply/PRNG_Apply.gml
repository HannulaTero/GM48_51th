


/**
* Applies PRNG to the given tensor.
*/ 
function PRNG_Apply(_dst, _params={ })
{
  var _seed   = _params[$ "seed"]  ?? random(1.0);
  var _upper  = _params[$ "upper"] ?? 1.0;
  var _lower  = _params[$ "lower"] ?? 0.0;
  
  var _offset  = floor(_seed * _dst.itemCount);
  var _offsetX = (_offset mod _dst.surfaceLayout[0]);
  var _offsetY = (_offset div _dst.surfaceLayout[1]);
  var _prng = PRNG();
  
  GPU_SetState();
  GPU_SetShader(SHD_PRNG_Apply);
  GPU_SetUniform_Float2("FSH_Offset", _offsetX, _offsetY);
  GPU_SetUniform_Float2("FSH_Range", _lower, _upper);
  GPU_SetUniform_FloatN("FSH_PRNG_Meta", _prng.surfaceMeta);
  GPU_SetTarget(_dst);
  GPU_Dispatch_WholeSurface(_prng);
  GPU_EndTarget();
  GPU_EndShader();
  GPU_EndState();
}