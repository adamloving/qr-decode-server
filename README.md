
## Intallation

### Mac OS X

    $ brew install nvm (follow instructions)
    $ nvm use 0.10.38
    $ brew install cairo
    $ export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig


### Heroku

heroku config:add BUILDPACK_URL=https://github.com/mojodna/heroku-buildpack-multi.git#build-env

heroku buildpacks:set https://github.com/ddollar/heroku-buildpack-multi.git


https://github.com/Automattic/node-canvas/wiki/Installation-on-Heroku