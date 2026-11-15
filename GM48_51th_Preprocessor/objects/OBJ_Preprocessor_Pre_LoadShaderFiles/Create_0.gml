/// @desc START LOADING ALL SHADERS.


// Start loading every shader to RAM.
DebugTimingPush();

self.pendingRequests = ds_map_create();

struct_foreach(SHADER_FILES, function(_key, _array)
{
  static functor = function(_file, _index)
  {
    _file.buffer = buffer_create(1, buffer_grow, 1);
    _file.request = buffer_load_async(_file.buffer, _file.path, 0, -1);
    self.pendingRequests[? _file.request] = _file;
  };
  
  array_foreach(_array, functor);
});
