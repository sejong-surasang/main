const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const DBconfig   = require('../config/sejongDB.js');
const Connection = mysql.createConnection(DBconfig);

router.get('/:id', function(req,res,next){
  res.render('food/index', {title:'', food_id:req.params.id});
  //res.send('shop 메인');
});



module.exports = router;