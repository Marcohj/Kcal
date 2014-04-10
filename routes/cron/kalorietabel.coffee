Food        = require("../../models").Food
request     = require 'request'
cheerio     = require 'cheerio'
_           = require 'underscore'
_.str       = require 'underscore.string'
_.mixin(_.str.exports());
_.str.include "Underscore.string", "string"

String::toNumber = ->
  _.clean @replace(/,/g, ".")

String::stringCleaning = ->
  _.clean @trim()

exports.all = (req, res, next) ->
  exports.fruits(req, res, next)
  exports.vegetables(req, res, next)
  exports.beans(req, res, next)
  exports.maize(req, res, next)
  exports.nut(req, res, next)
  exports.fish(req, res, next)
  exports.meat(req, res, next)
  exports.poultry(req, res, next)
  exports.dairy(req, res, next)
  exports.fats(req, res, next)
  exports.candy(req, res, next)
  exports.drinks(req, res, next)

exports.fruits = (req, res, next) ->
  console.log "Fruit scrape called!"

  request.get
    uri: "http://kalorietabel.dk/frugt.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $('#table1 tr')
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "fruit";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added fruit: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.vegetables = (req, res, next) ->
  console.log "Vegetable scrape called!"

  request.get
    uri: "http://kalorietabel.dk/groentsager.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    vegetableRows = $("table[bgcolor='#E8F8E4'] tr")
    $(vegetableRows).each (index, element) ->
      food = new Food()
      food.type = "vegetable";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(7).text().toNumber()
        food.fatKcal = $(element).find('td').eq(8).text().toNumber()
        food.carbs = $(element).find('td').eq(9).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(10).text().toNumber()
        food.fibers = $(element).find('td').eq(11).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(12).text().toNumber()
        food.calcium = $(element).find('td').eq(13).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(14).text().toNumber()
        food.healthFactor = $(element).find('td').eq(15).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      food.save (err) ->
        console.log "Added vegetable: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.beans = (req, res, next) ->
  console.log "Beans scrape called!"

  request.get
    uri: "http://kalorietabel.dk/baelgfrugter.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $('#table1 tr')
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "fabaceae";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(7).text().toNumber()
        food.fatKcal = $(element).find('td').eq(8).text().toNumber()
        food.carbs = $(element).find('td').eq(9).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(10).text().toNumber()
        food.fibers = $(element).find('td').eq(11).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(12).text().toNumber()
        food.calcium = $(element).find('td').eq(13).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(14).text().toNumber()
        food.healthFactor = $(element).find('td').eq(15).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      food.save (err) ->
        console.log "Added fabaceae: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.maize = (req, res, next) ->
  console.log "Maize scrape called!"

  request.get
    uri: "http://kalorietabel.dk/kornprodukter.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $('#table1 tr')
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "maize";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added maize: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.nut = (req, res, next) ->
  console.log "Nut scrape called!"

  request.get
    uri: "http://kalorietabel.dk/noedder.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $('#table1 tr')
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "nut";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added nut: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.fish = (req, res, next) ->
  console.log "Fish scrape called!"

  request.get
    uri: "http://kalorietabel.dk/fisk.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $("table[bgcolor='#E8F8E4'] tr")
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "fish";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added fish: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.meat = (req, res, next) ->
  console.log "poultry scrape called!"

  request.get
    uri: "http://kalorietabel.dk/koed.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $("table[bgcolor='#E8F8E4'] tr")
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "meat";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added poultry: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.poultry = (req, res, next) ->
  console.log "poultry scrape called!"

  request.get
    uri: "http://kalorietabel.dk/fjerkrae.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $("table[bgcolor='#E8F8E4'] tr")
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "poultry";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added poultry: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.dairy = (req, res, next) ->
  console.log "dairy scrape called!"

  request.get
    uri: "http://kalorietabel.dk/fjerkrae.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $("table[bgcolor='#E8F8E4'] tr")
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "dairy";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added dairy: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.fats = (req, res, next) ->
  console.log "fats scrape called!"

  request.get
    uri: "http://kalorietabel.dk/fedtstof.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $("table[bgcolor='#E8F8E4'] tr")
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "fats";

      if index == 2
        food.name = $(element).find('td').eq(1).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(2).text().toNumber()
        food.energyKJ = $(element).find('td').eq(3).text().toNumber()
        food.protein = $(element).find('td').eq(4).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(5).text().toNumber()
        food.fat = $(element).find('td').eq(6).text().toNumber()
        food.fatKcal = $(element).find('td').eq(7).text().toNumber()
        food.carbs = $(element).find('td').eq(8).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(9).text().toNumber()
        food.fibers = $(element).find('td').eq(10).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(11).text().toNumber()
        food.calcium = $(element).find('td').eq(12).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(13).text().toNumber()
        food.healthFactor = $(element).find('td').eq(14).text().toNumber()
      else if index > 2
        food.name = $(element).find('td').eq(0).text().stringCleaning()
        food.energyKcal = $(element).find('td').eq(1).text().toNumber()
        food.energyKJ = $(element).find('td').eq(2).text().toNumber()
        food.protein = $(element).find('td').eq(3).text().toNumber()
        food.proteinKcal = $(element).find('td').eq(4).text().toNumber()
        food.fat = $(element).find('td').eq(5).text().toNumber()
        food.fatKcal = $(element).find('td').eq(6).text().toNumber()
        food.carbs = $(element).find('td').eq(7).text().toNumber()
        food.carbsKcal = $(element).find('td').eq(8).text().toNumber()
        food.fibers = $(element).find('td').eq(9).text().toNumber()
        food.fibersKcal = $(element).find('td').eq(10).text().toNumber()
        food.calcium = $(element).find('td').eq(11).text().toNumber()
        food.calciumKcal = $(element).find('td').eq(12).text().toNumber()
        food.healthFactor = $(element).find('td').eq(13).text().toNumber()
      food.save (err) ->
        console.log "Added fats: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.candy = (req, res, next) ->
  console.log "candy scrape called!"

  request.get
    uri: "http://kalorietabel.dk/slik.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $("table[bgcolor='#E8F8E4'] tr")
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "candy";

      food.name = $(element).find('td').eq(0).text().stringCleaning()
      food.energyKcal = $(element).find('td').eq(1).text().toNumber()
      food.energyKJ = $(element).find('td').eq(2).text().toNumber()
      food.healthFactor = $(element).find('td').eq(3).text().toNumber()
      food.save (err) ->
        console.log "Added candy: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()

exports.drinks = (req, res, next) ->
  console.log "drinks scrape called!"

  request.get
    uri: "http://kalorietabel.dk/drikkevarer.htm"
    encoding: "binary"
  , (err, resp, body) ->
    $ = cheerio.load body

    fruitRows = $("table[bgcolor='#E8F8E4'] tr")
    $(fruitRows).each (index, element) ->
      food = new Food()
      food.type = "drinks";

      food.name = $(element).find('td').eq(0).text().stringCleaning()
      food.energyKcal = $(element).find('td').eq(1).text().toNumber()
      food.energyKJ = $(element).find('td').eq(2).text().toNumber()
      food.alchohol = $(element).find('td').eq(3).text().toNumber()
      food.healthFactor = $(element).find('td').eq(4).text().toNumber()
      food.save (err) ->
        console.log "Added drinks: " + food.name
        console.log 'Error: ' + err if err

    res.jsonData = 
        status: "DONE"
    next()