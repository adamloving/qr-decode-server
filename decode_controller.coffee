Decoder = require './decoder'
Busboy  = require 'busboy'
streamToBuffer = require 'stream-to-buffer'

module.exports = class DecodeController

  @post: (req, res) ->
    fileData = null
    busboy = new Busboy(headers: req.headers)

    busboy.on 'file', (fieldname, stream, filename, encoding, mimetype) ->
      console.log 'File', fieldname, filename, encoding, mimetype
      streamToBuffer stream, (err, buffer) ->
        if err 
          res.send status: 'fail', error: err
          return
        else
          fileData = buffer

    busboy.on 'finish', ->
      if fileData
        Decoder.decode "data:image/png;base64,#{fileData.toString('base64')}", 
          (err, decodedValue) ->
            if err 
              res.send status: 'fail', error: err.message
              return
            else
              res.send
                status: 'success'
                result: decodedValue
      else
        res.send
          status: 'fail'
          error: 'No file posted'

    req.pipe(busboy)    
