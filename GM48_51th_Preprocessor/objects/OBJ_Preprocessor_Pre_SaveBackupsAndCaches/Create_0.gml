/// @desc 


self.pendingRequests = ds_map_create();


// Create backups for files, which were reprocessed.
// -> Previously sanity check on original contents have been made.
DebugTimingPush();
array_foreach(PRE_FILES_REPROCESS, function(_file, _index)
{
  var _ext = filename_ext(_file.name);
  var _backupExt = (_ext == ".vsh")
    ? ".backup_vsh"
    : ".backup_fsh";
  
  // Replace the old backup with new one.
  var _backupName = filename_change_ext(_file.name, _backupExt);
  var _backupPath = filename_change_ext(_file.path, _backupExt);
  var _backup = _file.root.files[$ _backupName];
  
  var _request = buffer_save_async(_file.buffer, _backupPath, 0, -1);
  self.pendingRequests[? _request] = _file;
});


// Save the done work to the caches.
array_foreach(PRE_FILES_REPROCESS, function(_file, _index)
{
  var _ext = filename_ext(_file.name);
  var _cacheExt = (_ext == ".vsh")
    ? ".cache_vsh"
    : ".cache_fsh";
  
  var _cacheName = filename_change_ext(_file.name, _cacheExt);
  var _cachePath = filename_change_ext(_file.path, _cacheExt);
  var _request = buffer_save_async(_file.processed, _cachePath, 0, -1);
  self.pendingRequests[? _request] = _file
});




