const mongoose = require("mongoose");

const citizenSchema = new mongoose.Schema(
  {
    firstName: String,
    lastName: String,
    username: String,
    age: Number,
  },
  { versionKey: false }
);

const collectionName = "citizen";

const citizenModel = mongoose.model(
  collectionName,
  citizenSchema,
  collectionName
);

module.exports = citizenModel;
