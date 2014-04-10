mongoose = require "mongoose"
Schema = mongoose.Schema

exports = module.exports = new Schema(

  name:
    type: String
    required: true
    index:
      unique: true
      dropDups: true

  type:
    type: String

  energyKcal:
    type: Number

  energyKJ:
    type: Number

  protein:
    type: Number

  proteinKcal:
    type: Number

  fat:
    type: Number

  fatKcal:
    type: Number

  carbs:
    type: Number

  carbsKcal:
    type: Number

  fibers:
    type: Number

  fibersKcal:
    type: Number

  calcium:
    type: Number

  calciumKcal:
    type: Number

  alchohol:
    type: Number

  healthFactor:
    type: Number

  added:
    type: Date
    default: Date.now

  updated:
    type: Date
    default: Date.now

)