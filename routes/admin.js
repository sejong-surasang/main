//해당 파일은 사용되지 않습니다!
//DB 쿼리문 관련 참고용으로만 사용해주세요!

const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const menuDBconfig   = require('../config/menuDB.js');
const Connection = mysql.createConnection(menuDBconfig);

router.get('/', function(req,res,next){
  res.render('admin/main', {title:'db테스트'});
});

router.get('/checkrate', (req, res) => {
  Connection.query('SELECT * from food_rate_draft', (error, rows) => {
      if (error) throw error;
      //console.log('post info is: ', rows);
      res.render('admin/checkrate', {title:'검수', rates:rows});
    });
});

router.post('/applyrate', (req, res) => {
  //console.log(req.body);
  var food_id=req.body.food_id;
    Connection.query
    ('INSERT INTO food_rate (`food_id`, `author`, `rate`, `content`,`pw`) VALUES (?, ?, ?, ?, ?);',[
      req.body.food_id,
      req.body.author,
      req.body.rate,
      req.body.content,
      req.body.pw
    ], (error, rows) => {
      if (error) throw error;
      //res.render('foods/alert_page', {food_id:food_id,alert_type:2});
      res.redirect('/admin/deleterate/'+req.body.rate_id);
    });
});

router.get('/deleterate/:rateid', (req,res)=>{
  var rate_id=req.params.rateid;
  var querytext="DELETE from food_rate_draft where id="+rate_id+";";
  Connection.query(querytext, (error, rows) => {
      if (error) throw error;
      res.redirect('/admin/checkrate');
  });
});

router.get('/create', (req, res) => {
  res.render('db/create', {title:'db테스트'});
});

router.post('/createpost', (req, res) => {
  console.log(req.body);
  res.redirect('/dbtest');
});

router.get('/rating', (req, res) => {
  res.render('db/rate_create', {title:'db테스트'});
});



router.get('/rates', (req, res) => {
  Connection.query('SELECT * from rate', (error, rows) => {
    if (error) throw error;
    res.render('db/rate_list', {title:'posts', posts:rows});
  });
});

module.exports = router;