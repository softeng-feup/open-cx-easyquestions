const mongoose = require('mongoose');

const reviewSchema = mongoose.Schema({
  idDoc: {
    type: String,
    required: true
  },
  authorUsername: {
    type: String
  },
  createdAt: {
    type: String,
  },
  talkID: {
    type: String,
    required: true,
  },
  body: {
    type: String,
    required: true,
  }
});

module.exports = review = mongoose.model('Review', reviewSchema);
