let Review = require('../../models/review');

const singleReview = require('express').Router();

singleReview.delete('/:postId', async (req, res) => {
  var review = await Review.find({idDoc : req.params.postId});

  try {
    review = await Review.deleteOne({ _id : review[0]._id});
    res.json(review);
  }
  catch (err) {
    res.json({ message: err });
  }
});

module.exports = singleReview;
