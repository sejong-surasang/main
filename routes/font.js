const express=require('express');
const fs=require('fs');
const router = express.Router();
const path = require("path");

router.get('/BMJUA_otf.otf', function(req,res,next){
    res.sendFile(path.join(__dirname, "../fonts", "BMJUA_otf.otf"));
});

router.get('', function(req,res,next){

    res.send('폰트 파일을 전송하는 라우터입니다.');
    
});


module.exports = router;