express = require "express"
http = require "http"
mongoose = require "mongoose"
connectMongo = require("connect-mongo")(express)

config = require "./config"
routes = require "./routes"
models = require "./models"

sessionStore = new connectMongo({ url: config.mongodb })

# connect the database
mongoose.connect config.mongodb

# create app, server, and web sockets
app = express()
server = http.createServer(app)

sessionConfig =
  key: "connect.sid"
  secret: config.sessionSecret
  store: sessionStore

# app setup
app.configure ->
  app.set "port", process.env.PORT or 1337
  app.use express.favicon()
  app.use express.logger(config.loggerFormat)
  app.use express.json()
  app.use express.urlencoded()
  app.use express.methodOverride()
  app.use express.cookieParser(config.sessionSecret)
  app.use express.session(sessionConfig)
  app.use app.router
  app.use express.errorHandler()  if config.useErrorHandler


# API routes
sendJson = (req, res) ->
  res.json res.jsonData

app.get "/api/food", routes.api.food.list
app.get "/api/food/:type", routes.api.food.listByType
#app.put "/api/food/:foodId", routes.api.food.add
#app.post "/api/food/", routes.api.food.update
#app.del "/api/food/:foodId", routes.api.food.remove

# CRON
app.get "/cron/all", routes.cron.kalorietabel.all

app.get "/cron/fruits", routes.cron.kalorietabel.fruits
app.get "/cron/vegetables", routes.cron.kalorietabel.vegetables
app.get "/cron/beans", routes.cron.kalorietabel.beans
app.get "/cron/maize", routes.cron.kalorietabel.maize
app.get "/cron/nut", routes.cron.kalorietabel.nut
app.get "/cron/fish", routes.cron.kalorietabel.fish

app.get "/cron/meat", routes.cron.kalorietabel.meat
app.get "/cron/poultry", routes.cron.kalorietabel.poultry
app.get "/cron/dairy", routes.cron.kalorietabel.dairy
app.get "/cron/fats", routes.cron.kalorietabel.fats
app.get "/cron/candy", routes.cron.kalorietabel.candy
app.get "/cron/drinks", routes.cron.kalorietabel.drinks

app.all "/api/*", sendJson

# Server setup
server.listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")