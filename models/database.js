var mysql = require('mysql');
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'fullface_shop'
})

db.connect(function (err) {
    if (err) {
        console.log("Database is failed to connect!", error);
    }
    console.log('Database is connected successfully!', err);
});

module.exports = db;