

/**
* Recursively finds all folders and files.
* 
* @param {Struct.Folder} _root
*/ 
function CrawlFoldersAndFiles(_root)
{
  // Preparations.
  var _path = _root.path;
  var _mask = $"{_path}\\*";
  var _files = _root.files;
  var _folders = _root.folders;
  
  
  // Iterate through files, map them out.
  {
    var _curr = file_find_first(_mask, fa_none);
    while(_curr != "")
    {
      var _file = new File(_root, _curr, $"{_path}/{_curr}");
      _files[$ _curr] = _file;
      _curr = file_find_next();
    }
    file_find_close();
  }
  
  
  // Iterate through whole folder, map out the folders.
  {
    var _curr = file_find_first(_mask, fa_directory);
    while(_curr != "")
    {
      if (struct_exists(_files, _curr) == false)
      {
        var _folder = new Folder(_root, _curr, $"{_path}/{_curr}");
        _folders[$ _curr] = _folder;
      }
      _curr = file_find_next();
    }
    file_find_close();
  }
  
  
  // Iterate through sub-folders.
  struct_foreach(_folders, function(_name, _folder)
  {
    CrawlFoldersAndFiles(_folder);
  });
  
  
  // Return the original root.
  return _root;
}



