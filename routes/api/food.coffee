Food				  = require("../../models").Food


exports.list = (req, res, next) ->
  Food.find().sort('name').exec (err, foods) ->
    res.jsonData = foods
    next()

exports.listByType = (req, res, next) ->
  foodType = req.params.type

  Food.find(type: foodType).sort("name").exec (err, foods) ->
    res.jsonData = foods
    next()

exports.add = (req, res, next) ->
  res.sendJson {}
  next()

exports.update = (req, res, next) ->
  res.sendJson {}
  next()

exports.remove = (req, res, next) ->
  res.sendJson {}
  next()