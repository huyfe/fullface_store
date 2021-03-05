var db = require('./database'); //nhúng model database vào đế kết nối db
var itemCat=[]; // biến để chứa dữ liệu đổ về cho controller
var dataList=[];
var dataListPro=[];

// định nghĩa các hàm để tương tác vào mysql
exports.list = async () => {
    // let sql = "SELECT * FROM catalog";
    // let query = await db.query(sql, (err, result) => {
    //     console.log('Get List catalog success');
    //     dataList = result;
    // })
    // return dataList;
    return new Promise( (hamOK, hamLoi) => {
        let sql = "SELECT * FROM catalog";
        db.query(sql, (err, d) => {
            console.log('List success');
            dataList = d;
            hamOK(dataList);
        })
        }
    )
}
exports.listByName = async (nameCat) => {
    // let sql = `SELECT * FROM catalog WHERE nameCat='${nameCat}'`;
    // let query = await db.query(sql, (err, result) => {
    //     console.log('Get idCat by nameCat success');
    //     itemCat = result[0].idCat;
    // })
    // let sql2 = `SELECT * FROM product WHERE idCat=${itemCat}`;
    // let query2 = await db.query(sql2, (err, result) => {
    //     console.log('Get list product by id Cat success');
    //     dataListPro = result;
    // })
    // return dataListPro;

    return new Promise( (hamOK, hamLoi) => {
        let sql = `SELECT * FROM catalog WHERE nameCat='${nameCat}'`;
        db.query(sql, (err, result) => {
            console.log('Get idCat by nameCat success');
            itemCat = result[0].idCat;
        })
        let sql2 = `SELECT * FROM product WHERE idCat=${itemCat}`;
        db.query(sql2, (err, result) => {
            console.log('Get list product by id Cat success');
            dataListPro = result;
            hamOK(dataListPro);
        })
        }
    )
}