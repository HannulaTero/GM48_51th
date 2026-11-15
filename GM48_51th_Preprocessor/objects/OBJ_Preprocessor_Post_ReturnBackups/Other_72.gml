/// @desc 

var _id = async_load[? "id"];
var _file = self.pendingRequests[? _id];
if (_file == undefined)
{
  exit;
}


ds_map_delete(self.pendingRequests, _id);


var _status = async_load[? "status"];
if (_status == false)
{
  show_debug_message($"Returning backup: {_file.name} failed!");
  show_debug_message($" -> Try cleaning!");
  exit;
}

