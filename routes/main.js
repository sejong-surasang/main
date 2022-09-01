const express=require('express');
const router = express.Router();

const mysql = require('mysql2');
const menuDBconfig   = require('../config/menuDB.js');
const menuConnection = mysql.createConnection(menuDBconfig);

router.get('/', function(req,res,next){
    res.render('main/index', {title:'학교에서 밥을먹자'});
});



module.exports = router;