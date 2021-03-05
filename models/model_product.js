var db = require('./database'); //nhúng model database vào đế kết nối db
var dataList=[]; // biến để chứa dữ liệu đổ về cho controller
var dataName = [];

// định nghĩa các hàm để tương tác vào mysql
exports.list = () => {
    // let sql = "SELECT * FROM product";
    // let query = db.query(sql, (err, result) => {
    //     console.log('List success');
    //     dataList = result;
    // })
    // return dataList;

    return new Promise( (hamOK, hamLoi) => {
        let sql = "SELECT * FROM product";
        db.query(sql, (err, d) => {
            console.log('List success');
            dataList = d;
            hamOK(dataList);
        })
        }
    )
}
exports.detail = (idProduct) => {
    // let sql = `SELECT * FROM product WHERE idProduct=${idProduct}`;
    // let query = db.query(sql, (err, d) => {
    //     console.log('Detail success');
    //     data = d[0];
    // })
    // return data;

    return new Promise( (hamOK, hamLoi) => {
        let sql = `SELECT * FROM product WHERE idProduct=${idProduct}`;
        db.query(sql, (err, d) => {
            console.log('List success');
            data = d[0];
            hamOK(data);
        })
        }
    )
}
exports.detailByName = (name) => {
    // let filterProduct;
    // let sql = `SELECT * FROM product`;
    // let query = db.query(sql, (err, d) => {
    //     console.log('Detail success');
    //     dataName = d;
    // })
    // for( i in dataName) {
    //     let product = dataName[i];
    //     let newName = replaceNameProduct(product.nameProduct.toLowerCase());
    //     if(newName === name) {
    //         filterProduct = product;
    //     }
    // }
    // return filterProduct;

    return new Promise( (hamOK, hamLoi) => {
            let filterProduct;
            let sql = `SELECT * FROM product`;
            let query = db.query(sql, (err, d) => {
                console.log('Detail success');
                dataName = d;
                for( i in dataName) {
                    let product = dataName[i];
                    let newName = replaceNameProduct(product.nameProduct.toLowerCase());
                    if(newName === name) {
                        filterProduct = product;
                    }
                }
                hamOK(filterProduct);
            })
            
        }
    )
}
exports.create = (name, shortDesc, images, description, dateUpdate, price, author, idCat, showHide) => {
    let data = {
        name: name,
        shortDesc: shortDesc,
        images: images,
        description: description,
        dateUpdate: dateUpdate,
        price: price,
        author: author,
        idCat: idCat,
        showHide: showHide,
    };
    let sql = "INSERT INTO products SET ?";
    let query = db.query(sql, data, (err, result) => {
        console.log('Create success');
    });
}
exports.update = (idProduct, name, shortDesc, images, description, dateUpdate, price, author, idCat, showHide) => {
    let sql = `UPDATE products SET 
                name='${name}', 
                shortDesc='${shortDesc}', 
                images='${images}',
                description='${description}',
                dateUpdate='${dateUpdate}',
                price='${price}',
                author='${author}',
                idCat='${idCat}',
                showHide='${showHide}',
                WHERE idProduct=${idProduct}`;
    let query = db.query(sql, (err, result) => {
        console.log('Update success');
    });
}
exports.delete = idProduct => {
    let sql = `DELETE FROM products WHERE idProduct=${idProduct}`;
    let query = db.query(sql, (err, result) => {
        console.log('Delete success');
    })
}

exports.hotProduct = () => {
    // let sql = "SELECT * FROM product WHERE views > 0 ORDER BY views DESC LIMIT 5";
    // let query = db.query(sql, (err, result) => {
    //     console.log('List success');
    //     dataList = result;
    // })
    // return dataList;

    return new Promise( (hamOK, hamLoi) => {
        let sql = "SELECT * FROM product WHERE views > 0 ORDER BY views DESC LIMIT 5";
        db.query(sql, (err, d) => {
            console.log('List success');
            dataList = d;
            hamOK(dataList);
        })
        }
    )
}

exports.newProduct = () => {
    // let sql = "SELECT * FROM product ORDER BY dateUpdate DESC LIMIT 5";
    // let query = db.query(sql, (err, result) => {
    //     console.log('List success');
    //     dataList = result;
    // })
    // return dataList;

    return new Promise( (hamOK, hamLoi) => {
        let sql = "SELECT * FROM product ORDER BY dateUpdate DESC LIMIT 5";
        db.query(sql, (err, d) => {
            console.log('List success');
            dataList = d;
            hamOK(dataList);
        })
        }
    )
}

function xoa_dau(str) {
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "a");
    str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "e");
    str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "i");
    str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "o");
    str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "u");
    str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "y");
    str = str.replace(/Đ/g, "d");
    str = str.split(' ').join('-');
    return str;
  }
  
  function replaceNameProduct(nameProduct) {
    var newNameProduct = xoa_dau(nameProduct);
    return newNameProduct;
  }

exports.createComment = (data) => {
    console.log(data);
    return new Promise( (resolve, reject) => {
        let sql = "INSERT INTO comment SET ?";
        db.query(sql, data, (err, d) => {
            console.log('Insert successfully')
            resolve(d);
        })
    })
}
exports.getComment = (idProduct) => {
    return new Promise( (resolve, reject) => {
        let sql = `SELECT * FROM comment WHERE idProduct=${idProduct}`;
        db.query(sql, (err, d) => {
            resolve(d);
        })
    })
}