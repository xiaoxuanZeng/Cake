// 引入express
const express = require("express");
// 引入连接池
const pool = require("../pool");
// 创建路由器
var router = express.Router();

router.post("/login", (req, res) => {
  var phone = req.query.phone;
  var upwd = req.query.upwd;

  if (!phone) {
    res.send({ code: -400, msg: "手机号不能为空" });
    return;
  }
  if (!upwd) {
    res.send({ code: -400, msg: "密码不能为空" });
    return;
  }

  var sql = "SELECT uid FROM cake_user WHERE phone upwd";
})



module.exports = router;