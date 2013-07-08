module.exports = (req,res) ->
  res.status 500
  res.send "Route Undefined"
  return false