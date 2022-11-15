const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const DBconfig   = require('../config/sejongDB.js');
const Connection = mysql.createConnection(DBconfig);

router.get('/', function(req,res,next){
  
  Connection.query('SELECT * from shop_lists', (error, rows) => {
    if (error) throw error;
     //console.log('shop info is: ', rows);
     res.render('shop/index', {title:'검수', rates:rows});
   });
});


router.get('/:id', function(req, res, next) {
  res.render('shop/index', {title:''});
  res.send('shop 메인');
});


module.exports = router;