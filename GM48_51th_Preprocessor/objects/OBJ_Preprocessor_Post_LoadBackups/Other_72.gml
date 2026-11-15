/// @desc 

var _id = async_load[? "id"];
var _backup = self.pendingRequests[? _id];
if (_backup == undefined)
{
  exit;
}


ds_map_delete(self.pendingRequests, _id);


var _status = async_load[? "status"];
if (_status == false)
{
  show_debug_message($"Loading backup: {_backup.name} failed! Try cleaning!");
  buffer_delete(_backup.buffer);
  _backup.buffer = undefined;
  exit;
}

