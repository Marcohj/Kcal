fs = require("fs")

# get the subdirectories
routeDirs = fs.readdirSync(__dirname)

# for each subdirectory, build an object to hold API routes or UI routes or whatever
i = 0

while i < routeDirs.length
  
  # should be like ['api', 'ui']
  routeDirName = routeDirs[i]
  routeDirPath = __dirname + "/" + routeDirName
  if fs.statSync(routeDirPath).isDirectory()
    
    # exports.ui = {}   <-- what happens
    routeTypeObject = exports[routeDirName] = {}
    
    # should be like ['users.js', 'todos.js']  <-- each represents a resource
    resourceFiles = fs.readdirSync(routeDirPath)
    
    # for each of these resource files, attach them to their route group
    j = 0

    while j < resourceFiles.length
      
      # raw filename like 'users.js'
      resourceFileName = resourceFiles[j]
      j++
      resourceFilePath = routeDirPath + "/" + resourceFileName
      
      # remove the file extension so it's just 'users'
      parts = resourceFileName.split(".")
      continue  unless parts[parts.length - 1] is "coffee" # skip non-javascript files
      resourceName = parts[0]
      
      # exports.ui.users = require('/Users/somebody/my_project/routes/ui/users.js')  <-- what happens
      routeTypeObject[resourceName] = require(resourceFilePath)
  i++