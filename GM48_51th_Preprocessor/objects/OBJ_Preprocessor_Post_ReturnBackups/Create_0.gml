/// @desc START LOADING ALL SHADERS.

// Start loading every shader to RAM.
DebugTimingPush();

self.pendingRequests = ds_map_create();

array_foreach(BACKUPS, function(_backup, _index)
{
  var _backupExt = filename_ext(_backup.name);
  var _fileExt = (_backupExt == ".backup_vsh")
    ? ".vsh" : ".fsh";
  var _filePath = filename_change_ext(_backup.path, _fileExt);
  var _request = buffer_save_async(_backup.buffer, _filePath, 0, -1);
  self.pendingRequests[? _request] = _backup;
});
