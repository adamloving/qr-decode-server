fs     = require 'fs'
Canvas = require 'canvas'
Image  = Canvas.Image
qrcode = require('jsqrcode')(Canvas)

# TEST 1: Load from file
fileName = __dirname + '/fixtures/image-with-qrcode.jpg'

# image = new Image()

# image.onerror = -> console.log 'error', arguments

# image.onload = ->
#   console.log 'onload'
#   try
#     result = qrcode.decode(image);
#     console.log 'found qr code: ' + result
#   catch e
#     console.log 'unable to read qr code', e

# image.src = fileName

setTimeout process.exit, 10000

# TEST 2: BASE64 Encoded image
file = fs.readFileSync(fileName)

image1 = new Image()
image1.onerror = -> console.log 'image1 error', arguments
image1.onload = ->
  console.log 'image1', 'onload'
  try
    result = qrcode.decode(image1);
    console.log 'image1', 'found qr code: ' + result
  catch e
    console.log 'image1', 'unable to read qr code', e  

imageData = file.toString('base64')   
image1.src = "data:image/png;base64,#{imageData}"