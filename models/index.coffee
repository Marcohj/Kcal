fs = require "fs"
mongoose = require "mongoose"

# get the subdirectories
modelFiles = fs.readdirSync(__dirname)
i = 0

while i < modelFiles.length
  parts = modelFiles[i].split(".")
  i++
  continue  unless parts[parts.length - 1] is "coffee" # skip non-js files
  
  # remove the extension so it's just 'user'
  modelName = parts[0]
  continue  if modelName is "index" # skip this file
  schema = require("./" + modelName)
  
  # uppercase first letter so it's User
  modelName = modelName.charAt(0).toUpperCase() + modelName.slice(1)
  
  # make the schema be UserSchema
  schemaName = modelName + "Schema"
  
  # load and export the model
  exports[schemaName] = schema
  exports[modelName] = mongoose.model(modelName, schema)