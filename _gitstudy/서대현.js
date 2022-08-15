const express = require('express');
const router = express.Router();
const path = require("path");//경로 스트링 합칠 때 필요

const mainrouter = require('./main.js');

const mysql = require('mysql2');
const testdbconfig   = require('../DB_config/testDB.js');
const testconnection = mysql.createConnection(testdbconfig);
//DB 연결하기

router.get('/posts', (req, res) => {
    testconnection.query('SELECT * from post', (error, rows) => {
      if (error) throw error;
      //console.log('post info is: ', rows);
      res.render('posts', {title:'posts', posts:rows});
    });
});

router.get('/createpost', (req, res) => { 
    //res.send('bye nodejs!');
	//res.sendFile(path.join(__dirname,'../views/createpost.html'));
    res.render('createpost', {});
});
router.post('/createpost/action', (req, res) => {
    //console.log(req.body); 입력받은 객체 찍기
    testconnection.query
    ('INSERT INTO post (`title`,`content`) VALUES (?,?);',[
        req.body.title,
        req.body.content
    ], (error, rows) => {
        if (error) throw error;
        //console.log('post info is: ', rows);
        //res.render('posts', {title:'posts', posts:rows});
        res.redirect('/posts');
      });
    //res.render('result', {name:req.body.name, pw:req.body.pw});
    //res.redirect('/posts');
});

router.get('/deletepost/:postid', (req,res)=>{
    var post_id=req.params.postid;
    var querytext="DELETE from post where id="+post_id+";";
    testconnection.query(querytext, (error, rows) => {
        if (error) throw error;
        res.redirect('/posts');
    });
});

router.get('/updatepost/:postid/:title/:content', (req,res)=>{
    var post_id=req.params.postid;
    var title=req.params.title;
    var content=req.params.content;
    var querytext="UPDATE post SET `title` = '"+title+"', `content` = '"+content+"' WHERE (`id` = "+post_id+");";
    testconnection.query(querytext, (error, rows) => {
        if (error) throw error;
        res.redirect('/posts');
    });
});

router.use('/main', mainrouter);

router.get('/', (req, res) => { // 경로 /으로 요청이 들어왔으면
    res.send('hello nodejs!');
	//res.sendFile(path.join(__dirname,'/main.html'));
});

router.get('/quiz', function(req,res,next){
    res.render('quiz', {name:'db테스트',quiz:'반짝반짝 작은 `?`',answer:'star'});
});

router.post('/quiz/answer', (req, res) => {
    console.log(req.body);
    res.render('result', {name:req.body.quiz_answer, pw:req.body.user_answer});
    //res.redirect('/dbtest');
});

router.get('/main', (req, res) => { // 경로 /으로 요청이 들어왔으면
    //res.send('bye nodejs!');
	res.sendFile(path.join(__dirname,'/main.html'));
});



router.get('/res', function(req,res,next){
    res.render('result', {name:'db테스트',pw:'pw',test:'ster'});
  });

  

router.get('/test', (req, res) => { // 경로 /으로 요청이 들어왔으면
    //res.send('bye nodejs!');
	res.sendFile(path.join(__dirname,'/main.html'));
});

//파일의 위치는 /router/router.js
const dirn=__dirname;


module.exports = router;
