###
Module dependencies.
###
express = require("express")
http = require("http")
path = require("path")
app = express()


Hapi = require("hapi")

# all environments
app.set "port", process.env.PORT or 9012
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use Hapi.Util.HapiRequest
app.use Hapi.Util.HapiPolicy
app.use app.router


# development only
app.use express.errorHandler()  if "development" is app.get("env")

app.get "/" , (req,res) ->
  res.send 200

Hapi.Util.LoadControllers.load( app, "#{__dirname}/controllers")
Hapi.Util.LoadPolicies.load( app, "#{__dirname}/policies")

console.log app.routes

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")


module.exports = app
