Chat = require './Chat'

app = new Chat
div = document.createElement 'DIV'
app.setElement div
do app.render

document.body.appendChild div
