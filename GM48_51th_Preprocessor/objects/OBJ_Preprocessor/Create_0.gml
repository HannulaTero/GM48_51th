/// @desc 


window_set_position(0, 0);
show_debug_message($"\n\n");
show_debug_message(string_repeat("=", 32));
show_debug_message($"\n\n\n");


// What action shoud be taken next.
var _operation = undefined;


// Go through the parameters.
var _count = parameter_count();
for(var i = 0; i < _count; i++)
{
  switch(parameter_string(i))
  {
    case "--path" : {
      if (i >= _count)
      {
        throw("No path-parameter.");
      }
      PATH_ROOT = parameter_string(++i);
      break;
    }
    
    case "--clean" : {
      _operation = OBJ_Preprocessor_Clean;
      break;
    }
    
    case "--post" : {
      _operation = OBJ_Preprocessor_Post_LoadBackups;
      break;
    }
    
    case "--pre" : {
      _operation = OBJ_Preprocessor_Pre_LoadShaderFiles;
      break;
    }
    
    default: {
      break;
    }
  }
}


// Check whether there are any operations to do.
if (_operation == undefined)
{
  show_debug_message("[Preprocessor] No action was given!");
  game_end();
  exit;
}


// Crawl out the root.
PATH_ROOT = @"C:\Users\tero_\files\github\GM48_51th\GM48_51th";
show_debug_message($"Root folder : {PATH_ROOT}");
ROOT = new Folder(
  undefined, 
  filename_name(PATH_ROOT), 
  PATH_ROOT
);


DebugTimingPush();
CrawlFoldersAndFiles(ROOT);
DebugTimingPop("Crawled files & folders in : {0} ms");


DebugTimingPush();
FindFiletypes(ROOT, SHADER_FILES);
DebugTimingPop("Searched specific file-types: {0} ms");


// Start the operation.
instance_create_depth(0, 0, 0, _operation);
instance_destroy();
exit;




