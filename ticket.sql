/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.17 : Database - ticket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ticket` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ticket`;

/*Table structure for table `allshow` */

DROP TABLE IF EXISTS `allshow`;

CREATE TABLE `allshow` (
  `showName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `showCate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `showDate` varchar(255) NOT NULL,
  `showPrice` int(255) NOT NULL,
  `showPosit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `remainTicket` int(11) NOT NULL,
  `showPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `showId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`showId`),
  UNIQUE KEY `num` (`showId`),
  UNIQUE KEY `name` (`showName`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `allshow` */

insert  into `allshow`(`showName`,`showCate`,`showDate`,`showPrice`,`showPosit`,`remainTicket`,`showPic`,`showId`) values (' 吴青峰“太空备忘记”巡回演唱会-广州站','演唱会','2020-12-12 17:30:30',688,'广州宝能观致文化中心',0,'img/showID1.png',1),('周杰伦【嘉年华】世界巡回演唱会-广州站','演唱会','2020-07-25 20:00:00',888,'广州体育馆',245,'img/showID2.jpeg',2),('林宥嘉idol世界巡回演唱会-广州站','演唱会','2020-08-13 19:30:00',588,'广州宝能观致文化中心',111,'img/showID3.jpg',3),('原创歌剧《马可·波罗》','音乐剧','2020-07-31 20:00:00',120,'广州大剧院歌剧厅',231,'img/showID4.png',4),('音乐剧《梵高》','音乐剧','2020-08-14 15:00:00',145,'广州大剧院歌剧厅',18,'img/showID5.png',5),('音乐剧《魔女宅急便》','音乐剧','2020-07-10 20:00:00',168,'广州大剧院歌剧厅',187,'img/showID6.png',6),('周四喜剧之夜','脱口秀','2020-07-19 19:00:00',133,'太空间livehouse',87,'img/showID7.png',7),('开心麻花独角音乐喜剧《求婚女王》','脱口秀','2020-07-28 18:00:00',289,'正佳开心麻花剧场',96,'img/showID8.png',8),('周六小剧场 广州站','脱口秀','2020-07-23 19:30:00',288,'未来社二楼小剧场',26,'img/showID9.png',9),('2020苏州M_DSK跨年限定日','演唱会','2020-12-31 14:05:00',460,'苏州相城活力岛',299,'img/showID10.jpg',10),('西安燥物MSN音乐节','演唱会','2021-01-02 20:00:00',248,'西安市星球工厂LIVEHOUSE',400,'img/showID11.jpg',11),('第十四届音乐盛典咪咕汇','演唱会','2020-12-05 18:30:00',88,'广州宝能观致文化中心',998,'img/showID12.jpg',12),('爱乐乐团2021新年音乐会','音乐剧','2020-12-25 19:30:00',280,'成都市城市音乐厅',500,'img/showID13.jpg',13),('“满疆红”中国交响乐团音乐会','音乐剧','2020-12-13 17:30:00',200,'中国国家大剧院',345,'img/showID14.jpg',14),('“冬日之约”:国家大剧院原创歌剧《冰山上的来客》','音乐剧','2020-12-06 16:00:00',280,'中国国家大剧院',89,'img/showID15.jpg',15),('原创话剧《林则徐》','话剧','2020-12-11 19:00:00',280,'中国国家大剧院戏剧场',35,'img/showID16.jpg',16),('话剧《四世同堂》','话剧','2020-12-02 18:00:00',380,'国家大剧院戏剧场',55,'img/showID17.jpg',17),('北京子弹飞格斗冠军赛16金腰带争夺战','体育赛事','2020-12-12 18:00:00',200,'北京宋庄子弹飞大宋拳场',77,'img/showID18.jpg',18),('2020年中国足球协会甲级联赛绿城主场','体育赛事','2020-12-10 09:00:00',500,'湖州奥体中心体育场',2,'img/showID19.jpg',19),('上海2019-2020赛季CBA上海久事篮球队主场比赛','体育赛事','2020-12-31 14:00:00',2500,'上海源深体育馆',9,'img/showID20.jpg',20),('大型芭蕾舞剧《天鹅湖》','舞台剧','2020-12-31 20:00:00',480,'广州中山纪念堂',50,'img/showID21.jpg',21),('贺岁芭蕾舞剧《过年》','舞台剧','2021-01-02 19:30:00',100,'北京市天桥剧场',49,'img/showID22.jpg',22),('音乐剧《白夜行》','音乐剧','2020-12-24 18:00:00',480,'上汽上海文化广场',66,'img/showID23.jpg',23),('北京音乐剧《在远方》','音乐剧','2020-12-27 14:00:00',680,'北京天桥艺术中心大剧场',43,'img/showID24.jpg',24),('开心麻花年度口碑《贼想得到你》','演唱会','2020-12-25 14:00:00',480,'杭州东坡大剧院',68,'img/showID25.jpg',25),(' fmm独家演唱会','演唱会','2021-01-08T11:47',1,'广外三栋',18,'img/D7F4CBDCDDF8424693E340C69B5DC3C2_timg.jpg',34);

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cId` int(11) NOT NULL,
  `showId` int(11) NOT NULL,
  `showNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`cId`,`showId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`cId`,`showId`,`showNum`) values (1,2,2),(1,4,2),(2,2,2),(2,10,2);

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `managerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `manager` */

insert  into `manager`(`managerName`,`password`) values ('mm',111),('ztt',222);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `showId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `orderId` int(11) NOT NULL,
  `showId` int(11) NOT NULL,
  `showName` varchar(255) DEFAULT NULL,
  `showNum` int(10) DEFAULT NULL,
  `showPic` varchar(255) DEFAULT NULL,
  `showPrice` int(255) DEFAULT NULL,
  PRIMARY KEY (`orderId`,`showId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`orderId`,`showId`,`showName`,`showNum`,`showPic`,`showPrice`) values (21,12,'广州神武3动感地带第十四届音乐盛典咪咕汇（线上直播）',2,'http://localhost:8080/SSM1/img/showID12.jpg',88),(21,19,'浙江湖州2020年中国足球协会甲级联赛绿城主场',1,'http://localhost:8080/SSM1/img/showID19.jpg',500),(21,24,'北京音乐剧《在远方》',1,'http://localhost:8080/SSM1/img/showID24.jpg',680),(22,10,'2020苏州M_DSK跨年限定日',1,'http://localhost:8080/SSM1/img/showID10.jpg',460),(23,24,'北京音乐剧《在远方》',1,'http://localhost:8080/SSM1/img/showID24.jpg',680),(24,1,' 吴青峰“太空备忘记”巡回演唱会-广州站',2,'http://localhost:8080/SSM1/img/showID1.png',688),(24,19,'浙江湖州2020年中国足球协会甲级联赛绿城主场',1,'http://localhost:8080/SSM1/img/showID19.jpg',500),(26,19,'浙江湖州2020年中国足球协会甲级联赛绿城主场',1,'http://localhost:8080/SSM1/img/showID19.jpg',500),(28,1,' 吴青峰“太空备忘记”巡回演唱会-广州站',2,'http://10.173.43.195:8080/SSM1/img/showID1.png',688),(30,9,'周六小剧场 广州站',2,'http://10.173.40.107:8080/SSM1/img/showID9.png',288),(31,2,'周杰伦【嘉年华】世界巡回演唱会-广州站',5,'http://10.173.40.107:8080/SSM1/img/showID2.jpeg',888),(31,7,'周四喜剧之夜',2,'http://10.173.40.107:8080/SSM1/img/showID7.png',133),(32,34,' fmm独家演唱会',2,'http://10.173.40.107:8080/SSM1/img/D7F4CBDCDDF8424693E340C69B5DC3C2_timg.jpg',1);

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `orderCreateTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `orderlist` */

insert  into `orderlist`(`orderId`,`userId`,`userName`,`cost`,`orderCreateTime`) values (32,16,'fmm',2,'2020/12/17 上午11:49:43');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userPassword` int(255) NOT NULL,
  `userHead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/img/firsthead.jpg',
  `userAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userPhone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userSex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userBirthday` date DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`userPassword`,`userHead`,`userAddress`,`userPhone`,`userSex`,`userBirthday`) values (1,'zttttttt',111,'img/E957512C93F34F358FBA8310EBAA9EBF_head.jpg','广外一饭','181****0683','男','2000-01-12'),(2,'Tom',222,'img/firsthead.jpg','广东省汕头市','3728444','男',NULL),(3,'AMRY',333,'img/firsthead.jpg','湖南省长沙市','2447828','女',NULL),(4,'Christ',6662,'img/firsthead.jpg','上海','344421','男',NULL),(5,'May',9393,'img/firsthead.jpg','北京','333392','女',NULL),(15,'zt',123,'img/8BCB7E895BA240319BB80665056D0EFE_O1CN01AUo20I1WggkqsxbrG_!!3327042818.jpg','广外','11111','男','2020-12-15'),(16,'玫玫',111,'img/BE9C10B576A248FE95C5BEA99666953B_timg.jpg','广外三栋楼下','18025565114','男','2020-12-17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
