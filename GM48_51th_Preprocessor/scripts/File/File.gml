

/**
* Represents a file.
* 
* @param {Struct.Folder}  _root
* @param {String}         _name
* @param {String}         _path
*/ 
function File(_root, _name, _path) constructor
{
  // What is root-folder this file belongs to.
  self.root = _root;
  
  // What is file name, including extension.
  self.name = _name;
  
  // What is file path, including the name.
  self.path = _path;
}