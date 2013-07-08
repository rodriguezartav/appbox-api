module.exports = (app) =>
  app.policies = 

    users:
      "*" : 'block'
      "update": "authenticated"
      "find": ["authenticated", "allow"]
      "approve": "authenticated"
      
    "*":
      "*" : "allow"