/// @desc CHECK WHETHER ALL BUFFERS HAVE LOADED.

if (ds_map_size(self.pendingRequests) > 0)
{
  exit;
}

DebugTimingPop("Loaded backups to RAM in : {0} ms");
ds_map_destroy(self.pendingRequests);
instance_create_depth(0, 0, 0, OBJ_Preprocessor_Post_ReturnBackups);
instance_destroy();
exit;


