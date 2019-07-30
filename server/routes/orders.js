// 引入express
const express = require("express");
// 引入连接池
const pool = require("../pool");
// 创建路由器
var router = express.Router();


//提交订单
router.get("/order", (req, res) => {
  var order_id = req.query.order_id;
  var product_id = req.query.product_id;
  var count = req.query.count;
  var difference = req.query.difference;
  var sql = `INSERT INTO cake_order_detail VALUES(NULL,?,?,?,?)`;
  pool.query(sql, [order_id, product_id, count, difference], (err, result) => {
    if (err) throw err;
    res.send(result)
  })
})
router.get("/user_order", (req, res) => {
  var user_id = req.user;
  var order_id = req.query.order_id;
  var status = req.query.status;
  var order_time = req.query.order_time;
  var sql = `INSERT INTO cake_order VALUES(NULL,?,?,NULL,?,?,NULL,NULL,NULL)`;
  pool.query(sql, [user_id, order_id, status, order_time], (err, result) => {
    if (err) throw err;
    res.send(result)
  })
})



//订单页
// 订单页面获取订单信息
router.get("/order_list", (req, res) => {
  var uid = req.user;
  var status = req.query.status;

  if (!uid) {
    res.send({ code: 400, msg: "还没有登录" });
    return;
  }
  var sql = `SELECT user_id,cake_order.order_id,status,order_time,count,product_id,difference,pic,status,
  cake_spec.price,size,is_state,style,pname,fruit,else_message FROM ((cake_order INNER JOIN cake_order_detail ON cake_order.user_id=? AND cake_order.order_id=
  cake_order_detail.order_id) INNER JOIN cake_product ON
  cake_order_detail.product_id=cake_product.pid) INNER JOIN 
  cake_spec ON cake_spec.pid=cake_product.pid and cake_spec.sid=cake_order_detail.difference ORDER BY 
  cake_order.oid DESC`;
  // 查询别的状态
  var sql2 = `SELECT user_id,cake_order.order_id,status,order_time,count,product_id,difference,pic,status,
  cake_spec.price,size,is_state,style,pname,fruit,else_message FROM ((cake_order INNER JOIN cake_order_detail ON cake_order.user_id=? AND cake_order.order_id=
  cake_order_detail.order_id AND cake_order.status=?) INNER JOIN cake_product ON
  cake_order_detail.product_id=cake_product.pid) INNER JOIN 
  cake_spec ON cake_spec.pid=cake_product.pid and cake_spec.sid=cake_order_detail.difference ORDER BY 
  cake_order.oid DESC`;

  var sql = status == 0 ? sql : sql2;
  pool.query(sql, [uid, status], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 200, data: result });
    } else {
      res.send({ code: 400, msg: "没有订单生成" });
    }
  })
})


// 取消订单
router.post("/del_order", (req, res) => {
  var uid = req.user;
  var order_id = req.body.order_id;
  var status = req.body.status;

  var sql = "UPDATE cake_order SET status=? WHERE user_id=? AND order_id=?";
  pool.query(sql, [status, uid, order_id], (err, result) => {
    if (err) throw err;
    // console.log(result);
    if (result.affectedRows > 0) {
      res.send({ code: 200, msg: "取消订单成功" });
    }
  })
})




module.exports = router;