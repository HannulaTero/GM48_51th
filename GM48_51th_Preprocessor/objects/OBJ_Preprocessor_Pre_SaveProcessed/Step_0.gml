/// @desc CHECK WHETHER ALL BUFFERS HAVE LOADED.

if (ds_map_size(self.pendingRequests) > 0)
{
  exit;
}

DebugTimingPop("Saved procseed files : {0} ms");
ds_map_destroy(self.pendingRequests);

// Finished!
show_debug_message("Preprocessing has Finished!");
game_end();
exit;


