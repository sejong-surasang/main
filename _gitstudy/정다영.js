const express = require('express');
const router = express.Router();
const path = require("path");

const mainrouter = require('../main.js');

router.use('/main', mainrouter);

module.exports = router;

//DB설정
const mysql = require('mysql2');
const testdbconfig   = require('../DB_config/testDB.js');
const testconnection = mysql.createConnection(testdbconfig);

router.get('/posts', (req, res) => {
  testconnection.query('SELECT * from post', (error, rows) => { //커리문으로 post테이블 값 가져온다
    if (error) throw error; //에러가 있을경우 
    //console.log('post info is: ', rows);
    res.render('posts', {title:'posts', posts:rows}); //없으면 render
  });
});


//creatpost(글작성)
//router.js
router.get('/createpost', (req, res) => { 
	//res.sendFile(path.join(__dirname,'../views/createpost.html'));
    res.render('createpost', {});
});

router.post('/createpost/action', (req, res) => {
    //console.log(req.body); 입력받은 객체 찍기
    testconnection.query('INSERT INTO post (`title`,`content`) VALUES (?,?);',[
        req.body.title,
        req.body.content
    ], (error, rows) => {
        if (error) throw error;
        //res.render('posts', {title:'posts', posts:rows});
        res.redirect('/posts');
      });
    //res.render('result', {name:req.body.name, pw:req.body.pw});
    //res.redirect('/posts');
});

//delete
router.get('/deletepost/:postid', (req,res)=>{
  var post_id=req.params.postid;
  var querytext="DELETE from post where id="+post_id+";";
  testconnection.query(querytext, (error, rows) => {
      if (error) throw error;
      res.redirect('/posts');
  });
});

//update
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