SET NAMES UTF8;
DROP DATABASE IF EXISTS wbiao;
CREATE DATABASE wbiao CHARSET=UTF8;
USE wbiao;

-- 创建用户,用户表的数据有待完善
create table wbiao_user(
    id  int( 10 ) not null AUTO_INCREMENT PRIMARY KEY,/*主键不为空自增长*/
    phone varchar(16) DEFAULT NULL,
    pwd varchar(20 ) not null
);
INSERT INTO wbiao_user VALUES(null,"18328092709","1111....");
/****首页轮播广告商品****/
DROP TABLE IF EXISTS `wbiao_carousel`;
CREATE TABLE `wbiao_carousel` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 品牌
CREATE TABLE brand (
	bid int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	brand varchar(50) NOT NULL,
	name_en varchar(50) NOT NULL,
	brand_img varchar(100) NOT NULL,
	level int(11) NOT NULL
);

-- 商品分类
CREATE TABLE category (
	id int(11) AUTO_INCREMENT PRIMARY KEY COMMENT '种类id',
	name varchar(255)
);

INSERT INTO category VALUES(NULL,'腕表');
INSERT INTO category VALUES(NULL,'表带');

-- 规格组表
CREATE TABLE spec (
	id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '规格组id',
	name varchar(255) NOT NULL
);

-- 规格值表
CREATE TABLE spec_value(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY  COMMENT '规格值id',
	value varchar(255) NOT NULL,
	s_id int(11)
);

-- 商品规格关系表
CREATE TABLE good_spec(
	id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键id',
	p_id int(11) NOT NULL,
	s_id int(11) NOT NULL,
	value_id int(11) NOT NULL
);

-- 商品
CREATE TABLE product (
	id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) NOT NULL COMMENT '商品名称',
	subtitle varchar(100),
	modeln varchar(50),
	num varchar(50) NOT NULL UNIQUE,
	price decimal(10,2) NOT NULL,
	wb_price decimal(10,2),
	stocks int(11) DEFAULT 0,
	distribution varchar(20),
	-- promise varchar(1000),
	-- service varchar(500),
	-- small_img varchar(100),
	-- big_img varchar(100),
	other_imgs text,
	detail text,
	style text,
	stage int(3) DEFAULT 12,
	stage_free boolean DEFAULT true,
	sale_n int(11),
	movie varchar(255),
	brand_id int(11) COMMENT '品牌id',
	c_id int(11) COMMENT '种类id'
);
-- 插入商品品牌

INSERT INTO brand VALUES (NULL,'江诗丹顿','Vacheron Constantin','https://image8.wbiao.co/mall/42511ec184ef4d7ebe4a48e989dcba3e.jpg',0);
INSERT INTO brand VALUES (NULL,'欧米茄','Vacheron Constantin','https://image8.wbiao.co/mall/f2cc31ae4c91408ca4feacd0106380fc.jpg',1);
INSERT INTO brand VALUES (NULL,'浪琴','Vacheron Constantin','https://image8.wbiao.co/mall/5eb7bc79998e455e829ae037f0ecf6cc.jpg',1);
INSERT INTO brand VALUES (NULL,'天梭','Vacheron Constantin','https://image8.wbiao.co/mall/7f57124ff8af4ef5bdb64a64ba4d0366.jpg',1);
INSERT INTO brand VALUES (NULL,'卡西欧','Vacheron Constantin','https://image8.wbiao.co/mall/b10d70fd3f1b42eba2ff2d58f4076633.jpg',1);
INSERT INTO brand VALUES (NULL,'佳明','Vacheron Constantin','https://image8.wbiao.co/mall/6df3f3a5a1554acfb1c3cd44848dbb30.jpg',1);
INSERT INTO brand VALUES (NULL,'积优','Vacheron Constantin','https://image8.wbiao.co/mall/ed770fa6782c4c9ea62d9ee9607de0f4.jpg',1);


-- 插入规格组数据
INSERT INTO spec VALUES (1,'使用人群');
INSERT INTO spec VALUES (2,'机芯类型');
INSERT INTO spec VALUES (3,'外壳材料');
INSERT INTO spec VALUES (4,'镜面材质');
INSERT INTO spec VALUES (5,'表盘直径');
INSERT INTO spec VALUES (6,'表带材质');
INSERT INTO spec VALUES (7,'表壳底盖');
INSERT INTO spec VALUES (8,'表盘形状');
INSERT INTO spec VALUES (9,'表带颜色');
INSERT INTO spec VALUES (10,'表盘刻度');
INSERT INTO spec VALUES (11,'表盘颜色');
INSERT INTO spec VALUES (12,'表扣类型');
INSERT INTO spec VALUES (13,'特殊功能');
INSERT INTO spec VALUES (14,'防水');
INSERT INTO spec VALUES (15,'佩戴场合');
INSERT INTO spec VALUES (16,'送礼对象');

-- 插入规格值
INSERT INTO spec_value VALUES (1,'男表',1);
INSERT INTO spec_value VALUES (2,'女表',1);
INSERT INTO spec_value VALUES (3,'情侣表',1);
INSERT INTO spec_value VALUES (4,'中性',1);

INSERT INTO spec_value VALUES (5,'石英',2);
INSERT INTO spec_value VALUES (6,'自动机械',2);
INSERT INTO spec_value VALUES (7,'手动机械',2);
INSERT INTO spec_value VALUES (8,'机械',2);
INSERT INTO spec_value VALUES (9,'光动能万年历',2);
INSERT INTO spec_value VALUES (10,'光能（光动能）',2);
INSERT INTO spec_value VALUES (11,'电波',2);

INSERT INTO spec_value VALUES (12,'钢',3);
INSERT INTO spec_value VALUES (13,'不锈钢',3);
INSERT INTO spec_value VALUES (14,'18k玫瑰金',3);
INSERT INTO spec_value VALUES (15,'18k黄金',3);

INSERT INTO spec_value VALUES (16,'蓝宝石水晶',4);
INSERT INTO spec_value VALUES (17,'蓝宝石玻璃',4);
INSERT INTO spec_value VALUES (18,'矿物玻璃',4);
INSERT INTO spec_value VALUES (19,'水晶玻璃',4);
INSERT INTO spec_value VALUES (20,'钢化玻璃',4);
INSERT INTO spec_value VALUES (21,'有机玻璃',4);

INSERT INTO spec_value VALUES (22,'主流35mm-40mm',5);
INSERT INTO spec_value VALUES (23,'大盘40mm-45mm',5);
INSERT INTO spec_value VALUES (24,'迷你25mm以下',5);
INSERT INTO spec_value VALUES (25,'小盘25mm-30mm',5);

INSERT INTO spec_value VALUES (26,'刚',6);
INSERT INTO spec_value VALUES (27,'真皮',6);
INSERT INTO spec_value VALUES (28,'牛皮',6);
INSERT INTO spec_value VALUES (29,'不锈钢',6);
INSERT INTO spec_value VALUES (30,'橡胶',6);

INSERT INTO spec_value VALUES (31,'透底',7);
INSERT INTO spec_value VALUES (32,'不透底',7);
INSERT INTO spec_value VALUES (33,'透窗',7);

INSERT INTO spec_value VALUES (34,'园形',8);
INSERT INTO spec_value VALUES (35,'方形',8);
INSERT INTO spec_value VALUES (36,'长方形',8);
INSERT INTO spec_value VALUES (37,'酒桶形',8);
INSERT INTO spec_value VALUES (38,'其它',8);

INSERT INTO spec_value VALUES (39,'黑色',9);
INSERT INTO spec_value VALUES (40,'银色',9);
INSERT INTO spec_value VALUES (41,'金色',9);
INSERT INTO spec_value VALUES (42,'棕色',9);
INSERT INTO spec_value VALUES (43,'蓝色',9);

INSERT INTO spec_value VALUES (44,'阿拉伯文',10);
INSERT INTO spec_value VALUES (45,'罗马文',10);
INSERT INTO spec_value VALUES (46,'条形',10);
INSERT INTO spec_value VALUES (47,'钻石',10);
INSERT INTO spec_value VALUES (48,'无刻度',10);
INSERT INTO spec_value VALUES (49,'其它',10);

INSERT INTO spec_value VALUES (50,'金色',11);
INSERT INTO spec_value VALUES (51,'黑色',11);
INSERT INTO spec_value VALUES (52,'白色',11);
INSERT INTO spec_value VALUES (53,'银色',11);
INSERT INTO spec_value VALUES (54,'灰色',11);

INSERT INTO spec_value VALUES (55,'针扣',12);
INSERT INTO spec_value VALUES (56,'折叠扣',12);
INSERT INTO spec_value VALUES (57,'蝴蝶扣',12);
INSERT INTO spec_value VALUES (58,'暗扣',12);

INSERT INTO spec_value VALUES (59,'日期显示',13);
INSERT INTO spec_value VALUES (60,'星期显示',13);
INSERT INTO spec_value VALUES (61,'月份显示',13);
INSERT INTO spec_value VALUES (62,'大三针',13);
INSERT INTO spec_value VALUES (63,'透窗',13);

INSERT INTO spec_value VALUES (64,'日常防水',14);
INSERT INTO spec_value VALUES (65,'30米',14);
INSERT INTO spec_value VALUES (66,'50米',14);
INSERT INTO spec_value VALUES (67,'60米',14);

INSERT INTO spec_value VALUES (68,'正装',15);
INSERT INTO spec_value VALUES (69,'商务休闲',15);
INSERT INTO spec_value VALUES (70,'时尚',15);
INSERT INTO spec_value VALUES (71,'运动',15);
INSERT INTO spec_value VALUES (72,'收藏',15);

INSERT INTO spec_value VALUES (73,'送老公',16);
INSERT INTO spec_value VALUES (74,'送父亲',16);
INSERT INTO spec_value VALUES (75,'送男友',16);
INSERT INTO spec_value VALUES (76,'送朋友',16);
INSERT INTO spec_value VALUES (77,'送同学',16);
INSERT INTO spec_value VALUES (78,'送母亲',16);

-- ----------------------------
-- Records of xz_index_carousel
-- ----------------------------
INSERT INTO `wbiao_carousel` VALUES ('1', 'https://image8.wbiao.co/mall/493e465377474e218379d035701c34c6.jpg', '轮播广告商品1', '/product?id=1');
INSERT INTO `wbiao_carousel` VALUES ('2', 'https://image8.wbiao.co/mall/5901634bea434b94815442230c5e10f8.jpg', '轮播广告商品2', '/product?id=1');
INSERT INTO `wbiao_carousel` VALUES ('3', 'https://image8.wbiao.co/mall/e395e0a0661f43b8b512e7a316bfa9fe.jpg', '轮播广告商品2', '/product?id=1');
INSERT INTO `wbiao_carousel` VALUES ('4', 'https://image8.wbiao.co/mall/7110cb8433c74c4083b37ca7fdd0ffe6.jpg', '轮播广告商品2', '/product?id=1');
INSERT INTO `wbiao_carousel` VALUES ('5', 'https://image8.wbiao.co/mall/67cc5d875dde4c6ebdd057ffdf9f17e9.jpg', '轮播广告商品2', '/product?id=1');
INSERT INTO `wbiao_carousel` VALUES ('6', 'https://image8.wbiao.co/mall/d20e29fad2c8449f903136f98d9ffdcb.jpg', '轮播广告商品2', '/product?id=1');
INSERT INTO `wbiao_carousel` VALUES ('7', 'https://image8.wbiao.co/mall/3ec6761cec39436a9222d105be404e4d.jpg', '轮播广告商品2', '/product?id=1');
INSERT INTO `wbiao_carousel` VALUES ('8', 'https://image8.wbiao.co/mall/7ad346040ebd42ae8e0126182600bcf3.jpg', '轮播广告商品2', '/product?id=1');
-- INSERT INTO `wbiao_carousel` VALUES ('3', 'https://www.xian.com/upload/system/2019-08/27/25703_4596.jpg', '轮播广告商品3', 'lookforward.html');

-- 插入商品
INSERT INTO product VALUES (1,'瑞士艺术制表大师 爱宝时（EPOS）-Emotion情感系列 日夜无间 3390.302.20.38.25 机械男表',NULL,'4600E/000A-B442','72019',97000,93500,10,'顺丰包邮','[{"s":"/public/images/biao/1_s.jpg","b":"/public/images/biao/1_b.jpg"},{"s":"/public/images/biao/1_1_s.jpg","b":"/public/images/biao/1_1_b.jpg"},{"s":"/public/images/biao/1_2_s.jpg","b":"/public/images/biao/1_2_b.jpg"},{"s":"/public/images/biao/1_3_s.jpg","b":"/public/images/biao/1_3_b.jpg"}]','','[{"title":"灰色 鳄鱼皮","pid":"1"}]',DEFAULT,DEFAULT,2000,"https://image8.wbiao.co/shop/8fe5640a2c2b47e3a1b04c27bad54426.mp4",1,1);
INSERT INTO product VALUES (2,'瑞士艺术制表大师 爱宝时（EPOS）-Emotion情感系列 日夜无间 3390.302.20.38.25 机械男表',NULL,'4600E/000A-B442','72020',87000,83500,10,'顺丰包邮','[{"s":"/public/images/biao/1_s.jpg","b":"/public/images/biao/1_b.jpg"},{"s":"/public/images/biao/1_1_s.jpg","b":"/public/images/biao/1_1_b.jpg"},{"s":"/public/images/biao/1_2_s.jpg","b":"/public/images/biao/1_2_b.jpg"},{"s":"/public/images/biao/1_3_s.jpg","b":"/public/images/biao/1_3_b.jpg"}]','','[{"title":"灰色 鳄鱼皮","pid":"1"}]',DEFAULT,DEFAULT,2000,"https://image8.wbiao.co/shop/8fe5640a2c2b47e3a1b04c27bad54426.mp4",1,1);
INSERT INTO product VALUES (3,'瑞士艺术制表大师 爱宝时（EPOS）-Emotion情感系列 日夜无间 3390.302.20.38.25 机械男表',NULL,'4600E/000A-B442','72059',97000,93500,10,'顺丰包邮','[{"s":"/public/images/biao/1_s.jpg","b":"/public/images/biao/1_b.jpg"},{"s":"/public/images/biao/1_1_s.jpg","b":"/public/images/biao/1_1_b.jpg"},{"s":"/public/images/biao/1_2_s.jpg","b":"/public/images/biao/1_2_b.jpg"},{"s":"/public/images/biao/1_3_s.jpg","b":"/public/images/biao/1_3_b.jpg"}]','','[{"title":"灰色 鳄鱼皮","pid":"1"}]',DEFAULT,DEFAULT,2000,"https://image8.wbiao.co/shop/8fe5640a2c2b47e3a1b04c27bad54426.mp4",1,1);
INSERT INTO product VALUES (4,'瑞士艺术制表大师 爱宝时（EPOS）-Emotion情感系列 日夜无间 3390.302.20.38.25 机械男表',NULL,'4600E/000A-B442','72209',97000,93500,10,'顺丰包邮','[{"s":"/public/images/biao/1_s.jpg","b":"/public/images/biao/1_b.jpg"},{"s":"/public/images/biao/1_1_s.jpg","b":"/public/images/biao/1_1_b.jpg"},{"s":"/public/images/biao/1_2_s.jpg","b":"/public/images/biao/1_2_b.jpg"},{"s":"/public/images/biao/1_3_s.jpg","b":"/public/images/biao/1_3_b.jpg"}]','','[{"title":"灰色 鳄鱼皮","pid":"1"}]',DEFAULT,DEFAULT,2000,"https://image8.wbiao.co/shop/8fe5640a2c2b47e3a1b04c27bad54426.mp4",1,1);
INSERT INTO product VALUES (5,'瑞士艺术制表大师 爱宝时（EPOS）-Emotion情感系列 日夜无间 3390.302.20.38.25 机械男表',NULL,'4600E/000A-B442','82019',97000,93500,10,'顺丰包邮','[{"s":"/public/images/biao/1_s.jpg","b":"/public/images/biao/1_b.jpg"},{"s":"/public/images/biao/1_1_s.jpg","b":"/public/images/biao/1_1_b.jpg"},{"s":"/public/images/biao/1_2_s.jpg","b":"/public/images/biao/1_2_b.jpg"},{"s":"/public/images/biao/1_3_s.jpg","b":"/public/images/biao/1_3_b.jpg"}]','','[{"title":"灰色 鳄鱼皮","pid":"1"}]',DEFAULT,DEFAULT,2000,"https://image8.wbiao.co/shop/8fe5640a2c2b47e3a1b04c27bad54426.mp4",1,1);
INSERT INTO product VALUES (6,'瑞士艺术制表大师 爱宝时（EPOS）-Emotion情感系列 日夜无间 3390.302.20.38.25 机械男表',NULL,'4600E/000A-B442','32019',97000,93500,0,'顺丰包邮','[{"s":"/public/images/biao/1_s.jpg","b":"/public/images/biao/1_b.jpg"},{"s":"/public/images/biao/1_1_s.jpg","b":"/public/images/biao/1_1_b.jpg"},{"s":"/public/images/biao/1_2_s.jpg","b":"/public/images/biao/1_2_b.jpg"},{"s":"/public/images/biao/1_3_s.jpg","b":"/public/images/biao/1_3_b.jpg"}]','','[{"title":"灰色 鳄鱼皮","pid":"1"}]',DEFAULT,DEFAULT,2000,"https://image8.wbiao.co/shop/8fe5640a2c2b47e3a1b04c27bad54426.mp4",1,1);

-- 插入商品规格关系表
INSERT INTO good_spec VALUES (1,1,1,1);
INSERT INTO good_spec VALUES (2,1,2,6);
INSERT INTO good_spec VALUES (3,1,3,12);
INSERT INTO good_spec VALUES (4,1,4,16);
INSERT INTO good_spec VALUES (5,1,5,22);
INSERT INTO good_spec VALUES (6,1,6,26);
INSERT INTO good_spec VALUES (7,1,7,31);
INSERT INTO good_spec VALUES (8,1,8,34);
INSERT INTO good_spec VALUES (9,1,9,39);
INSERT INTO good_spec VALUES (10,1,10,44);
INSERT INTO good_spec VALUES (11,1,11,50);
INSERT INTO good_spec VALUES (12,1,12,55);
INSERT INTO good_spec VALUES (13,1,13,59);
INSERT INTO good_spec VALUES (14,1,14,64);
INSERT INTO good_spec VALUES (15,1,15,68);
INSERT INTO good_spec VALUES (16,1,16,73);
INSERT INTO good_spec VALUES (17,1,16,74);

