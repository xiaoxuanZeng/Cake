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
  integral INT DEFAULT 0,                                     #积分(默认开始为0)
  merchant_name VARCHAR(32),                                  #真实姓名
  gender INT,                                                 #性别  0-女  1-男
  birth DATE                                                  #生日
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
  seq_state BOOLEAN                                          #销售状态(在销:1,下架:0)
);

/** 商品家族(分类) **/
CREATE TABLE cake_catalogue(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(32),                                        #分类的名称
  series VARCHAR(32),                                       #属于的系列
  pic VARCHAR(128)                                          #系列图片
);

/** 商品规格 **/
CREATE TABLE cake_spec(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,                                                 #商品的id
  size VARCHAR(16),                                        #尺寸
  price DECIMAL(10,2),                                     #价格
  is_state VARCHAR(3),                                     #状态(预定:0,现货:1)
  style VARCHAR(32),                                       #商品款式
  fruit VARCHAR(32),                                       #水果
  else_message VARCHAR(36),                                #其他的信息(其他无法归类的)
  repertory INT DEFAULT 0                                  #商品库存(默认0)
);

/** 图片表(商品详情的图片) **/
CREATE TABLE cake_pic(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,                                                 #商品的id
  details_pic VARCHAR(128)                                 #图片
);

/** 购物车表 **/
CREATE TABLE cake_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                                             #用户编号
  product_id INT,                                          #商品编号,
  sid INT,                                                 #规格的id
  count INT                                                #购买数量
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

/** 首页轮播表 **/
CREATE TABLE cake_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),                                       #轮播图片
  title VARCHAR(64),                                      #标题
  pid INT                                                 #商品id
);


/** 测试数据 **/
INSERT INTO cake_user VALUE
(NULL,"111",13642413775,123,DEFAULT,DEFAULT),
(NULL,"222",123,123,DEFAULT,DEFAULT);

INSERT INTO cake_cart VALUE
(NULL,1,1,1,10),
(NULL,1,1,3,100),
(NULL,2,1,1,10),
(NULL,2,1,3,100),
(NULL,2,1,2,50);


/** 录入数据 **/
/** 商品表 **/
INSERT INTO cake_product VALUE
(1,1,"芒果戚风",108,"images/product/64sd78f5465sda4159.jpg",0,0,NULL,NULL,1),
(2,1,"胡萝卜粗粮戚风",108,"64sd78f5465sda4158.jpg",0,0,NULL,NULL,1),
(3,1,"榴莲戚风",228,"64sd78f5465sda4158.jpg",0,0,NULL,NULL,1),
(4,1,"提拉米苏",188,"64sd78f5465sda4165.jpg",0,0,NULL,NULL,1),
(5,1,"小森林",188,"64sd78f5465sda4156.jpg",0,0,NULL,NULL,1),
(6,1,"泡芙黑森林",108,"64sd78f5465sda4156.jpg",0,0,NULL,NULL,1),
(7,1,"草莓黑森林",108,"64sd78f5465sda4154.jpg",0,0,NULL,NULL,1),
(8,1,"原味切达芝士",208,"64sd78f5465sda4168.jpg",0,0,NULL,NULL,1),
(9,1,"抹茶酸奶芝士",208,"64sd78f5465sda4162.jpg",0,0,NULL,NULL,1),
(10,1,"榛子慕斯",208,"64sd78f5465sda4169.jpg",0,0,NULL,NULL,1),
(11,1,"红茶千层",188,"64sd78f5465sda4155.jpg",0,0,NULL,NULL,1),
(12,1,"抹茶千层",188,"64sd78f5465sda4161.jpg",0,0,NULL,NULL,1),
(13,1,"栗子慕斯",208,"64sd78f5465sda4157.jpg",0,0,NULL,NULL,1),
(14,1,"抹茶白巧慕斯",188,"64sd78f5465sda4160.jpg",0,0,NULL,NULL,1),
(15,1,"巧克力缤纷水果戚风",108,"64sd78f5465sda4164.jpg",0,0,NULL,NULL,1),
(16,2,"测试",108,"64sd78f5465sda4164.jpg",0,0,NULL,NULL,1);


/** 商品规格 **/
INSERT INTO cake_spec value
(NULL,1,"4寸",108,-1,NULL,"芒果",NULL,97), 
(NULL,1,"5寸",139,-1,NULL,"芒果",NULL,97), 
(NULL,1,"6寸",188,-1,NULL,"芒果",NULL,97),
(NULL,1,"8寸",268,-1,NULL,"芒果",NULL,97),
(NULL,2,"6寸",108,-1,NULL,"芒果",NULL,97),
(NULL,2,"8寸",268,-1,NULL,"芒果",NULL,97),
(NULL,2,"10寸",328,-1,NULL,"芒果",NULL,97),
(NULL,2,"6寸",108,-1,NULL,"水蜜桃",NULL,100),
(NULL,2,"8寸",268,-1,NULL,"水蜜桃",NULL,100),
(NULL,2,"10寸",328,-1,NULL,"水蜜桃",NULL,100),
(NULL,3,"6寸",228,-1,NULL,NULL,NULL,97),
(NULL,3,"8寸",308,-1,NULL,NULL,NULL,97),
(NULL,4,"6寸",188,-1,NULL,NULL,NULL,97),
(NULL,4,"8寸",268,-1,NULL,NULL,NULL,97),
(NULL,5,"5寸",188,-1,NULL,",芒果",NULL,97),
(NULL,5,"8寸",318,-1,NULL,"芒果",NULL,97),
(NULL,5,"5寸",188,-1,NULL,"香蕉",NULL,97),
(NULL,5,"8寸",318,-1,NULL,"香蕉",NULL,97),
(NULL,5,"5寸",188,-1,NULL,"水蜜桃",NULL,97),
(NULL,5,"8寸",318,-1,NULL,"水蜜桃",NULL,97),
(NULL,6,"5寸",158,-1,NULL,"芒果",NULL,97),
(NULL,6,"8寸",288,-1,NULL,"芒果",NULL,97),
(NULL,7,"5寸",139,-1,NULL,"草莓",NULL,97),
(NULL,7,"8寸",268,-1,NULL,"草莓",NULL,97),
(NULL,8,"6寸",208,-1,NULL,NULL,NULL,97),
(NULL,8,"8寸",288,-1,NULL,NULL,NULL,97),
(NULL,9,"6寸",208,-1,NULL,NULL,NULL,97),
(NULL,9,"8寸",288,-1,NULL,NULL,NULL,97),
(NULL,10,"6寸",208,-1,NULL,NULL,NULL,97),
(NULL,10,"8寸",288,-1,NULL,NULL,NULL,97),
(NULL,10,"10寸",358,-1,NULL,NULL,NULL,97);


/** 商品家族(分类) **/
INSERT INTO cake_catalogue VALUE
(NULL,"蛋糕","经典系列",NULL),
(NULL,"蛋糕","当季新款",NULL),
(NULL,"蛋糕","MINI系列",NULL),
(NULL,"蛋糕","成人系列",NULL),
(NULL,"蛋糕","童真系列",NULL),
(NULL,"蛋糕","多重蛋糕",NULL),
(NULL,"小食","饼干小食",NULL),
(NULL,"甜点","当日甜点",NULL),
(NULL,"甜点","蛋糕卷",NULL),
(NULL,"礼盒","节日礼盒",NULL),
(NULL,"生日配件","生日配件",NULL),
(NULL,"积分换购","NULL",NULL),
(NULL,"甜品台布置","NULL",NULL),
(NULL,"周末半价日","周末半价",NULL);


/** 图片表(详情表) **/
INSERT INTO cake_pic VALUE
(NULL,1,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,2,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,3,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,4,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,5,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,6,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,7,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,8,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,9,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,10,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,11,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,12,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,13,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,14,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,15,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,16,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,17,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,18,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,19,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,20,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,21,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,22,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,23,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,24,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,25,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,26,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,27,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,28,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,29,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,30,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,31,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,32,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,33,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,34,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,35,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,36,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,37,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,38,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,39,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,40,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,41,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,42,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,43,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,44,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,45,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,46,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,47,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,48,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,49,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,50,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,51,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,52,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,53,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,54,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,55,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,56,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,57,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,58,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,59,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,60,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,61,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,62,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,63,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,64,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,65,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,66,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,67,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,68,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,69,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,70,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,71,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,72,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,73,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,74,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,75,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,76,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,77,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,78,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,79,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,80,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,81,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,82,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,83,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,84,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,85,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,86,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,87,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,88,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,89,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,90,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,91,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,92,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,93,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,94,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,95,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,96,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,97,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,98,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,99,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,100,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,101,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,102,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,103,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,104,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,105,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,106,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,107,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,108,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,109,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,110,"images/product/64sd78f5465sda4aa1.jpg"),
(NULL,111,"images/product/64sd78f5465sda4aa1.jpg");
