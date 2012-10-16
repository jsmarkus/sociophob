module.exports = (app)->
	app.get '/', (req, res)->
		res.render 'client', layout:true