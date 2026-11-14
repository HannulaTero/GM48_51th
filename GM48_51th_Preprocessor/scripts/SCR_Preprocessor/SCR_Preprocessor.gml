

#macro PATH_ROOT \ 
  global.gPATH_ROOT
  global.gPATH_ROOT = undefined;


#macro ROOT \
  global.gROOT
  global.gROOT = new Folder(undefined, "", "");


#macro SHADER_FILES \ 
  global.gSHADER_FILES
  global.gSHADER_FILES = {
    "vsh" : [ ],
    "fsh" : [ ],
    "vsh.cache" : [ ], 
    "fsh.cache" : [ ], 
    "vsh.backup" : [ ], 
    "fsh.backup" : [ ], 
  };



