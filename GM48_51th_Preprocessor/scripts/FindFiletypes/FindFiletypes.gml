

/**
* Recursively finds all files with filetypes in results-struct.
* The struct needs to be initialized with filetypes like "gml : [ ]"
* 
* Root-folder must be crawled first by CrawlFoldersAndFiles!
* 
* @param {Struct.Folder}  _root
* @param {Struct}         _results
*/ 
function FindFiletypes(_folder, _results={ })
{
  // Check all files.
  with _results struct_foreach(_folder.files, function(_name, _file)
  {
    // Get the extension name, without the dot "." 
    var _ext = string_delete(filename_ext(_file.name), 1, 1);
    if (struct_exists(self, _ext) == true)
    {
      array_push(self[$ _ext], _file);
    }
  });
  
  
  // Crawl all folders.
  with _results struct_foreach(_folder.folders, function(_name, _folder)
  {
    FindFiletypes(_folder, self);
  });
  
  
  return _results;
}
