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
        return;
    }
    console.log('Database is connected successfully \nServer is running on port localhost:3000');
});

module.exports = db;