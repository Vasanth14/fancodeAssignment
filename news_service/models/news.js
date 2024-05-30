const db = require('../config/db');

//function to create news for a match
exports.createForMatch = async (title, description, tourId, matchId) => {
    try {
        const query = 'INSERT INTO news (title, description, tourId, matchId) VALUES (?, ?, ?, ?)';
        const [result] = await db.execute(query, [title, description, tourId, matchId]);
        const createdNewsId = result.insertId;
        return { id: createdNewsId, title, description, tourId, matchId };
    } catch (error) {
        throw new Error(`Error creating news for match: ${error.message}`);
    }
};


//function to create news for a tour
exports.createForTour = async (title, description, tourId, sportId ) => {
    try {
        const query = 'INSERT INTO news (title, description, sportId, tourId ) VALUES (?, ?, ?, ?)';
        const [result] = await db.execute(query, [title, description, tourId, sportId]);
        const createdNewsId = result.insertId;
        return { id: createdNewsId, title, description, tourId, sportId };
    } catch (error) {
        throw new Error(`Error creating news for tour: ${error.message}`);
    }
};

//function to fetch news with matchId
exports.getNewsByMatchId = async (matchId) => {
    try {
        const query = `
            SELECT n.id, n.title, n.description, m.name AS matchName, t.name AS tourName
            FROM news n
            JOIN matches m ON n.matchId = m.id
            LEFT JOIN tours t ON n.tourId = t.id
            WHERE n.matchId = ?`;
        const [news] = await db.execute(query, [matchId]);
        return news;
    } catch (error) {
        throw new Error(`Error fetching news by match ID: ${error.message}`);
    }
};


//function to fetch news with tourId
exports.getNewsByTourId = async (tourId) => {
    try {
        const query = `
            SELECT n.id, n.title, n.description, t.name AS tourName, m.name AS matchName
            FROM news n
            LEFT JOIN tours t ON n.tourId = t.id
            LEFT JOIN matches m ON n.matchId = m.id
            WHERE n.tourId = ?`;
        const [news] = await db.execute(query, [tourId]);
        return news;
    } catch (error) {
        throw new Error(`Error fetching news by tour ID: ${error.message}`);
    }
};

//function to fetch news with sportId
exports.getNewsBySportId = async (sportId) => {
    try {
        const query = `
            SELECT n.id, n.title, n.description, m.name AS matchName, t.name AS tourName, s.name AS sportName
            FROM news n
            LEFT JOIN matches m ON n.matchId = m.id
            LEFT JOIN tours t ON n.tourId = t.id
            JOIN sports s ON n.sportId = s.id
            WHERE n.sportId = ?`;
        const [news] = await db.execute(query, [sportId]);
        return news;
    } catch (error) {
        throw new Error(`Error fetching news by sport ID: ${error.message}`);
    }
};


