let Review = require('../../models/review');

const allReviews = require('express').Router();

allReviews.get('/', async (req, res) => {
  try {
    const reviews = await Review.find();
    res.json(reviews);
  }
  catch (err) {
    res.json({ message: err })
  }
});

allReviews.post('/', async (req, res) => {
   var review = new Review ({
         idDoc: req.body.idDoc,
         talkID: req.body.talkID,
         createdAt: req.body.createdAt,
         authorUsername: req.body.authorUsername,
         body: req.body.body
     });

  try {
     const savedPost = await review.save();
     res.json(savedPost);
   }
   catch (err) {
     res.json({ message: err });
     console.log('Erro');
   }


});

module.exports = allReviews;