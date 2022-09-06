const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const menuDBconfig   = require('../config/menuDB.js');
const Connection = mysql.createConnection(menuDBconfig);

router.get('/', function(req,res,next){
  res.render('matching/index', {title:''});
  //res.send('shop 메인');
});

router.get('/matching', (req, res)=>{
  res.sendFile(path.join(__dirname, '/matching.html'));
});

router.get('/matching/write', (req, res)=>{
  res.sendFile(path.join(__dirname, '/matching/write.html'));
});

router.get('/matching/:id', (req, res)=>{
  res.sendFile(path.join(__dirname, '/matching/:id.html'));
});

router.get('/matching/:id/revise', (req, res)=>{
  res.sendFile(path.join(__dirname, '/matching/:id/revise.html'));
});



module.exports = router;