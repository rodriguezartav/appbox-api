Hapi = require("node-hapi")

class Controller extends Hapi.ApiController

  @route = "users"

  constructor: ->
    super
    
  defineCustomRoutes: ->
    @app.get "/#{Controller.route}/custom/approve" , @approve
    @app.get "/#{Controller.route}/custom/routeWithoutPolicy" , @index
    
  index: (req,res) ->
    console.log "overwrite index"
    res.send 200
  
  approve: (req,res) ->
    res.send 200
  


module.exports = Controller


