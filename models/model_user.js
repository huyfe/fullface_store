var db = require('./database'); //nhúng model database vào đế kết nối db

exports.checkEmail = (email) => {
    return new Promise( (hamOK, hamLoi) => {
        let sql = `SELECT * FROM user WHERE email = '${email}'`;
        db.query(sql, (err, d) => {
            console.log('List success');
            data = d[0];
            hamOK(data);
        })
        }
    )
}
exports.checkUsername = (username) => {
    return new Promise( (hamOK, hamLoi) => {
        let sql = `SELECT * FROM user WHERE username = '${username}'`;
        db.query(sql, (err, d) => {
            console.log('List success');
            data = d[0];
            hamOK(data);
        })
        }
    )
}
