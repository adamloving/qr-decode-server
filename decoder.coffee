Canvas = require 'canvas'
Image = Canvas.Image
qrcode = require('jsqrcode')(Canvas)

module.exports = class Decoder

  # imageSrc can be either URL, local path name, or 
  # "data:image/png;base64,..." string
  @decode: (imageSrc, callback) ->
    image = new Image()

    image.onerror = ->
      console.log 'error', arguments
      callback(arguments[0])

    image.onload = ->
      console.log 'onload'
      try
        result = qrcode.decode(image);
        console.log 'found qr code: ' + result
        callback(null, result)
      catch e
        console.log 'unable to read qr code', e
        callback(e)

    image.src = imageSrc
