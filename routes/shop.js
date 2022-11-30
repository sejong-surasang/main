//db분리 작업 중 파일

const express=require('express');
const router = express.Router();

const mysql = require('mysql2');

const DBconfig   = require('../config/sejongDB.js');
const Connection = mysql.createConnection(DBconfig);

router.get('/', function(req,res,next){
  
  Connection.query('SELECT * from shop_lists', (error, rows) => {
    if (error) throw error;
     //console.log('shop info is: ', rows);
      var r1=[],r2=[],r3=[],r4=[];
      for(i in rows)
      {
        var plag=parseInt(rows[i].id/1000);
        console.log('test : ',parseInt(rows[i].id/1000));
        if(plag==1)
        {
          r1.push(rows[i]);
        }
        else if(plag==2)
        {
          r2.push(rows[i]);
        }
        else if(plag==3)
        {
          r3.push(rows[i]);
        }
        else if(plag==4)
        {
          r4.push(rows[i]);
        }
      }
      //r1에 id의 천의 자리가 1인 행 저장 완료
      //나눠서 프론트에 전송 바람
      //else if()
      // -> else if는 수행했으나 이후에 뭘 해야할지 모르겠음
      
      //console.log('shop info is: ', r1);

     res.render('shop/index', {title:'검수', rates:rows});
   });
});


router.get('/:id', function(req, res, next) {
  var id = req.params.id;

  querytext = `SELECT * FROM shop_lists WHERE id= ${id};`;
  
  Connection.query(querytext, (error, topic)=>{
    if(error){
      throw error;
    }

    var name = topic[0].name;
    var notice = topic[0].notice;
    var opening_hour = topic[0].opening_hour;
    var location_desc = topic[0].location_desc;
    var img_src = topic[0].img_src;
    var isopen = topic[0].isopen;

    res.render('./shop/index_detail', {name, notice, opening_hour, location_desc, img_src, isopen});
  })
  
  //res.render('shop/index', {title:''});
  //nores.send('shop 메인');
});


module.exports = router;