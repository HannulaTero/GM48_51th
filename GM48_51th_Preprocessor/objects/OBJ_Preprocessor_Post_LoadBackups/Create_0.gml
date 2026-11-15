/// @desc START LOADING ALL SHADERS.

BACKUPS = array_concat(
  SHADER_FILES[$ "backup_vsh"], 
  SHADER_FILES[$ "backup_fsh"],
);

// Start loading every shader to RAM.
DebugTimingPush();

self.pendingRequests = ds_map_create();

array_foreach(BACKUPS, function(_backup, _index)
{
  _backup.buffer = buffer_create(1, buffer_grow, 1);
  _backup.request = buffer_load_async(
    _backup.buffer, _backup.path, 0, -1
  );
  self.pendingRequests[? _backup.request] = _backup;
});
