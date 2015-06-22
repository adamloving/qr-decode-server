export SERVER=localhost:3000

# ENCODE 
curl \
  --header 'Content-Type: text/plain' \
  --data 'This is the text i would like to encode' \
  http://$SERVER/encode

# TEST POST of image containing QR Code
curl \
  --form 'decode-this.jpg=@./tests/fixtures/image-with-qrcode.jpg' \
  http://$SERVER/decode

# TEST POST of image without QR Code
curl \
  --form 'decode-this.jpg=@./tests/fixtures/dog-on-stairs.jpg' \
  http://$SERVER/decode
