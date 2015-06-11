Canvas = require 'canvas'
Image = Canvas.Image
qrcode = require('jsqrcode')(Canvas)

module.exports = class Decoder

  # TODO: Support buffer base64 encode?
  @decode: (fileName, callback) ->
    image = new Image()

    image.onerror = ->
      console.log 'error', arguments
      callback(arguments[0])

    image.onload = ->
      console.log 'onload'
      try
        result = qrcode.decode(image);
        console.log 'found qr code: ' + result;
        callback(null, result)
      catch e
        console.log 'unable to read qr code';
        callback(e)

    image.src = fileName
