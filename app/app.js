var express = require('express');
var app = express();

app.get('/', function(req, res){
  res.send('Hello World expressjs');
});


app.listen(3000);
console.log('Listening on port 3000');
