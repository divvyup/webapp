var express = require('express')
var serveStatic = require('serve-static')

var app = express()

app.use(serveStatic('dist', {'index': ['index.html']}))

app.use(function(req, res) {
  res.sendFile(__dirname + '404.html')
})

app.listen(3075)