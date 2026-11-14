/// @desc 

ROOT = new Folder(
  undefined,
  @"GM48_51th",
  @"C:\Users\tero_\files\github\GM48_51th\GM48_51th"
);


DebugTimingPush();
CrawlFoldersAndFiles(ROOT);
DebugTimingPop("Crawled files & folders in : {0} ms");


instance_create_depth(0, 0, 0, OBJ_Preprocessor_Pre_LoadShaderFiles);
instance_destroy();