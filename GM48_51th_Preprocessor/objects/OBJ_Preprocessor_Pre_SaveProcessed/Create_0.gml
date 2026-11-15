/// @desc 


self.pendingRequests = ds_map_create();


// Save the processed files.
DebugTimingPush();
array_foreach(PRE_FILES_READY, function(_file, _index)
{
  var _request = buffer_save_async(_file.processed, _file.path, 0, -1);
  self.pendingRequests[? _request] = _file;
});




