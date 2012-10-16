##############################################################

$                  = require 'br-jquery'
bb                 = require 'backbone'
ko                 = require 'knockoutify'
backstage          = require 'backstage'
#setup global libraries
bb.setDomLibrary $
backstage.inject knockout:ko, backbone:bb

##############################################################

MessageModel       = require './models/MessageModel'
ContactModel       = require './models/ContactModel'
MessagesCollection = require './collections/MessagesCollection'
ContactsCollection = require './collections/ContactsCollection'
MessagesListView   = require './views/MessagesListView'
ContactsListView   = require './views/ContactsListView'

##############################################################

module.exports = class Chat extends bb.View
	initialize: ->
	render: ->
		@$el.html 'chat'
