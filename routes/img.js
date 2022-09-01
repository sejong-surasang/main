const express=require('express');
const fs=require('fs');
const imgrouter = express.Router();
const path = require("path");

imgrouter.get('', function(req,res,next){

    res.send('이미지 파일을 전송하는 라우터입니다.');
    
});

imgrouter.get('/errer/300x200', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "error_300x200.jpg"));
});

imgrouter.get('/haksik', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/메인.jpeg"));
});

imgrouter.get('/restaurant', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/메인.jpeg"));
});

imgrouter.get('/cafe', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/메인.jpeg"));
});

imgrouter.get('/store', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/메인.png"));
});

imgrouter.get('/haksik/hak', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/학생회관.jpg"));
});

imgrouter.get('/haksik/jin', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/진관홀.jpeg"));
});

imgrouter.get('/restaurant/yamsem', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/얌샘김밥입구.jpeg"));
});

imgrouter.get('/restaurant/saigong', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/미스사이공입구.jpeg"));
});

imgrouter.get('/cafe/pandorosi', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/판도로시.jpeg"));
});

imgrouter.get('/cafe/twosome', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/투썸.jpeg"));
});

imgrouter.get('/cafe/dic', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/카페딕셔너리.jpeg"));
});

imgrouter.get('/cafe/paris', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/파리바게트.jpeg"));
});

imgrouter.get('/cafe/jeju', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/제주몰빵.jpeg"));
});

imgrouter.get('/store/CU', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/CU.jpeg"));
});

imgrouter.get('/store/emart24', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/이마트24.jpeg"));
});

imgrouter.get('/haksik/hak/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/소금구이.jpeg"));
});

imgrouter.get('/haksik/hak/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/육회비빔밥.jpeg"));
});

imgrouter.get('/haksik/hak/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/닭강정.jpeg"));
});

imgrouter.get('/haksik/jin/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/크림치즈도리아.jpeg"));
});

imgrouter.get('/haksik/jin/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/순쫄.jpeg"));
});

imgrouter.get('/haksik/jin/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "haksik/김치찌게라면.jpeg"));
});

imgrouter.get('/restaurant/yamsem/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/라돈모다기.jpeg"));
});

imgrouter.get('/restaurant/yamsem/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/돈까스김치오므라이스.jpeg"));
});

imgrouter.get('/restaurant/yamsem/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/얌샘김밥.jpeg"));
});

imgrouter.get('/restaurant/saigong/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/사이공1.jpeg"));
});

imgrouter.get('/restaurant/saigong/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/사이공2.jpeg"));
});

imgrouter.get('/restaurant/saigong/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "restaurant/사이공3.jpeg"));
});

imgrouter.get('/cafe/pandorosi/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/판도로시1.jpeg"));
});

imgrouter.get('/cafe/pandorosi/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/판도로시2.jpeg"));
});

imgrouter.get('/cafe/twosome/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/투썸1.jpeg"));
});

imgrouter.get('/cafe/twosome/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/투썸2.jpeg"));
});

imgrouter.get('/cafe/twosome/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/투썸3.jpeg"));
});

imgrouter.get('/cafe/twosome/4', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/투썸4.jpeg"));
});

imgrouter.get('/cafe/twosome/5', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/투썸5.jpeg"));
});

imgrouter.get('/cafe/dic/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/카딕1.jpeg"));
});

imgrouter.get('/cafe/dic/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/카딕2.jpeg"));
});

imgrouter.get('/cafe/dic/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/카딕3.jpeg"));
});

imgrouter.get('/cafe/paris/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/파바1.png"));
});

imgrouter.get('/cafe/paris/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/파바2.png"));
});

imgrouter.get('/cafe/paris/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/파바3.png"));
});

imgrouter.get('/cafe/paris/4', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/파바4.png"));
});

imgrouter.get('/cafe/paris/5', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/파바5.png"));
});

imgrouter.get('/cafe/jeju/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/제주1.jpeg"));
});

imgrouter.get('/cafe/jeju/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/제주2.jpeg"));
});

imgrouter.get('/cafe/jeju/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/제주3.jpeg"));
});

imgrouter.get('/cafe/jeju/4', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/제주4.jpeg"));
});

imgrouter.get('/cafe/jeju/5', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "cafe/제주5.jpeg"));
});

imgrouter.get('/store/CU/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/CU1.jpeg"));
});

imgrouter.get('/store/CU/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/CU2.jpeg"));
});

imgrouter.get('/store/CU/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/CU3.jpeg"));
});

imgrouter.get('/store/emart24/1', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/이마트1.jpeg"));
});

imgrouter.get('/store/emart24/2', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/이마트2.jpeg"));
});

imgrouter.get('/store/emart24/3', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/src/img/", "store/이마트3.jpeg"));
});

module.exports = imgrouter;