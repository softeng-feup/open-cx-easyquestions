let Review = require('../../models/review');

const reviews = require('express').Router();

const all = require('./all');
const single = require('./single');


reviews.get('/', all);
reviews.post('/', all);

reviews.delete('/:postId', single);

module.exports = reviews;
