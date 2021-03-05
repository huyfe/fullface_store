var express = require('express');
var router = express.Router();
var db = require('../models/database')
var modelUser = require('../models/model_user');
const bcrypt = require("bcrypt");

/* GET users listing. */
router.get('/tai-khoan', function(req, res, next) {
    if (req.session.User) {
        res.render("site/my-account.ejs", { user: req.session.User });
    } else {
        req.session.back = "/users/tai-khoan";
        res.redirect("/users/dang-nhap");
    }
});
router.get('/dang-nhap', function(req, res, next) {
    res.render('site/dang-nhap.ejs')
});
router.post('/dang-nhap', function(req, res, next) {
    let u = req.body.username;
    let p = req.body.password;
    let sql = `SELECT * FROM user WHERE username = '${u}' OR email = '${u}'`;
    db.query(sql, (err, rows) => {
        if (rows.length <= 0) {
            res.redirect("/users/dang-nhap");
            return;
        }
        let user = rows[0];
        let pass_fromdb = user.password;
        console.log(pass_fromdb);
        var kq = bcrypt.compareSync(p, pass_fromdb);
        console.log(kq)
        if (kq) {
            req.session.User = {
                id: user.idUser,
                username: user.username,
                ho: user.ho,
                ten: user.ten,
                phone: user.phone,
                email: user.email,
                address: user.address,
                logIn: true
            };
            console.log("OK");
            if (req.session.back) {
                console.log(req.session.back);
                res.redirect(req.session.back);
            } else {
                res.redirect("/");
            }
        } else {
            console.log("Not OK");
            res.redirect("/users/dang-nhap");
        }
    });
});
router.get('/dang-ky', function(req, res, next) {
    res.render('site/dang-ky.ejs')
});
router.post('/luu', function(req, res, next) {
    let ho = req.body.ho;
    let ten = req.body.ten;
    let u = req.body.username;
    let em = req.body.email;
    let phone = req.body.phone;
    let p = req.body.password;
    let rp = req.body.retypePassword;
    let address = req.body.address;

    if (p === rp && p != "") {

        var salt = bcrypt.genSaltSync(10);
        var pass_mahoa = bcrypt.hashSync(p, salt);

        let user_info = { ho: ho, ten: ten, email: em, username: u, password: pass_mahoa, phone: phone, address: address };

        let sql = 'INSERT INTO user SET ?';
        db.query(sql, user_info);
    } else {
        res.redirect("/users/dang-ky");
    }

    res.redirect("/users/thanh-cong");
})
router.get('/thanh-cong', function(req, res, next) {
    let message = "Đăng ký thành công";
    res.render('site/thanh-cong', { message: message })
})
router.get('/dang-xuat', function(req, res, next) {
    req.session.destroy();
    res.redirect("/users/dang-nhap");
});
router.post('/doi-mat-khau', function(req, res, next) {
    let password = req.body.password;
    let newPassword = req.body.newPassword;
    let confirmPassword = req.body.confirmPassword;
    let u = req.session.User.username;
    console.log(u)
    let sql = 'SELECT * FROM user WHERE username = ?';
    db.query(sql, [u], (err, rows) => {
        if (rows.length <= 0) { res.redirect("/users/error"); return; }
        let user = rows[0];
        let pass_fromdb = user.password;
        var kq = bcrypt.compareSync(password, pass_fromdb);
        if (kq) {
            if (newPassword === confirmPassword) {
                var salt = bcrypt.genSaltSync(10);
                var pass_mahoa = bcrypt.hashSync(newPassword, salt);
                let sql2 = `UPDATE user SET password='${pass_mahoa}' WHERE username LIKE '%${u}%'`;
                db.query(sql2, (err, result) => {
                    console.log('Update success');
                    let mess = "Đổi mật khẩu thành công";
                    res.render('site/thanh-cong', { message: mess })
                });
            }
        }
    });
})

router.get('/quen-mat-khau', (req, res) => {
    res.render('site/quen-mat-khau', { message: '' });
})
router.post('/quen-mat-khau', async(req, res) => {
    let email = req.body.email;
    let checkEmail = await modelUser.checkEmail(email); // Kiểm tra email có trong database hay không

    if (email == '') {
        let mess = "Mời bạn nhập email";
        res.render('site/quen-mat-khau', { message: mess });
    }
    if (checkEmail) { // Nếu email có trong database
        let mess = `Mật khẩu đã được gửi qua email ${email} của bạn!`;
        let newPassword = Math.random().toString(36).substring(7);

        var salt = bcrypt.genSaltSync(10);
        var pass_mahoa = bcrypt.hashSync(newPassword, salt);
        let sql = `UPDATE user SET password='${pass_mahoa}' WHERE email='${email}' `;
        db.query(sql, (err, result) => { console.log('Update success'); });

        var nodemailer = require('nodemailer'); // Nhúng module nodemailer để gửi password vào email của khách hàng

        var transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: { user: '', pass: '' }, // Email của người gửi
            tls: { rejectUnauthorized: false }
        });

        var mailOptions = {
            from: 'kenbi.njr@gmail.com', //Email người gửi
            to: `${email}`, // Email người nhận
            subject: 'Lấy lại mật khẩu',
            //text: 'Nội dung thư, không có code html'
            html: `Cửa hàng Fullfacestore xin gửi lại mật khẩu của bạn. <br>
      Your password: <b style="padding: 5px 7px; background: #eee; color: red"> ${newPassword} </b>`, // Nội dung thư, có thể có code html
        };

        transporter.sendMail(mailOptions, function(error, info) {

            if (error) console.log(error);
            else console.log('Đã gửi mail: ' + info.response);
            res.render('site/thanh-cong', { message: mess });
        });
    } else {
        let mess = "Email không tồn tại!";
        res.render('site/quen-mat-khau', { message: mess });
    }
})

module.exports = router;