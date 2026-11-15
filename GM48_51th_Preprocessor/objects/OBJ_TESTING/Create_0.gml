/// @desc 
DebugTimingPush();

self.initialized = false;
ROOT = new Folder(
  undefined,
  @"GM48_51th",
  @"C:\Users\tero_\files\github\GM48_51th\GM48_51th"
);


DebugTimingPush();
CrawlFoldersAndFiles(ROOT);
DebugTimingPop("Crawled files & folders in : {0} ms");


DebugTimingPush();
FindFiletypes(ROOT, SHADER_FILES);
DebugTimingPop("Searched specific file-types: {0} ms");
