var express = require('express');
var modelIndex = require('../models/model_index');
var modelUser = require('../models/model_user');
var modelProduct = require('../models/model_product');
var router = express.Router();

/* GET home page. */
router.get('/', async function(req, res, next) {
    let listCat = await modelIndex.listCat();
    let listRecent = await modelIndex.listRecent();
    let listNewArrival = await modelIndex.listNewArrival();
    res.render('site/index', { listCat: listCat, listNewArrival: listNewArrival, listRecent: listRecent });
});
router.get('/gio-hang/', async function(req, res, next) {
    let listPro = await modelProduct.hotProduct();
    res.render('site/gio-hang.ejs', { listPro: listPro });
})
router.get('/thanh-toan', function(req, res, next) {
    res.render('site/thanh-toan.ejs');
})
router.get('/wishlist', async function(req, res, next) {
    let listPro = await modelProduct.hotProduct();
    res.render('site/wishlist.ejs', { listPro: listPro });
})
router.get('/lien-he', function(req, res, next) {
    res.render('site/lien-he.ejs');
})

module.exports = router;