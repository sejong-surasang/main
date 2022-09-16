const express=require('express');
const router = express.Router();

const mysql = require('mysql2');
const DBconfig   = require('../config/sejongDB.js');
const Connection = mysql.createConnection(DBconfig);

router.get('/', function(req,res,next){
    res.render('main/index', {title:'학교에서 밥을먹자'});
});



module.exports = router;