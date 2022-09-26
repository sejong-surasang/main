const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const DBconfig   = require('../config/sejongDB.js');
const Connection = mysql.createConnection(DBconfig);

router.get('/', function(req,res,next){
  Connection.query('SELECT * from search', (error, rows) => {
    if (error) throw error;
    console.log('post info is: ', rows);
    res.render('search/index', {title:'search', name:rows});
  });
});


module.exports = router;
