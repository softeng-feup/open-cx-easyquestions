'use strict';

require('dotenv/config');

const mongoose = require('mongoose');
const OPTS = { useUnifiedTopology: true, useNewUrlParser: true };
const express = require('express');
const app = express();
const cors = require('cors');
const PORT = (process.env.PORT || 5000);
const HOST = (process.env.HOST || "localhost");
const DB_CONNECTION = "mongodb+srv://easyquestions:easyquestions@eqcluster-skrrd.mongodb.net/test?retryWrites=true&w=majority"; //(process.env.DB_CONNECTION || "mongodb://mongo:27017/testdb");
const routes = require('./routes');

// Middlewares
app.use('/admin', require('./admin'))
app.use(express.json());
app.use(express.urlencoded());


app.use('/', routes);
app.use(cors());

// Connects app to a MongoDB database
mongoose.connect(DB_CONNECTION, OPTS, () => { console.log("Attempting connection to database") });

app.listen(PORT);

console.log(`Running on http://${HOST}:${PORT}`);