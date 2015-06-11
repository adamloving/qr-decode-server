Canvas = require 'canvas'
Image = Canvas.Image
qrcode = require('jsqrcode')(Canvas)

fileName = __dirname + '/fixtures/image-with-qrcode.jpg'

image = new Image()

image.onerror = ->
  console.log 'error', arguments

image.onload = ->
  console.log 'onload'
  try
    result = qrcode.decode(image);
    console.log 'found qr code: ' + result;
  catch e
    console.log 'unable to read qr code';

image.src = fileName

setTimeout process.exit, 10000