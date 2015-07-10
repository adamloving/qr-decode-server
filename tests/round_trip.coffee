fs = require 'fs'
path = require 'path'
Encoder = require 'qrcode'
Decoder = require '../decoder'

encodeAndDecode = (text) ->
  Encoder.toDataURL text, (err, url) ->
    if err
      console.log 'Error encoding', text, err
    else
      console.log "<img src=\"#{url}\"/>"
      Decoder.decode url, (err, output) ->
        if err
          console.log 'Error decoding', text, err
        else
          console.log 'Success', text, output

decodeFromFile = (filePath, expectedText) ->
  file = fs.readFileSync(filePath)
  imageData = file.toString('base64')   
  imageSrc = "data:image/png;base64,#{imageData}"
  Decoder.decode imageSrc, (err, output) ->
    if err
      console.log 'Error decoding', filePath, expectedText, err
    else
      if output is expectedText
        console.log 'Success', filePath, expectedText, output
      else
        console.log 'Fail', filePath, 'Expected', expectedText, 'Actual', output


# encodeAndDecode('simple')
# encodeAndDecode('55a006a5bc4da47389ae222d')
# encodeAndDecode('http://uberhuman.com/rr/55a006a5bc4da47389ae222d')

# dragged and dropped from HTML page
# decodeFromFile path.join(__dirname, './fixtures/simple.png'), 'simple'
# decodeFromFile path.join(__dirname, './fixtures/longer.png'), '55a006a5bc4da47389ae222d'

# decodeFromFile path.join(__dirname, './fixtures/simple-screenshot.png'), 'simple'
# decodeFromFile path.join(__dirname, './fixtures/longer-screenshot.png'), '55a006a5bc4da47389ae222d'

# decodeFromFile path.join(__dirname, './fixtures/longer-screenshot-from-fax.png'), '55a006a5bc4da47389ae222d'
# decodeFromFile path.join(__dirname, './fixtures/full-fax.png'), '55a006a5bc4da47389ae222d'

# decodeFromFile path.join(__dirname, './fixtures/image-with-qrcode.jpg'), 'https://www.youtube.com/watch?v=8x-nQ-vPw5k'
decodeFromFile path.join(__dirname, './fixtures/longer-url-screenshot-scaled-rotated.png'), 'http://uberhuman.com/rr/55a006a5bc4da47389ae222d'