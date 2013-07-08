require "coffee-script"
should = require("should")
request = require("./support/http")

# start app server here 
app = require("../server/server")
app.listen 3000

# define server base URL

beforeEach ->
  # DB clear and re-init here

describe "API Test with SuperTest", ->
  it "GET / should return '200'", (done) ->
    response = request(app).get("/").expect(200)
    response.end (err, res) ->
      return done(err)  if err
      done()

describe "API Test with SuperTest", ->
  it "POST /users should return '200'", (done) ->
    response = request(app).get("/users/1").expect(200).expect("X-Powered-By", "Express")
    response.end (err, res) ->
      return done(err)  if err
      done()

describe "API Test with SuperTest", ->
  it "GET custom route /approve in users should return '200'", (done) ->
    response = request(app).get("/users/custom/approve").expect(200).expect("X-Powered-By", "Express")
    response.end (err, res) ->
      return done(err)  if err
      done()

describe "API Test with SuperTest", ->
  it "GET /login should return '404' not found", (done) ->
    response = request(app).get("/login").expect(404).expect("X-Powered-By", "Express")
    response.end (err, res) ->
      return done(err)  if err
      done()

describe "API Test with SuperTest", ->
  it "GET custom route /routeWithoutPolicy in users should return '500'", (done) ->
    response = request(app).get("/users/custom/routeWithoutPolicy").expect(500).expect("X-Powered-By", "Express")
    response.end (err, res) ->
      return done(err)  if err
      done()
