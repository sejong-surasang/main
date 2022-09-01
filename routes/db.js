//해당 파일은 사용되지 않습니다!
//DB 쿼리문 관련 참고용으로만 사용해주세요!

const express=require('express');
const router = express.Router();

const mysql = require('mysql2');
const testdbconfig   = require('../config/testDB.js');
const testconnection = mysql.createConnection(testdbconfig);

const postDBconfig   = require('../config/postsDB.js');
const postConnection = mysql.createConnection(postDBconfig);

router.get('/', function(req,res,next){
  res.render('db/main', {title:'db테스트'});
});

router.get('/create', (req, res) => {
  res.render('db/create', {title:'db테스트'});
});

router.post('/createpost', (req, res) => {
  console.log(req.body);
  res.redirect('/dbtest');
});


router.get('/posts', (req, res) => {
    testconnection.query('SELECT * from post', (error, rows) => {
      if (error) throw error;
      //console.log('post info is: ', rows);
      res.render('db/posts.ejs', {title:'posts', posts:rows});
    });
});

router.get('/rating', (req, res) => {
  res.render('db/rate_create', {title:'db테스트'});
});

router.post('/createrate', (req, res) => {
  console.log(req.body);
  postConnection.query
  ('INSERT INTO rate (`food_id`, `rate`, `content`,`pw`) VALUES (?, ?, ?, ?);',[
    req.body.food_id,
    req.body.rate,
    req.body.content,
    req.body.pw
  ], (error, rows) => {
    if (error) throw error;
    res.redirect('/dbtest');
  });
});

router.get('/rates', (req, res) => {
  postConnection.query('SELECT * from rate', (error, rows) => {
    if (error) throw error;
    res.render('db/rate_list', {title:'posts', posts:rows});
  });
});

module.exports = router;