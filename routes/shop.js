const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const menuDBconfig   = require('../config/menuDB.js');
const menuDBConnection = mysql.createConnection(menuDBconfig);

router.get('/', function(req,res,next){
  res.render('shop/index', {title:''});
  //res.send('shop 메인');
});



module.exports = router;