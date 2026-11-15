

#macro IMPORT_KEYWORD \
  "#pragma import"
  
  
#macro MARKER \
  "// <!AUTO-GENERATED!> : "


#macro PATH_ROOT \ 
  global.gPATH_ROOT
  global.gPATH_ROOT = undefined;


#macro ROOT \
  global.gROOT
  global.gROOT = new Folder(undefined, "", "");


#macro SHADER_FILES \ 
  global.gSHADER_FILES
  global.gSHADER_FILES = {
    // Actual shader files.
    "vsh" : [ ],
    "fsh" : [ ],
    
    // Caches of edited shader files.
    "cache_vsh" : [ ], 
    "cache_fsh" : [ ], 
    
    // Untouched backup-files.
    "backup_vsh" : [ ], 
    "backup_fsh" : [ ], 
    
    // Shader function etc. imports.
    "import_vsh" : [ ], 
    "import_fsh" : [ ], 
    "import_shader" : [ ], 
  };
  

// Files which have valid and preprocessed cache, which can be set.
#macro PRE_FILES_READY \
  global.gPRE_FILES_READY 
  global.gPRE_FILES_READY = [ ];
  

// Files which are missing a valid cache, files which need to be preprocessed.
#macro PRE_FILES_REPROCESS \
  global.gPRE_FILES_REPROCESS 
  global.gPRE_FILES_REPROCESS = [ ];


// Importable shader codes / functions.
#macro PRE_IMPORT_MAPPING \
  global.gPRE_IMPORT_MAPPING 
  global.gPRE_IMPORT_MAPPING = { 
    vsh : { },
    fsh : { }
  };


// The list of backups.
#macro BACKUPS \
  global.gBACKUPS
  global.gBACKUPS = [ ];
  

