express    = require 'express'
http       = require 'http'
bodyParser = require 'body-parser'

EncodeController = require './encode_controller'
DecodeController = require './decode_controller'

app = express()

app.set('port', process.env.PORT || 3012)
app.use(bodyParser.text());

app.all '*', (req, res, next) ->
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS')
  res.header('Access-Control-Allow-Headers', 'Content-Type')
  next()

app.get '/', (req, res) -> res.send status: 'success'
app.post '/encode', EncodeController.post
app.post '/decode', DecodeController.post
process.env.PORT = process.env.PORT || 3011
process.env.NODE_ENV = process.env.NODE_ENV || 'development'

server = http.createServer(app).listen process.env.PORT, ->
  console.log "Listening on port #{process.env.PORT}"
  console.log "Environment is #{process.env.NODE_ENV}"

