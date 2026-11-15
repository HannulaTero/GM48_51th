/// @desc START LOADING ALL SHADERS.

BACKUPS = array_concat(
  SHADER_FILES[$ "backup_vsh"], 
  SHADER_FILES[$ "backup_fsh"],
);

// Start loading every shader to RAM.
DebugTimingPush();

self.pendingRequests = ds_map_create();

array_foreach(BACKUPS, function(_file, _index)
{
  _file.buffer = buffer_create(1, buffer_grow, 1);
  _file.request = buffer_load_async(
    _file.buffer, _file.path, 0, -1
  );
  self.pendingRequests[? _file.request] = _file;
});
