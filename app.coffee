express = require('express')
http = require('http')

DecoderController = require('./decoder_controller')

app = express()

app.set('port', process.env.PORT || 3012)
app.set('views', __dirname + '/src/app/views')
app.set('view engine', 'jade')

app.all '*', (req, res, next) ->
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS')
  res.header('Access-Control-Allow-Headers', 'Content-Type')
  next()

app.post '/decode', DecoderController.post
process.env.PORT = process.env.PORT || 3011
process.env.NODE_ENV = process.env.NODE_ENV || 'development'

server = http.createServer(app).listen process.env.PORT, ->
  console.log "Listening on port #{process.env.PORT}"
  console.log "Environment is #{process.env.NODE_ENV}"

