const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const DBconfig   = require('../config/sejongDB.js');
const Connection = mysql.createConnection(DBconfig);

router.get('/', function(req,res,next){
  res.render('review/index', {title:''});
  //res.send('shop 메인');
});



module.exports = router;