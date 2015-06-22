QRCode = require('qrcode')

module.exports = class EncodeController

  @post: (req, res) ->
    QRCode.toDataURL req.body, (err, url) ->
      if err
        res.send status: 'fail', error: err
      else
        res.send status: 'success', dataURL: url      
