## What is this?

This project is a node web service (HTTP) wrapper around jsqrcode
that allows us to host a QR decoding service. jsqrcode depends on node-canvas
and cairo, which require a specific version of node, so it is useful
to have this hosted as a separate service.

## Intallation

### Mac OS X

    $ brew install nvm (follow instructions)
    $ nvm use 0.10.38
    $ brew install cairo
    $ export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

### Heroku

To use multiple buildpacks (see .buildbacks)

    $ heroku buildpacks:set https://github.com/ddollar/heroku-buildpack-multi.git

More instructions with [cairo buildpack](https://github.com/mojodna/heroku-buildpack-cairo)
And this related help for [node-canvas](https://github.com/Automattic/node-canvas/wiki/Installation-on-Heroku)

## Usage

See tests/test.sh

