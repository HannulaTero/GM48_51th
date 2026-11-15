/// @desc 


self.filesShader = array_concat(
  SHADER_FILES[$ "vsh"], 
  SHADER_FILES[$ "fsh"]
);


DebugTimingPush();
array_foreach(self.filesShader, function(_file, _index)
{
  // Calculate the hash.
  _file.hash = buffer_md5(_file.buffer, 0, buffer_get_size(_file.buffer));
  _file.cache = undefined;
  
  
  // Check whether cache exists.
  var _cacheName = (_file.name + ".cache");
  var _cacheFile = _file.root.files[$ _cacheName];
  if (_cacheFile == undefined)
  {
    array_push(PRE_FILES_REPROCESS, _file);
    return;
  }
  
  
  // Read the hash of the file.
  // It is the comment of first line
  // Example: "// 5eb63bbbe01eeed093cb22bb8f5acdc3"
  static sizeMD5 = 32;
  static expectedSize = (sizeMD5 + 3);
  static tempBuffer = buffer_create(sizeMD5, buffer_fixed, 1);
  
  if (buffer_get_size(_cacheFile.buffer) < expectedSize)
  {
    array_push(PRE_FILES_REPROCESS, _file);
    return;
  }
  
  buffer_copy(_cacheFile.buffer, 3, sizeMD5, tempBuffer, 0);
  var _cacheHash = buffer_peek(_cacheFile.buffer, 0, buffer_text);
  
  
  // Compare the hashes.
  if (_file.hash != _cacheHash)
  {
    array_push(PRE_FILES_REPROCESS, _file);
    return;
  }
  
  
  // Cache is valid.
  _file.cache = _cacheFile;
  array_push(PRE_FILES_READY, _file);
});
DebugTimingPop("Checked caches in {0} ms");


// Read the sources for files, which need reprocessing.
DebugTimingPush();
array_foreach(PRE_FILES_REPROCESS, function(_file, _index)
{
  _file.source = buffer_peek(_file.buffer, 0, buffer_text);
});
DebugTimingPop("Read sources for files needing reprocessing, in {0} ms");


// Move to the next operation.
instance_create_depth(0, 0, 0, OBJ_Preprocessor_Pre_HandleImports);
instance_destroy();
exit;


