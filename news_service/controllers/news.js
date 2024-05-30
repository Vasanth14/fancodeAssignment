const News = require('../models/news');

// Controller function to create news for a match
exports.createNewsForMatch = async (req, res) => {
    try {
        const { title, description, tourId, matchId } = req.body;
        const createdNews = await News.createForMatch(title, description, tourId, matchId);
        res.json(createdNews);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};


// Controller function to create news for a tour
exports.createNewsForTour = async (req, res) => {
    try {
        const { title, description, tourId, sportId } = req.body;
        const createdNews = await News.createForTour(title, description, sportId, tourId);
        res.json(createdNews);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getNewsByMatchId = async (req, res) => {
    try {
        const { matchId } = req.params;
        const news = await News.getNewsByMatchId(matchId);
        res.json(news);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getNewsByTourId = async (req, res) => {
    try {
        const { tourId } = req.params;
        const news = await News.getNewsByTourId(tourId);
        res.json(news);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getNewsBySportId = async (req, res) => {
    try {
        const { sportId } = req.params;
        const news = await News.getNewsBySportId(sportId);
        res.json(news);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
