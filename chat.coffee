socket_io = require 'socket.io'

module.exports = (server)->
	io = socket_io.listen server

	io.sockets.on 'connection', (socket)->
		socket.emit 'hell', hello : 'world'
