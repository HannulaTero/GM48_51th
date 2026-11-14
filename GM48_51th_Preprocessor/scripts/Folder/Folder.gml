

/**
* Represents a folder.
* 
* @param {Struct.Folder}  _root
* @param {String}         _name
* @param {String}         _path
*/ 
function Folder(_root, _name, _path) constructor
{
  // What is root-folder this folder belongs to.
  self.root = _root;
  
  // What is folder name.
  self.name = _name;
  
  // What is folder path, including the name.
  self.path = _path;
  
  // What folders the folder contains.
  self.folders = { };
  
  // What files the folder contains.
  self.files = { };
}