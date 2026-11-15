/// @desc CHECK WHETHER ALL HAVE BEEN SAVED.

if (ds_map_size(self.pendingRequests) > 0)
{
  exit;
}

DebugTimingPop("Returned backups : {0} ms");
ds_map_destroy(self.pendingRequests);

// Finished!
show_debug_message("Preprocessing has Finished!");
game_end();
exit;


