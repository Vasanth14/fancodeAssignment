const express = require('express');
const router = express.Router();
const News = require('../controllers/news')

router.post('/news/match', async (req, res) => {
    try {
      await News.createNewsForMatch(req, res);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });
  
  router.post('/news/tour', async (req, res) => {
    try {
      await News.createNewsForTour(req, res);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });
  
  router.get('/news/match/:matchId', async (req, res) => {
    try {
      await News.getNewsByMatchId(req, res);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });
  
  router.get('/news/tour/:tourId', async (req, res) => {
    try {
      await News.getNewsByTourId(req, res);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });
  
  router.get('/news/sport/:sportId', async (req, res) => {
    try {
      await News.getNewsBySportId(req, res);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });


module.exports = router;


//sample json object to create news using matchId
// {
//   "title": "test title",
//   "description": "test desc",
//   "tourId": 1,
//   "matchId": 1
// }


//sample json object to create news using tourId
// {
//   "title": "test title",
//   "description": "test desc",
//   "tourId": 1,
//   "sportId": 1
// }
