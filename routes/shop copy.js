//db분리 전 원본 파일

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
        //else if()
      }
      //console.log('shop info is: ', r1);
     res.render('shop/index', {title:'검수', rates:rows});
   });
});


router.get('/:id', function(req, res, next) {
  res.render('shop/index', {title:''});
  res.send('shop 메인');
});


module.exports = router;