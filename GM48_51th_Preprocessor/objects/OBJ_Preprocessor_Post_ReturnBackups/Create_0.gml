/// @desc START LOADING ALL SHADERS.

// Start loading every shader to RAM.
DebugTimingPush();

self.pendingRequests = ds_map_create();

array_foreach(BACKUPS, function(_file, _index)
{
  var _request = buffer_save_async(_file.buffer, _file.path, 0, -1);
  self.pendingRequests[? _request] = _file;
});
