const express = require('express');
const router = express.Router();
const path = require("path");

const imgrouter = require('./img.js');
const fontrouter = require('./font.js');

router.use('/imgs', imgrouter);
router.use('/font', fontrouter);

router.get('/main/main.js', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/main/", "main.js"));
});
router.get('/main/style.css', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/main/", "style.css"));
});

router.get('/shop/main.js', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/shop/", "main.js"));
});
router.get('/shop/style.css', function(req,res,next){
    res.sendFile(path.join(__dirname, "../views/shop/", "style.css"));
});

module.exports = router;