require('coffee-script');

var should = require('should'),
   request = require("./support/http")
 
 
// start app server here 
var app = require("../server/server")
app.listen(3000);
 
 
// define server base URL
var BASE_URL = "http://localhost:3000"
 
beforeEach(function(){
  // DB clear and re-init here
})
 
// run API test
describe("API Test with SuperTest", function(){
  it("GET / should return 'test'", function(done) {
    request(app)
      .get('/')
      .expect(200)
      //.expect('Content-Type', 'text/html; charset=utf-8')
      .expect('X-Powered-By', 'Express')
      .end( function(err, res){
        if (err)
          return done(err) // if response is 500 or 404 & err, test case will fail
        done();
      })
  });
 
 
 
})