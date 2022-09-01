const express = require('express');
const app=express();
const router = require('./routes/index');
const nunjucks = require('nunjucks');
const bodyParser= require('body-parser')

// const dotenv = require('dotenv');
// const db_config = require(__dirname + '/config/database.js');
// var conn = db_config.init();

//db_config.connect(conn);

app.set('view engine', 'html');
app.set('ejs', 'ejs.renderFile');
nunjucks.configure('views', {
  express: app,
  watch: true,
});

app.use(express.static(__dirname+'/'));
app.use(bodyParser.urlencoded ({extended: true}))
app.use('/', router);

const port = 3000;


app.listen(port,function(){
    console.log('Example app listening on port : ' + port);
});