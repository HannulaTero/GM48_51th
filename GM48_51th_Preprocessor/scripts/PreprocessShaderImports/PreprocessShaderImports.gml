

/**
* Preprocess the source-string with given imports.
* 
* @param {String} _source
* @param {Struct} _mapping
*/ 
function PreprocessShaderImports(_source, _mapping={ })
{  
  while(true)
  {
    // Whether no imports are found anymore.
    var _pos = string_pos(IMPORT_KEYWORD, _source);
    if (_pos <= 0)
    {
      break;
    }
    
    // Read what is being imported.
    var _lhs    = string_pos_ext("(", _source, _pos) + 1;
    var _rhs    = string_pos_ext(")", _source, _lhs);
    var _count  = (_rhs - _lhs);
    var _label  = string_copy(_source, _lhs, _count);
    
    var _import = _mapping[$ _label];
    if (_import == undefined)
    {
      throw($"Couldn't find import for : {_label}");
    }
    
    // Replace with importable.
    _count = (_rhs - _pos + 1);
    _source = string_delete(_source, _pos, _count);
    _source = string_insert("\n", _source, _pos);
    _source = string_insert(_import, _source, _pos);
  }
  
  return _source;
}