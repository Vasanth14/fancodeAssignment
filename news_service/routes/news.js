const express = require('express');
const router = express.Router();
const News = require('../controllers/news')

router.post('/news/match', News.createNewsForMatch);
router.post('/news/tour', News.createNewsForTour);

router.get('/news/match/:matchId', News.getNewsByMatchId);
router.get('/news/tour/:tourId', News.getNewsByTourId);
router.get('/news/sport/:sportId', News.getNewsBySportId);


module.exports = router;
