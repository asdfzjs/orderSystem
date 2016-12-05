-- ----------------------------
-- Table structure for t_account 会员账户信息表（会员主表）
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
create table t_account(
	`id` int auto_increment primary key COMMENT '自增序列号',
	`mem_id` char(13) not null COMMENT '会员号，e开头，接12位自增数字，代表企业客户',
	`uname` varchar(50) not null COMMENT '用户名/登录帐号，目前为手机号，与phone字段相同',
	`password` varchar(50) not null COMMENT '密码',
	`email` varchar(50) not null COMMENT '邮箱',
	`phone` varchar(20) not null COMMENT '手机号',
	`registTime` datetime not null COMMENT '注册时间',
  `channel` char(2) default "00" COMMENT '渠道， 00:代表全渠道； 01：web端；02：APP',
  `status` char(2) not null COMMENT '状态:  01:正常使用，02：已注销，03：停用 ',
	unique index mem_id(mem_id)
);

-- ----------------------------
-- Table structure for t_account_addresses 会员账户常用地址信息表
-- ----------------------------
DROP TABLE IF EXISTS `t_account_addresses`;
create table t_account_addresses(
	`id` int auto_increment primary key COMMENT '自增序列号',
	`mem_id` char(13) not null COMMENT '会员号，同会员信息主t_account',
	`address` varchar(200) not null COMMENT '收货地址',
  `default` tinyint(200) default 0 COMMENT '缺省地址， 1为缺省地址；0为非缺省地址。 缺省地址在提交订单时默认带出，选择地址时，出现在最前面'
);

-- ----------------------------
-- Table structure for t_enterprise 企业会员信息扩展表
-- ----------------------------
DROP TABLE IF EXISTS `t_enterprise`;
create table t_enterprise(
	`id` int auto_increment primary key COMMENT '自增序列号',
	`mem_id` char(13) not null COMMENT '会员号，同会员信息主t_account',
	`title` varchar(50) not null COMMENT '发票抬头',
	`fullname` varchar(50) not null COMMENT '经销商全称',
  `province` char(2) not null COMMENT '经销商所在省',
  `city` char(2) not null COMMENT '经销商所在市',
  `address` varchar(50)  COMMENT '经销商详细地址',
	`contact` varchar(50) not null COMMENT '联系人',
  `telephone` varchar(20) not null COMMENT '联系电话',
  `fax` varchar(20) not null COMMENT '传真',
	`registTime` datetime not null COMMENT '注册时间',
  `startdate` datetime not null COMMENT '生效日期，缺省为注册时间',
  `enddate` datetime  COMMENT '失效日期，为空时，代表一直有效',
  unique index mem_id(mem_id)
);

-- ----------------------------
-- Table structure for t_commodity 商品信息表（商品主表）
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity`;
create table t_commodity(
	`id` int auto_increment primary key COMMENT '自增序列号',
  `commodityID` varchar(20) NOT NULL COMMENT '商品id',
  `commdityCategoryID` char(2) NOT NULL COMMENT '商品类别id',
  `commditySeriesID` char(4) NOT NULL COMMENT '商品系列id',
  `commdityName` varchar(20) NOT NULL COMMENT '商品名',
  `specification` varchar(50) NOT NULL COMMENT '商品规格',
  `commdityLevelID` char(2) NOT NULL COMMENT '商品品质等级id',
  `length` decimal(10,2) NOT NULL  COMMENT '长度',
  `width` decimal(10,2) NOT NULL COMMENT '宽度',
  `height` decimal(10,2) NOT NULL COMMENT '高度',
  `price` decimal(10,2) NOT NULL COMMENT '价格（元）',
  `sizeunit` varchar(10) COMMENT '长度单位，缺省‘米’',
  `priceunit` varchar(10) COMMENT '计量单位，01:平方米; 02:片；',
  `description` varchar(300) NOT NULL COMMENT '商品描述字段，用于模糊搜索，值为“商品名|商品类别名称|商品系列名称|商品规格|商品品质等级名称|商品id”这些字段以竖线链接后的文本',
  `status` char(2) NOT NULL COMMENT '状态:  01:上架，02：下架 -- 只有上架的商品，才能被购买',
	unique index com_id(commodityID)
);

-- ----------------------------
-- Table structure for t_commodity_category 商品类别代码表
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity_category`;
create table t_commodity_category(
  `commdityCategoryID` char(2) NOT NULL COMMENT '商品类别id',
  `commdityCategoryName` varchar(20) NOT NULL COMMENT '商品类别名称',
  PRIMARY KEY (`commdityCategoryID`)
);

-- ----------------------------
-- Table structure for t_commodity_series 商品系列代码表
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity_series`;
create table t_commodity_series(
  `commdityCategoryID` char(2) NOT NULL COMMENT '商品类别id',
  `commditySeriesID` char(4) NOT NULL COMMENT '商品系列id',
  `commditySeriesName` varchar(20) NOT NULL COMMENT '商品系列名称',
  PRIMARY KEY (`commdityCategoryID`, `commditySeriesID`)
);

-- ----------------------------
-- Table structure for t_commodity_level 商品品质等级代码表
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity_level`;
create table t_commodity_level(
  `commdityCategoryID` char(2) NOT NULL COMMENT '商品类别id',
  `commditySeriesID` char(4) NOT NULL COMMENT '商品系列id',
  `commdityLevelID` char(2) NOT NULL COMMENT '商品品质等级id',
  `commdityLevelName` varchar(20) NOT NULL COMMENT '商品品质等级名称',
  PRIMARY KEY (`commdityCategoryID`, `commditySeriesID`, `commdityLevelID`)
);

-- ----------------------------
-- Table structure for t_order 订单主表
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '自增序列号',
  `orderID` char(16) NOT NULL COMMENT '订单号，16位长，自增',
  `orderType` char(2) NOT NULL DEFAULT '01' COMMENT '订单类型 01 - 默认类型',
  `orderStatus` char(2) NOT NULL DEFAULT '01' COMMENT '订单状态：01 - 草稿状态；10 - 待审核； 02 - 待支付；11 - 待审核；06 - 待发货；08 - 待收货； 09 - 已收货',
  `seller` int(11) NOT NULL COMMENT '卖家 常量：2',
  `buyer` int(11) NOT NULL COMMENT '经销商',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `deliveryDate` date COMMENT '送货时间',
  `urgent` varchar(10) COMMENT '紧急程度，空为不紧急；如经销商填写了预期送货日期，则转换成文本格式后记录在此字段',
  `ceateTime` datetime NOT NULL COMMENT '下单时间',
  `updateTime` datetime DEFAULT NULL COMMENT '订单更新时间',
  `couponTicket` int(11) DEFAULT '0' COMMENT '优惠券， 为空',
  `points` int(11) DEFAULT '0' COMMENT '积分点数， 为空',
  `deleteFlag` char(1) DEFAULT '0' COMMENT '数据软删除标记： 0 - 未删除；1 - 删除',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除日期',
  `channelDistributorCode` char(2) DEFAULT NULL COMMENT '渠道经销商代码， 常量：02手机端',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_orderitems 订单行项目表
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitems`;
CREATE TABLE `t_orderitems` (
  `orderItemID` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '订单中商品条目',
  `commodityID` int(11) NOT NULL COMMENT '商品id',
  `commdityName` varchar(500) NOT NULL COMMENT '商品名',
  `specification` varchar(500) NOT NULL COMMENT '商品规格',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `productUnit` varchar(10) NOT NULL COMMENT '计量单位',
  `price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `amount` decimal(10,2) NOT NULL COMMENT '此条商品条目总价',
  `couponTicket` int(11) DEFAULT NULL COMMENT '对应优惠券，为空',
  `points` int(11) DEFAULT NULL COMMENT '获得积分， 为0',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣，为空',
  `introducer` int(11) DEFAULT NULL COMMENT '商品促销人， 为空',
  `orderID` char(16) NOT NULL COMMENT '订单id--外键',
  `deleteFlag` char(1) DEFAULT '0' COMMENT '数据软删除标记\r\n0 - 未删除\r\n1 - 删除',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除日期',
  `updateTime` datetime DEFAULT NULL,
  `logTimeStamp` char(18) DEFAULT NULL COMMENT '日志时间戳',
  PRIMARY KEY (`orderItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=773 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order_log 订单变更历史表
-- ----------------------------
DROP TABLE IF EXISTS `t_order_log`;
CREATE TABLE `t_order_log` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '自增序列号',
  `orderID` char(16) NOT NULL COMMENT '同订单主表t_order',
  `orderType` char(2) NOT NULL DEFAULT '01' COMMENT '订单类型，同订单主表t_order',
  `orderStatus` char(2) NOT NULL DEFAULT '01' COMMENT '订单状态：，同订单主表t_order',
  `seller` int(11) NOT NULL COMMENT '卖家，同订单主表t_order',
  `buyer` int(11) NOT NULL COMMENT '顾客，同订单主表t_order',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额，同订单主表t_order',
  `couponTicket` int(11) DEFAULT '0' COMMENT '优惠券，同订单主表t_order',
  `ceateTime` datetime NOT NULL COMMENT '下单时间，同订单主表t_order',
  `updateTime` datetime DEFAULT NULL COMMENT '订单更新时间，同订单主表t_order',
  `points` int(11) DEFAULT '0' COMMENT '积分点数，同订单主表t_order',
  `deleteFlag` char(1) DEFAULT '0' COMMENT '数据软删除标记，同订单主表t_order',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除日期，同订单主表t_order',
  `logTimeStamp` char(16) DEFAULT NULL COMMENT '日志时间戳，同订单主表t_order',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order_comments 订单消息表
-- ----------------------------
DROP TABLE IF EXISTS `t_order_comments`;
CREATE TABLE `t_order_comments` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '自增序列号',
  `orderID` char(16) NOT NULL COMMENT '同订单主表t_order',
  `type` char(2) NOT NULL DEFAULT '01' COMMENT '消息类型：01买家留言；02卖家留言；',
  `event` char(2) NOT NULL DEFAULT '01' COMMENT '事件类型：01催单；02已审核；03已支付；04已发货；05已收货；06已取消',
  `text` text NOT NULL COMMENT '消息内容，无消息时，填写：消息类型+事件类型',
  `sender` char(13) NOT NULL COMMENT '消息发送者',
  `deleteFlag` char(1) DEFAULT '0' COMMENT '数据软删除标记，同订单主表t_order',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除日期，同订单主表t_order',
  `createTime` char(16) DEFAULT NULL COMMENT '日志时间戳，同订单主表t_order',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
