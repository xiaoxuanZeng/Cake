SET NAMES UTF8;
DROP DATABASE IF EXISTS cake;
CREATE DATABASE cake CHARSET=UTF8;
USE cake;

/** 用户表 **/
CREATE TABLE cake_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(50),                                          #用户名
  phone VARCHAR(16),                                          #手机号(登陆的账号)
  upwd VARCHAR(32),                                           #登陆密码
  avatar VARCHAR(128) DEFAULT "默认一张登陆后的头像",           #头像
  integral INT DEFAULT 0                                      #积分(默认开始为0)
);

/** 商家用户表 **/
CREATE TABLE cake_merchant(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  mname VARCHAR(50),                                          #用户名
  phone VARCHAR(16),                                          #手机号(登陆的账号)
  mpwd VARCHAR(32),                                           #登陆密码
  avatar VARCHAR(128) DEFAULT "默认一张登陆后的头像",           #头像
  merchant_name VARCHAR(32),                                  #真实姓名
  gender INT,                                                 #性别  0-女  1-男
  shop VARCHAR(128)                                           #店铺
);

/** 商品表 **/
CREATE TABLE cake_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  cid INT,                                                   #商品分类
  pname VARCHAR(128),                                        #商品名称
  price DECIMAL(10,2),                                       #价格
  pic VARCHAR(128),                                          #商品图片
  sales_volume INT,                                          #销售量
  read_num INT DEFAULT 0,                                    #用户阅览数
  shelf_time BIGINT,                                         #上架时间
  sold_out_time BIGINT,                                      #下架时间
  is_Sell_well BOOLEAN,                                      #是否热销(是为1,否为0)
  seq_state BOOLEAN                                          #销售状态(在销:1,下架:0)
);

/** 商品家族(分类) **/
CREATE TABLE cake_catalogue(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(32),                                        #分类的名称
  series VARCHAR(32)                                        #属于的系列
);

/** 商品规格 **/
CREATE TABLE cake_spec(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,                                                 #商品的id
  size VARCHAR(16),                                        #尺寸
  is_state BOOLEAN,                                        #状态(预定:0,现货:1)
  style VARCHAR(32),                                       #商品款式
  fruit VARCHAR(32),                                       #水果
  else_message VARCHAR(36),                                #其他的信息(其他无法归类的)
  repertory INT DEFAULT 0                                  #商品库存(默认0)
);

/** 图片表 **/
CREATE TABLE cake_pic(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,                                                 #商品的id
  pic VARCHAR(128)                                         #图片
);

INSERT INTO cake_pic VALUES(NULL,60,"images/product/64sd78f5465sda4153.jpg");
INSERT INTO cake_pic VALUES(NULL,61,"images/product/64sd78f5465sda4154.jpg");
INSERT INTO cake_pic VALUES(NULL,62,"images/product/64sd78f5465sda4155.jpg");
INSERT INTO cake_pic VALUES(NULL,63,"images/product/64sd78f5465sda4156.jpg");
INSERT INTO cake_pic VALUES(NULL,64,"images/product/64sd78f5465sda4157.jpg");
INSERT INTO cake_pic VALUES(NULL,65,"images/product/64sd78f5465sda4158.jpg");
INSERT INTO cake_pic VALUES(NULL,66,"images/product/64sd78f5465sda4159.jpg");
INSERT INTO cake_pic VALUES(NULL,67,"images/product/64sd78f5465sda416.jpg");
INSERT INTO cake_pic VALUES(NULL,68,"images/product/64sd78f5465sda416.png");
INSERT INTO cake_pic VALUES(NULL,69,"images/product/64sd78f5465sda4160.jpg");
INSERT INTO cake_pic VALUES(NULL,70,"images/product/64sd78f5465sda4161.jpg");
INSERT INTO cake_pic VALUES(NULL,71,"images/product/64sd78f5465sda4162.jpg");
INSERT INTO cake_pic VALUES(NULL,72,"images/product/64sd78f5465sda4163.jpg");
INSERT INTO cake_pic VALUES(NULL,73,"images/product/64sd78f5465sda4164.jpg");
INSERT INTO cake_pic VALUES(NULL,74,"images/product/64sd78f5465sda4165.jpg");
INSERT INTO cake_pic VALUES(NULL,75,"images/product/64sd78f5465sda4166.jpg");
INSERT INTO cake_pic VALUES(NULL,76,"images/product/64sd78f5465sda4167.jpg");
INSERT INTO cake_pic VALUES(NULL,77,"images/product/64sd78f5465sda4168.jpg");
INSERT INTO cake_pic VALUES(NULL,78,"images/product/64sd78f5465sda4169.jpg");
INSERT INTO cake_pic VALUES(NULL,79,"images/product/64sd78f5465sda417.jpg");
INSERT INTO cake_pic VALUES(NULL,80,"images/product/64sd78f5465sda4170.jpg");
INSERT INTO cake_pic VALUES(NULL,81,"images/product/64sd78f5465sda4171.jpg");
INSERT INTO cake_pic VALUES(NULL,82,"images/product/64sd78f5465sda4172.jpg");
INSERT INTO cake_pic VALUES(NULL,83,"images/product/64sd78f5465sda4173.jpg");
INSERT INTO cake_pic VALUES(NULL,84,"images/product/64sd78f5465sda4174.jpg");
INSERT INTO cake_pic VALUES(NULL,85,"images/product/64sd78f5465sda4175.jpg");
INSERT INTO cake_pic VALUES(NULL,86,"images/product/64sd78f5465sda4176.jpg");
INSERT INTO cake_pic VALUES(NULL,87,"images/product/64sd78f5465sda4177.jpg");
INSERT INTO cake_pic VALUES(NULL,88,"images/product/64sd78f5465sda4178.jpg");
INSERT INTO cake_pic VALUES(NULL,89,"images/product/64sd78f5465sda4179.jpg");
INSERT INTO cake_pic VALUES(NULL,90,"images/product/64sd78f5465sda418.jpg");
INSERT INTO cake_pic VALUES(NULL,91,"images/product/64sd78f5465sda4181.jpg");
INSERT INTO cake_pic VALUES(NULL,92,"images/product/64sd78f5465sda4182.jpg");
INSERT INTO cake_pic VALUES(NULL,93,"images/product/64sd78f5465sda4183.jpg");
INSERT INTO cake_pic VALUES(NULL,94,"images/product/64sd78f5465sda4184.jpg");
INSERT INTO cake_pic VALUES(NULL,95,"images/product/64sd78f5465sda4185.jpg");
INSERT INTO cake_pic VALUES(NULL,96,"images/product/64sd78f5465sda4186.jpg");
INSERT INTO cake_pic VALUES(NULL,97,"images/product/64sd78f5465sda4187.jpg");
INSERT INTO cake_pic VALUES(NULL,98,"images/product/64sd78f5465sda4188.jpg");
INSERT INTO cake_pic VALUES(NULL,99,"images/product/64sd78f5465sda4189.jpg");
INSERT INTO cake_pic VALUES(NULL,100,"images/product/64sd78f5465sda419.jpg");
INSERT INTO cake_pic VALUES(NULL,101,"images/product/64sd78f5465sda4190.jpg");
INSERT INTO cake_pic VALUES(NULL,102,"images/product/64sd78f5465sda4191.jpg");
INSERT INTO cake_pic VALUES(NULL,103,"images/product/64sd78f5465sda4192.jpg");
INSERT INTO cake_pic VALUES(NULL,104,"images/product/64sd78f5465sda4193.jpg");
INSERT INTO cake_pic VALUES(NULL,105,"images/product/64sd78f5465sda4198.jpg");


/** 购物车表 **/
CREATE TABLE cake_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                                             #用户编号
  product_id INT,                                          #商品编号
  count INT,                                               #购买数量
  is_state BOOLEAN                                         #购买商品时的状态(预定:0,现货:1)
);

/**用户订单**/
CREATE TABLE cake_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                                            #用户编号
  address_id INT,                                         #收货地址id
  status INT,                                             #订单状态(1等待付款,2等待发货,3运输中,4已签收,5已取消)
  order_time BIGINT,                                      #下单时间
  pay_time BIGINT,                                        #付款时间
  deliver_time BIGINT,                                    #发货时间
  received_time BIGINT                                    #签收时间
)AUTO_INCREMENT=10000000;                                 #从10000000开始自增

/**用户订单**/
CREATE TABLE cake_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,                                           #订单编号
  product_id INT,                                         #产品编号
  count INT                                               #购买数量
);

/**收货地址信息**/
CREATE TABLE cake_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                                            #用户编号
  receiver VARCHAR(16),                                   #接收人姓名
  province VARCHAR(16),                                   #省
  city VARCHAR(16),                                       #市
  county VARCHAR(16),                                     #县
  address VARCHAR(128),                                   #详细地址
  cellphone VARCHAR(16),                                  #手机
  fixedphone VARCHAR(16),                                 #固定电话
  postcode CHAR(6),                                       #邮编
  tag VARCHAR(16),                                        #标签名
  is_default BOOLEAN                                      #是否为当前用户的默认收货地址
);