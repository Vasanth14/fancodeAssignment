const mysql = require('../lib/mysql');

const getAllTours = async () => {
    const statement = 'select * from tours;';
    const parameters = [];
    return await mysql.query(statement, parameters);
}

const getMatchesByTourName = async params => {
    const statement = 'select m.* from matches m join tours t on m.tourId = t.id where t.name = ?';
    const parameters = [ params.name ];
    return await mysql.query(statement, parameters);
}

module.exports = {
    getAllTours: getAllTours,
    getMatchesByTourName: getMatchesByTourName
}