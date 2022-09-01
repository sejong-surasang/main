const express = require('express');
const router = express.Router();

const imgrouter = require('./img.js');
const fontrouter = require('./font.js');

router.use('/imgs', imgrouter);
router.use('/font', fontrouter);

module.exports = router;