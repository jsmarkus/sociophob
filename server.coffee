express = require 'express'
http = require 'http'
path = require 'path'
browserify = require 'browserify'
resourcify_jade = require 'resourcify/jade'

app = do express

useBrowserifyDebug = (debug, app) ->
    bundle = browserify debug:debug, entry:"#{__dirname}/client/index.coffee"
    bundle.use resourcify_jade
    app.use bundle

app.configure ->
    app.set "port", process.env.PORT or 3000
    app.set "views", __dirname + "/views"
    app.set "view engine", "jade"
    app.use express.favicon()
    app.use express.logger("dev")
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser("your secret here")
    app.use express.session()
    app.use app.router
    app.use express.static(path.join(__dirname, "public"))

app.configure "production", ->
    useBrowserifyDebug off, app

app.configure "development", ->
    useBrowserifyDebug on, app
    app.use express.errorHandler()

require('./routes/client') app

server = http.createServer(app).listen app.get("port"), ->
    console.log "Express server listening on port " + app.get("port")

require('./chat') server
