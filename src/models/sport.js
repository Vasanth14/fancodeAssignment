const mysql = require('../lib/mysql');

const getAllSportsToursAndMatches = async () => {
    const statement = 'select m.id, s.name as sportName, t.name as tourName, m.name as matchName, m.startTime, m.format ' +
        'from matches m inner join tours t on m.tourId = t.id ' +
        'inner join sports s on t.sportId = s.id';
    const parameters = [];
    return await mysql.query(statement, parameters);
};


module.exports = {
    getAllSportsToursAndMatches: getAllSportsToursAndMatches
}