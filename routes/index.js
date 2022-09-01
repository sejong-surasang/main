const express = require('express');
const router = express.Router();

const mainrouter = require('./main.js');
const shoprouter = require('./shop.js');
const foodrouter = require('./food.js');
const searchrouter = require('./search.js');
const reviewrouter = require('./review.js');
const matchingrouter = require('./matching.js');
const filerouter = require('./file.js');
const adminrouter = require('./admin.js');
//const dbrouter = require('./db.js');

router.get('/', function(req,res,next){
    res.redirect('/main');
});

router.use('/main', mainrouter);
router.use('/shop', shoprouter);
router.use('/food', foodrouter);
router.use('/search', searchrouter);
router.use('/review', reviewrouter);
router.use('/matching', matchingrouter);
router.use('/file', filerouter);
router.use('/admin', adminrouter);
//router.use('/DBTEST', dbrouter);

module.exports = router;

