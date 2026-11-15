/// @desc 

self.filesImport = array_concat(
  SHADER_FILES[$ "import_vsh"], 
  SHADER_FILES[$ "import_fsh"],
  SHADER_FILES[$ "import_shader"]
);


// Create import-mapping.
DebugTimingPush();
array_foreach(self.filesImport, function(_file, _index)
{
  var _source = buffer_peek(_file.buffer, 0, buffer_text);
  var _name = filename_change_ext(_file.name, "");
  
  switch(filename_ext(_file.name))
  {
    case ".import_vsh": {
      PRE_IMPORT_MAPPING.vsh[$ _name] = _source;
      break;
    }
    case ".import_fsh": {
      PRE_IMPORT_MAPPING.fsh[$ _name] = _source;
      break;
    }
    case ".import_shader": {
      PRE_IMPORT_MAPPING.vsh[$ _name] = _source;
      PRE_IMPORT_MAPPING.fsh[$ _name] = _source;
      break;
    }
  }
});
DebugTimingPop("Created import-mappings in {0} ms");


// Preprocess each importables own imports.
// -> This is done to solve dependency-chains.
DebugTimingPush();
struct_foreach(PRE_IMPORT_MAPPING, function(_name, _mapping)
{
  with _mapping struct_foreach(_mapping, function(_name, _source)
  {
    self[$ _name] = PreprocessShaderImports(_source, self);
  });
});
DebugTimingPop("Import-mappings dependencies done in {0} ms");


// Preprocess the files which need reprocessing.
DebugTimingPush();
array_foreach(PRE_FILES_REPROCESS, function(_file, _index)
{
  var _ext = filename_ext(_file.name);
  var _type = string_delete(_ext, 1, 1);
  var _mapping = PRE_IMPORT_MAPPING[$ _type];
  _file.source = PreprocessShaderImports(_file.source, _mapping);
});
DebugTimingPop("Preprocessed the shaders in {0} ms");


// Move to the next operation.
instance_create_depth(0, 0, 0, OBJ_Preprocessor_Pre_);
instance_destroy();
exit;


