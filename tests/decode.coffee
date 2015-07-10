fs     = require 'fs'
path   = require 'path'
Canvas = require 'canvas'
Image  = Canvas.Image
qrcode = require('jsqrcode')(Canvas)

fileName = path.join(__dirname, './fixtures/longer-screenshot.png')
file = fs.readFileSync(fileName)
imageData = file.toString('base64')   
imageSrc = "data:image/png;base64,#{imageData}"

image = new Image()
image.onerror = -> console.log 'image error', arguments
image.onload = ->
  console.log 'image', 'onload'
  ##try
  result = qrcode.decode(image);
  console.log 'image', 'found qr code: ' + result, '.'
  # catch e
  #   console.log 'image', 'unable to read qr code', e, e.message, e.stack  

image.src = imageSrc

