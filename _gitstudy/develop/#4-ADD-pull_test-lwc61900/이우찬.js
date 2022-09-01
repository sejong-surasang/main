// 링크만 따로 관리하는 코드들. 개발을 용이하게 함.

const express = require('express');
const router = express.Router();
const path = require("path");//경로 스트링 합칠 때 필요
// 윗 줄은 main.js에 있던 코든데 이게 없으면 

const mainrouter = require('../main.js');
// main.js 파일을 모듈화해서 끌어다쓰기. 스택이 쌓이는 느낌인가?

//router.use('/main', mainrouter);

//module.exports = router;


const mysql = require('mysql2');
const testdbconfig   = require('../DB_config/testDB.js'); 
const testconnection = mysql.createConnection(testdbconfig);

router.get('/posts', (req, res) => {
    testconnection.query('SELECT * from post', (error, rows) => {
      if (error) throw error;
      //console.log('post info is: ', rows);
      res.render('posts', {title:'posts', posts:rows});
    });
});


router.get('/createpost', (req, res) => { 
	//res.sendFile(path.join(__dirname,'../views/createpost.html'));
    res.render('createpost', {});
    // render는 프론트로 값을 보내기도 하지만 그 전에 프론트로 들어가는 역할임. (?)
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
        // 리뷰 제출하고나서 리뷰 목록 페이지로 redirect시키기
      });
    //res.render('result', {name:req.body.name, pw:req.body.pw});
    //res.redirect('/posts');
});

router.get('/deletepost/:postid', (req,res)=>{
    // 윗줄의 링크의 ':'는 그대로가 아니라 그 뒤를 변수로 만들어주는 느낌
    var post_id=req.params.postid;
    var querytext="DELETE from post where id="+post_id+";";
    testconnection.query(querytext, (error, rows) => {
        if (error) throw error; 
        // throw는 탈출 느낌인가?
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




router.get('/hello', (req, res) => { // 경로 '무언가'으로 요청이 들어왔으면
    res.send('hello router!');
   //res.sendFile(path.join(__dirname,'/main.html'));
});


router.get('/create', (req, res) => { // 경로 /으로 요청이 들어왔으면
    //res.send('bye nodejs!');
   res.sendFile(path.join(__dirname,'/create.html'));
   // dirname은 현재위치를 표현하는 것이므로 create.html이 views같은 하위 폴더에 가 있으면 오류가 남.
   // 아니네 오류 안나네...??
});

router.get('/res', function(req,res,next){
    res.render('result', {name:'db테스트',pw:'pw',test:'test1'});
  });

router.post('/createpost/action', (req, res) => {
    console.log(req.body);
    res.render('result', {name:req.body.name, pw:req.body.pw});
    // render = 백엔드(js)에서 프론트(html)로 넘기기
    // req.body만 하면 그값 전체 느낌. 뒤에 '.name'해야 걔.
    
    res.redirect('/test'); // 아까 '/test'로 했던거. 그거 오류 고치기.
});



router.get('/quiz', (req, res) => {
    res.render('quiz', {quiz: '3 + 5 = ?', answer:'8' });
});

router.post('/quiz/answer', (req, res) => {
    console.log(req.body);

    if (req.body.user_answer==req.body.quiz_answer) {
        res.send('정답');    
    }
    else {
        res.send('오답');
    }
});

module.exports = router;