/// @desc 

self.filesCaches = array_concat(
  SHADER_FILES[$ "cache_vsh"], 
  SHADER_FILES[$ "cache_fsh"]
);


// Remove the caches.
array_foreach(self.filesCaches, function(_file, _index)
{
  file_delete(_file.path);
});


// Finished!
show_debug_message("Cleaning has Finished!");
show_debug_message("-> Removed the caches!");
show_debug_message("-> Loading back the backups!");

instance_create_depth(0, 0, 0, OBJ_Preprocessor_Post_LoadBackups);
instance_destroy();
exit;

