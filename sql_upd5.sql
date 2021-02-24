-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: quick_rental
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(36) NOT NULL COMMENT 'Id tài khoản',
  `admin_code` varchar(50) NOT NULL COMMENT 'Mã quản lý',
  `admin_name` varchar(255) NOT NULL COMMENT 'Tên người quản lý',
  `admin_account` varchar(50) NOT NULL COMMENT 'Tên tài khoản',
  `admin_pass` varchar(50) NOT NULL COMMENT 'Mật khẩu tài khoản',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  UNIQUE KEY `admin_code_UNIQUE` (`admin_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Người quản lý';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã ngân hàng',
  `bank_name` varchar(255) NOT NULL COMMENT 'Tên ngân hàng',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ngân hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` varchar(36) NOT NULL COMMENT 'Id giỏ hàng',
  `customer_id` varchar(36) NOT NULL COMMENT 'Id khách hàng',
  `prod_id` varchar(36) NOT NULL COMMENT 'Id sản phẩm',
  `prod_amount` int NOT NULL COMMENT 'Số lượng sản phẩm',
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_product_idx` (`prod_id`),
  KEY `fk_cart_customer_idx` (`customer_id`),
  CONSTRAINT `fk_cart_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Giỏ hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cate_id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục',
  `cate_name` varchar(255) NOT NULL COMMENT 'Tên danh mục',
  `item_id` int DEFAULT NULL,
  PRIMARY KEY (`cate_id`),
  UNIQUE KEY `cate_id_UNIQUE` (`cate_id`),
  KEY `cate_fk_item_idx` (`item_id`),
  CONSTRAINT `cate_fk_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Danh mục';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'co_trang_nam',1),(2,'co_trang_nu',1),(3,'han_phuc_nam',1),(4,'han_phuc_nu',1),(5,'anh_hung',1),(6,'cong_chua',1),(7,'anime',1),(8,'an_do',2),(9,'anh',2),(10,'han_quoc',2),(11,'nhat_ban',2),(12,'trung_quoc',2),(13,'viet_nam',2),(24,'1_6',3),(25,'8_3',3),(26,'20_11',3),(27,'dong_noel',3),(28,'gala_party',3),(29,'halloween',3),(30,'he',3),(31,'tat_nien_tong_ket',3),(32,'thu_trung_thu',3),(33,'xuan_tet',3),(34,'giay_dep_guoc',4),(35,'kinh_kinh_ap_trong',4),(36,'non_mao_vuong',4),(37,'phu_kien_co_trang',4),(38,'toc_gia',4),(39,'vu_khi_dao_cu',4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(36) NOT NULL COMMENT 'Id khách hàng',
  `custome_code` varchar(50) NOT NULL COMMENT 'Mã khách hàng',
  `first_name` varchar(255) NOT NULL COMMENT 'Họ của khách hàng',
  `last_name` varchar(255) NOT NULL COMMENT 'Tên khách hàng',
  `address` varchar(255) NOT NULL COMMENT 'Địa chỉ hiện tại',
  `birthday` date DEFAULT NULL COMMENT 'Ngày sinh',
  `gender` int DEFAULT NULL COMMENT 'Giới tính',
  `phone_number` varchar(25) NOT NULL COMMENT 'Số điện thoại',
  `email` varchar(50) DEFAULT NULL COMMENT 'Địa chỉ email',
  `bank_id` int NOT NULL COMMENT 'Mã ngân hàng',
  `bank_code_account` varchar(255) NOT NULL COMMENT 'Số tài khoản',
  `password` varchar(50) NOT NULL COMMENT 'Mật khẩu',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id_UNIQUE` (`customer_id`),
  UNIQUE KEY `custome_code_UNIQUE` (`custome_code`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `customer_fk_bank_idx` (`bank_id`),
  CONSTRAINT `customer_fk_bank` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Khách hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id sản phẩm',
  `name` varchar(255) NOT NULL COMMENT 'Tên loại sản phẩm',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Loại sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'cosplay'),(2,'truyen_thong'),(3,'mua_le_hoi'),(4,'phu_kien_dao_cu');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster`
--

DROP TABLE IF EXISTS `poster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã ảnh',
  `img` varchar(45) NOT NULL COMMENT 'Ảnh',
  `title` varchar(45) NOT NULL COMMENT 'Tiêu đề',
  `description` varchar(45) NOT NULL COMMENT 'Mô tả ngắn gọn',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Danh mục quản lý hình ảnh poster';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster`
--

LOCK TABLES `poster` WRITE;
/*!40000 ALTER TABLE `poster` DISABLE KEYS */;
/*!40000 ALTER TABLE `poster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing_bill`
--

DROP TABLE IF EXISTS `processing_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processing_bill` (
  `bill_id` varchar(36) NOT NULL COMMENT 'Id hóa đơn',
  `bill_code` varchar(50) NOT NULL COMMENT 'Mã hóa đơn',
  `bill_status` int NOT NULL COMMENT 'Trạng thái đơn hàng (1 - Đang xử lý, 2 - Đang giao hàng, 3 - Khách đã nhận hàng)',
  `prod_id` varchar(36) NOT NULL COMMENT 'Id sản phẩm',
  `prod_amount` int NOT NULL COMMENT 'Số lượng sản phẩm',
  `prod_deposit` varchar(255) NOT NULL COMMENT 'Tiền đặt cọc',
  `prod_price` varchar(50) NOT NULL COMMENT 'Giá trên 1 sản phẩm',
  `customer_id` varchar(36) NOT NULL COMMENT 'Id khách hàng',
  `rental_term` datetime NOT NULL COMMENT 'Hạn cho thuê (Tính từ thời điểm nhận được hàng)',
  `created_date` datetime NOT NULL COMMENT 'Ngày khởi tạo',
  `modify_date` datetime NOT NULL COMMENT 'Ngày cập nhật gần nhất',
  PRIMARY KEY (`bill_id`),
  KEY `fk_bill_product_idx` (`prod_id`),
  KEY `fk_customer_idx` (`customer_id`),
  CONSTRAINT `fk_bill_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_bill_product` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Đơn hàng đang xử lý';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing_bill`
--

LOCK TABLES `processing_bill` WRITE;
/*!40000 ALTER TABLE `processing_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `processing_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` varchar(36) NOT NULL COMMENT 'Id sản phẩm',
  `prod_code` varchar(50) NOT NULL COMMENT 'Mã sản phẩm',
  `image1` varchar(255) NOT NULL COMMENT 'Ảnh minh họa 1',
  `image2` varchar(255) NOT NULL COMMENT 'Ảnh minh họa 2',
  `image3` varchar(255) NOT NULL COMMENT 'Ảnh minh họa 3',
  `prop_color` varchar(255) DEFAULT NULL COMMENT 'Màu sắc sản phẩm',
  `prod_name` varchar(255) NOT NULL COMMENT 'Tên sản phẩm',
  `prod_price` varchar(255) NOT NULL COMMENT 'Giá thuê trên 1 sản phẩm/Ngày',
  `prod_deposit` varchar(255) NOT NULL COMMENT 'Tiền đặt cọc',
  `prod_status` varchar(50) DEFAULT NULL COMMENT 'Trạng thái sản phẩm',
  `prod_description` varchar(255) DEFAULT NULL COMMENT 'Mô tả sản phẩm',
  `prod_amount` int NOT NULL COMMENT 'Số lượng sản phẩm hiện tại còn',
  `cate_id` int DEFAULT NULL COMMENT 'Id danh mục',
  `create_date` datetime NOT NULL COMMENT 'Ngày tạo mới sản phẩm',
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `prod_id_UNIQUE` (`prod_id`),
  UNIQUE KEY `prod_code_UNIQUE` (`prod_code`),
  KEY `fk_product_category_idx` (`cate_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_warehouse` FOREIGN KEY (`prod_id`) REFERENCES `warehouse` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('005343c9-60eb-443b-8507-e68cf7656f29','TG2','assets/img/phu_kien_dao_cu/toc_gia/TG2/img1.jpg','assets/img/phu_kien_dao_cu/toc_gia/TG2/img2.jpg','assets/img/phu_kien_dao_cu/toc_gia/TG2/img3.jpg','Đen','Búi Tóc Cổ Trang Hán Phục Nơ Lớn','150000','300000','HOT','Chất liệu: tơ nhân tạo, nilon. Tự Nhiên: Tóc giả được búi từ vải tơ nhân tạo mềm mịn, nhẹ nhàng mang đến cảm giác tự nhiên cho người dùng, Ngoài ra còn gọn nhẹ, vô cùng tiện lợi cho người sử dụng',50,38,'2020-12-13 00:00:00'),('06fa7034-60ab-4636-bf15-56cb15bbf293','HLW2','assets/img/mua_le_hoi/halloween/HLW2/img1.jpg','assets/img/mua_le_hoi/halloween/HLW2/img2.jpg','assets/img/mua_le_hoi/halloween/HLW2/img3.jpg','Đen','Đồ Ma Cương Thi Tặng Kèm Lá Bùa','200000','450000','HOT','Bao gồm: áo + nón. Chất liệu bộ đồ ma cương thi là vải phi bóng. Hoa văn trên áo hình là thêu 100%, hình ảnh là chim hạt đang bay biểu hiện cho sự thanh cao và liêm khiết.',50,29,'2020-12-13 00:00:00'),('103d7eae-ab5e-4b26-aa71-c47b035859cd','A1','assets/img/truyen_thong/anh/A1/img1.jpg','assets/img/truyen_thong/anh/A1/img2.jpg','assets/img/truyen_thong/anh/A1/img3.jpg','Xam','Bộ Cosplay Nữ Cảnh Sát Sexy','120000','400000','SALE','Chất liệu: kaki. Hình ảnh là hình sản phẩm thật do chính shop thực hiện.',50,9,'2020-12-12 00:00:00'),('15352980-380c-430d-801c-ea1a2a268562','TT2','assets/img/mua_le_hoi/thu_trung_thu/TT2/img1.jpg','assets/img/mua_le_hoi/thu_trung_thu/TT2/img2.jpg','assets/img/mua_le_hoi/thu_trung_thu/TT2/img3.jpg','Đỏ','Trang Phục Hằng Nga Cách Điệu Đỏ Tươi','100000','400000','HOT','Sườn Xám Cách Điệu được may khá cầu kì, từ việc phối nhiều loại vải voan, ren, gấm đến việc họa tiết hoa lá được thêu sống động trên phần áo. Tuy nhiên, trang phục lại có giá rất phải chăng, khá dễ mặc, không quá kén da và hợp với nhiều dáng người.',50,32,'2020-12-13 00:00:00'),('1acad782-4c11-45c4-a3f2-16040c0e0bd3','TN1','assets/img/mua_le_hoi/tat_nien_tong_ket/TN1/img1.jpg','assets/img/mua_le_hoi/tat_nien_tong_ket/TN1/img2.jpg','assets/img/mua_le_hoi/tat_nien_tong_ket/TN1/img3.jpg','Đỏ xanh','Trang Phục Captain Marvel','600000','5000000','HOT','Bao gồm: Bộ đồ liền + Giáp ngực + 2 giáp tay + 2 giáp chân + thắc lưng + găng tay + giày. Trang phục Captain Marvel phối màu xanh, đỏ và vàng cùng khí thế oai phong của cô chắc chắn nữ anh hùng này sẽ trở thành nhân vật được yêu thích nhất của Marvel.',50,31,'2020-12-13 00:00:00'),('1de4c7e5-37ab-4564-aaf2-603c01d72b3d','H2','assets/img/mua_le_hoi/he/H2/img1.jpg','assets/img/mua_le_hoi/he/H2/img2.jpg','assets/img/mua_le_hoi/he/H2/img3.jpg','Cầu vồng','Trang Phục Nàng Tiên Cá','150000','500000','SALE','Bao gồm: áo + đuôi cá. Chất liệu: vải kim sa, thun, voan. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện.',50,30,'2020-12-13 00:00:00'),('283fc119-0d61-4b3d-b643-d3f523052b30','HPNU2','assets/img/cosplay/han_phuc_nam/HPNU2/img1.jpg','assets/img/cosplay/han_phuc_nam/HPNU2/img2.jpg','assets/img/cosplay/han_phuc_nam/HPNU2/img2.jpg','Hồng nhạt','Hán Phục Tone Pastel Nhẹ Nhàng','600000','1700000','TREND','Chất liệu: Voan nhung, thêu hoa hoa văn. ',50,4,'2020-12-12 00:00:00'),('3076be2c-cced-45fc-bd79-469e543aa46f','KAT1','assets/img/phu_kien_dao_cu/kinh_kinh_ap_trong/KAT1/img1.jpg','assets/img/phu_kien_dao_cu/kinh_kinh_ap_trong/KAT1/img2.jpg','assets/img/phu_kien_dao_cu/kinh_kinh_ap_trong/KAT1/img2.jpg','Xanh dương','Kính Áp Tròng Xanh Dương - Blue (G2-007)','250000','250000','SALE','Dòng lens là 1 bước tiến mới trong công nghệ phối màu của Hàn Quốc: Công nghệ phủ màu vi điểm. Màu lens trở nên trong veo và long lanh khi ra ngoài nắng. Độ cận hiện có: khách vui lòng note lại để shop kiểm hàng. Độ ẩm: ~42% (còn gọi độ ngậm nước)',50,35,'2020-12-13 00:00:00'),('33e4babf-3f96-4e9d-83e9-e9308aac4c74','DN1','assets/img/mua_le_hoi/dong_noel/DN1/img1.jpg','assets/img/mua_le_hoi/dong_noel/DN1/img2.jpg','assets/img/mua_le_hoi/dong_noel/DN1/img3.jpg','Đỏ','Trọn Bộ Ông Già Noel Vải Nhung','300000','750000','TREND','Bao gồm: áo + quần + thắt lưng + nón + túi quà (vải nhung). ',50,27,'2020-12-13 00:00:00'),('38ad8eec-3617-42e0-a6a5-5d528213a52c','GP1','assets/img/mua_le_hoi/gala_party/GP1/img1.jpg','assets/img/mua_le_hoi/gala_party/GP1/img2.jpg','assets/img/mua_le_hoi/gala_party/GP1/img3.jpg','Xanh dương','Trang Phục Captain American 2','270000','1100000','HOT','Bao gồm: áo (có mút độn giả cơ bắp) + quần + mặt nạ (vải). Chất liệu: vải giả da. Hình ảnh là hình chụp sản phẩm thật do chính shop thực hiện.',50,28,'2020-12-13 00:00:00'),('38b0cbc4-43e9-481c-bd24-9bf8cc3a2114','831','assets/img/mua_le_hoi/8_3/831/img1.jpg','assets/img/mua_le_hoi/8_3/831/img2.jpg','assets/img/mua_le_hoi/8_3/831/img3.jpg','Vàng','Áo Dài 23 (Áo Dài Cách Điệu)','200000','450000','TREND','Chất liệu: vải gấm, lụa. Thành phần: áo dài + váy. Hình ảnh là hình sản phẩm thật do chính shop thực hiện.',50,25,'2020-12-13 00:00:00'),('3a10e3d7-15dd-4a46-937d-add37fa2f1c1','HQ1','assets/img/truyen_thong/han_quoc/HQ1/img1.jpg','assets/img/truyen_thong/han_quoc/HQ1/img2.jpg','assets/img/truyen_thong/han_quoc/HQ1/img3.jpg','Xanh nhạt','Hanbok Hàn Quốc ','150000','700000','SALE',' Hanbok giúp người mặc toát lên vẻ sang trọng và cao quý nên thường được diện trong các dịp lễ quan trọng.',50,10,'2020-12-12 00:00:00'),('3cce865a-34bb-45e3-87bf-ab771d2ab530','ANM2','assets/img/cosplay/anime/ANM2/img1.jpg','assets/img/cosplay/anime/ANM2/img2.jpg','assets/img/cosplay/anime/ANM2/img3.jpg','Trắng','Trang Phục Cosplay Miketsukami Soushi','200000','500000','HOT','Thành phần: áo đen viền xám + áo trắng + thắt lưng',50,7,'2020-12-12 00:00:00'),('3f73c9f9-ddbf-4a20-b26a-7526df1aa426','HPNU1','assets/img/cosplay/han_phuc_nam/HPNU1/img1.jpg','assets/img/cosplay/han_phuc_nam/HPNU1/img2.jpg','assets/img/cosplay/han_phuc_nu/HPNU1/img3.jpg','Đỏ','Hán Phục Cổ Trang Mỹ Nhân Túy','350000','700000','HOT','Hán phục sẽ đem lại sự thoải mái cho người mặc vì chất voan, lụa rất thoáng khí và mềm mại. Trang phục bao gồm áo, váy và dây; có nhiều size, phần dây lưng còn có thể tăng giảm tùy ý theo số đo của người mặc.',50,4,'2020-12-12 00:00:00'),('42e0e810-6a6a-47fd-9d19-e2611f328c4d','VKDC2','assets/img/phu_kien_dao_cu/vu_khi_dao_cu/VKDC2/img1.jpg','assets/img/phu_kien_dao_cu/vu_khi_dao_cu/VKDC2/img2.jpg','assets/img/phu_kien_dao_cu/vu_khi_dao_cu/VKDC2/img3.jpg','Đen','Kiếm Gỗ Đen Phong Thủy Yubashiri','200000','500000','HOT','Hình dáng Kiếm Gỗ Đen Phong Thủy Yubashiri được mô phỏng hoàn toàn dựa trên phiên bản thật của One Piece. Kiếm có chiều dài 1m và lớp sơn đen tuyền tuyệt đẹp',50,39,'2020-12-13 00:00:00'),('45850e1d-6e1d-4fde-ac6b-507a70d28191','XT2','assets/img/mua_le_hoi/xuan_tet/XT2/img1.jpg','assets/img/mua_le_hoi/xuan_tet/XT2/img2.jpg','assets/img/mua_le_hoi/xuan_tet/XT2/img3.jpg','Xanh','Áo Dài Cô Ba Sài Gòn ','120000','300000','SALE','Bao gồm: áo + quần + nơ tóc. Chất liệu: vải voan, phi bóng. Hình ảnh là hình chụp sản phẩm thật do khách hàng gửi tặng.',50,33,'2020-12-13 00:00:00'),('4f405021-10cc-4142-8940-eb271685ca57','A2','assets/img/truyen_thong/anh/A2/img1.jpg','assets/img/truyen_thong/anh/A2/img2.jpg','assets/img/truyen_thong/anh/A2/img3.jpg','Trắng','Đầm Quý Tộc Châu Âu Camila','450000','1000000','HOT','Đầm Quý Tộc Châu Âu Camila là một bản mô phỏng hoàn hảo của trang phục hoàng gia. Trang phục thể hiện sự kiêu sa, sang trọng và thanh lịch của giới quý tộc với phần thân váy được làm xòe và xếp ly một cách khéo léo và tỉ mỉ',50,9,'2020-12-12 00:00:00'),('527cceea-9119-4d10-bd0b-3b98fcd61bb0','CC1','assets/img/cosplay/cong_chua/CC1/img1.jpg','assets/img/cosplay/cong_chua/CC1/img2.jpg','assets/img/cosplay/cong_chua/CC1/img3.jpg','Đỏ xanh','Trang Phục Công Chúa Ngủ Trong Rừng','170000','450000','SALE','Chất liệu: vải phi mờ, nhung, voan, ren. Thành phần: đầm xòe. Hình ảnh là hình chụp thật do chính shop thực hiện.',50,6,'2020-12-12 00:00:00'),('58248d07-ed11-435c-9eea-72ed2138f21d','VN1','assets/img/truyen_thong/viet_nam/VN1/img1.jpg','assets/img/truyen_thong/viet_nam/VN1/img2.jpg','assets/img/truyen_thong/viet_nam/VN1/img3.jpg','Xanh trắng','Áo Yếm Trắng Hoa Sen','100000','250000','HOT','Áo yếm voan thêu (ko bao gồm áo khoác + quần như ảnh). Chất liệu: vải voan 2 lớp thêu',50,13,'2020-12-12 00:00:00'),('5eb77296-61f9-4ec4-8ce3-9d41f6d3973e','20111','assets/img/mua_le_hoi/20_11/20111/img1.jpg','assets/img/mua_le_hoi/20_11/20111/img2.jpg','assets/img/mua_le_hoi/20_11/20111/img3.jpg','Xanh váy đen','Trang Phục Cô Tấm 1','200000','450000','HOT','Bao gồm: áo yếm gấm trắng + váy đen dài + áo voan + khăn mỏ quạ. Chất liệu: vải voan nhung, gấm, phi lụa',50,26,'2020-12-13 00:00:00'),('611f6332-3bb7-4d98-8faf-0d5bd56a5dab','HPN2','assets/img/cosplay/han_phuc_nam/HPN2/img1.jpg','assets/img/cosplay/han_phuc_nam/HPN2/img2.jpg','assets/img/cosplay/han_phuc_nam/HPN2/img3.jpg','Đen','Hán Phục Nam Trạc Thần','400000','1200000','TREND','Chất liệu: vải kaki rũ, thêu rồng, hạc. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện.',50,3,'2020-12-12 00:00:00'),('63981aab-3d35-4ccb-8d52-0ebd45bfc2dc','TG1','assets/img/phu_kien_dao_cu/toc_gia/TG1/img1.jpg','assets/img/phu_kien_dao_cu/toc_gia/TG1/img2.jpg','assets/img/phu_kien_dao_cu/toc_gia/TG1/img3.jpg','Nâu','Nón Kèm Tóc Giả Hải Tặc Kèm Luôn Nón Xịn Xò','100000','250000','HOT','Bao gồm: Nón tóc may liền nón (tóc dài 40cm ). Ưu điểm: chịu nhiệt, có thể dưỡng - phục hồi, có thể dùng nhiều lần. Thời hạn dùng lâu, dễ bảo quản.',50,38,'2020-12-13 00:00:00'),('6e19c87d-3d07-4ea2-b7bc-5b6a7e20924b','TT1','assets/img/mua_le_hoi/thu_trung_thu/TT1/img1.jpg','assets/img/mua_le_hoi/thu_trung_thu/TT1/img2.jpg','assets/img/mua_le_hoi/thu_trung_thu/TT1/img3.jpg','Tím','Áo Sẫm Gấm Quảng Châu Tím Dài','150000','300000','HOT','Bao gồm: Sườn xám gấm. Ngày nay khi sự cách tân được yêu thích bởi tính ứng dụng cao thì nhiều người có xu hướng chọn trang phục cổ truyền như Áo Sẫm Gấm Quảng Châu để giữ gìn các nét đẹp xưa cũ.',50,32,'2020-12-13 00:00:00'),('6e640631-2c1f-4b85-8f7c-e5bec90f9072','KAT2','assets/img/phu_kien_dao_cu/kinh_kinh_ap_trong/KAT2/img1.jpg','assets/img/phu_kien_dao_cu/kinh_kinh_ap_trong/KAT2/img2.jpg','assets/img/phu_kien_dao_cu/kinh_kinh_ap_trong/KAT2/img3.jpg','Đen','Mắt Kính Harry Potter Gọng Kim Loại Có Tròng','50000','200000','SALE','Bao gồm: Mắt kính không tròng (chỉ cho thuê kèm đồ). Chất liệu: nhựa',50,35,'2020-12-13 00:00:00'),('721c44b8-7598-43c9-9397-96cfc088b3a3','PKCT2','assets/img/phu_kien_dao_cu/phu_kien_co_trang/PKCT2/img1.jpg','assets/img/phu_kien_dao_cu/phu_kien_co_trang/PKCT2/img2.jpg','assets/img/phu_kien_dao_cu/phu_kien_co_trang/PKCT2/img3.jpg','Trắng hồng','Quạt Tròn Cáng Tre Tiểu Khả Ái Cá Chép Vàng','50000','200000','SALE','Chất liệu: vải voan, thêu, cán tre, dán ruy băng, có tua rua. Quạt cán dài giúp uyển chuyển hơn trong lúc hoá trang, tạo dáng. Cán dài còn tạo cảm giác thanh tú, mảnh mai cho người sử dụng.',50,37,'2020-12-13 00:00:00'),('7fbe8547-d05f-4858-9459-4d8fc5b039dd','832','assets/img/mua_le_hoi/8_3/832/img1.jpg','assets/img/mua_le_hoi/8_3/832/img2.jpg','assets/img/mua_le_hoi/8_3/832/img3.jpg','Hồng','Áo Dài 57','150000','300000','HOT','Chất liệu: vải voan, phi bóng. Hình ảnh là hình chụp sản phẩm thật do khách hàng gửi tặng.',50,25,'2020-12-13 00:00:00'),('81a8420c-973c-4b98-81c5-946139f67b56','CTN3','assets/img/cosplay/co_trang_nam/CTN3/img1.jpg','assets/img/cosplay/co_trang_nam/CTN3/img2.jpg','assets/img/cosplay/co_trang_nam/CTN3/img3.jpg','Đen viền đỏ','Cổ Trang Nam Thời Tống Giá Rẻ','150000','260000','TREND','Chất liệu: vải kaki mỏng. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện.',50,1,'2020-12-12 00:00:00'),('82cec41c-616b-4f9b-852a-4aeec7de5d5a','CTN1','assets/img/cosplay/co_trang_nam/CTN1/img1.jpg','assets/img/cosplay/co_trang_nam/CTN1/img2.jpg','assets/img/cosplay/co_trang_nam/CTN1/img3.jpg','Xanh dương','Cổ Trang Nam Chụp Ảnh Đơn Giản Giá Rẻ','120000','250000','SALE','Chất liệu: vải kaki rũ, thêu rồng, hạt. Kích thước: size XL, cao từ 165-175 mặc đẹp. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện',50,1,'2020-12-12 00:00:00'),('8821e667-cec3-4a91-b935-0a12f4da95a1','CTN2','assets/img/cosplay/co_trang_nam/CTN2/img1.jpg','assets/img/cosplay/co_trang_nam/CTN2/img2.jpg','assets/img/cosplay/co_trang_nam/CTN2/img3.jpg','Trắng viền xanh','Hán Phục Nam Lam Tề','200000','600000','HOT','Chất liệu: vải kaki rũ, thêu rồng, hạt. Kích thước: size XL, cao từ 165-175 mặc đẹp. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện.',50,1,'2020-12-12 00:00:00'),('8a235aa7-ecd8-41a7-a01e-a2ecf5f9206e','PKCT1','assets/img/phu_kien_dao_cu/phu_kien_co_trang/PKCT1/img1.jpg','assets/img/phu_kien_dao_cu/phu_kien_co_trang/PKCT1/img2.jpg','assets/img/phu_kien_dao_cu/phu_kien_co_trang/PKCT1/img2.jpg','Vàng','Kim Quan Hoa Đăng - Màu Vàng','100000','250000','SALE','Trâm cài tóc cổ trang dành cho nữ, rất dễ sử dụng. Chỉ cần làm bới tóc gọn gàng và cài trâm lên là bạn đã có một mái tóc xin đẹp, nhìn giống các cô nương trong các bộ ảnh cổ trang long lanh!',50,37,'2020-12-13 00:00:00'),('8f1b01a5-cb1a-4e60-9179-9f84475b8028','HLW1','assets/img/mua_le_hoi/halloween/HLW1/img1.jpg','assets/img/mua_le_hoi/halloween/HLW1/img2.jpg','assets/img/mua_le_hoi/halloween/HLW1/img3.jpg','Đen','Đồ Phù Thủy Cho Nam Tay Rộng','250000','500000','SALE','Bao gồm: áo kèm nón + nón. Đồ phù thủy cho nam được may bằng chất liệu phi mờ, voan cao cấp, kiểu dáng mô phỏng theo phim, hợp thời và phù hợp với nhiều dáng người.',50,29,'2020-12-13 00:00:00'),('9810303e-722f-4378-a7a0-d49c46f7af03','20112','assets/img/mua_le_hoi/20_11/20112/img1.jpg','assets/img/mua_le_hoi/20_11/20112/img2.jpg','assets/img/mua_le_hoi/20_11/20112/img3.jpg','Đen','Bộ Đồ Tứ Thân Dì Ghẻ Trong Phim Tấm Cám','250000','700000','HOT','Bao gồm: áo yếm thêu + áo ren + váy dài + mấn đính đá. Chất liệu: vải ren, gấm, phi lụa',50,26,'2020-12-13 00:00:00'),('9949545f-0ae9-4eb7-8a99-614a391c6cb1','XT1','assets/img/mua_le_hoi/xuan_tet/XT1/img1.jpg','assets/img/mua_le_hoi/xuan_tet/XT1/img2.jpg','assets/img/mua_le_hoi/xuan_tet/XT1/img3.jpg','Đỏ','Áo Dài Gấm Đỏ','250000','600000','TREND','Bao gồm: áo + quần + mấn. Chất liệu: vải gấm. Hình ảnh là hình sản phẩm thật do chính shop thực hiện.',50,33,'2020-12-13 00:00:00'),('a2b5ecd3-bc7a-4a86-876d-101d2edeb892','TN2','assets/img/mua_le_hoi/tat_nien_tong_ket/TN2/img1.jpg','assets/img/mua_le_hoi/tat_nien_tong_ket/TN2/img2.jpg','assets/img/mua_le_hoi/tat_nien_tong_ket/TN2/img3.jpg','Xanh bạc','Trang Phục Thor Nữ','150000','500000','SALE','Bao gồm: váy + áo choàng. Chất liệu: vải giả da',50,31,'2020-12-13 00:00:00'),('a2fe9181-19e2-45a8-944f-300f602a5b90','NB1','assets/img/truyen_thong/nhat_ban/NB1/img1.jpg','assets/img/truyen_thong/nhat_ban/NB1/img2.jpg','assets/img/truyen_thong/nhat_ban/NB1/img3.jpg','Xanh','Kimono Love Live','300000','700000','TREND','Chất liệu: phi lụa. Hình ảnh là hình sản phẩm thật do chính shop thực hiện.',50,11,'2020-12-12 00:00:00'),('a31b74c5-0af2-42de-ac2a-39164f861148','NMV2','assets/img/phu_kien_dao_cu/non_mao_vuong/NMV2/img1.jpg','assets/img/phu_kien_dao_cu/non_mao_vuong/NMV2/img2.jpg','assets/img/phu_kien_dao_cu/non_mao_vuong/NMV2/img3.jpg','Vàng ánh','Vương Miện Cưới Cô Dâu','150000','400000','HOT','Chất liệu: kim loại + cườm. Hình ảnh là hình chụp từ sản phẩm thật do chính shop thực hiện. Shop cam kết sản phẩm trong hình sao bên ngoài vậy.',50,36,'2020-12-13 00:00:00'),('a89309d1-2a69-488d-9c75-10b525d76aee','TQ2','assets/img/truyen_thong/trung_quoc/TQ2/img1.jpg','assets/img/truyen_thong/trung_quoc/TQ2/img2.jpg','assets/img/truyen_thong/trung_quoc/TQ2/img3.jpg','Đen hoa văn đỏ','Sườn xám Sẫm Gấm Quảng Châu ','150000','400000','SALE','Áo sẫm có kiểu dáng tựa sườn xám, thường may khá ôm, cổ áo dạng đứng và được xẻ tà theo nhiều kiểu khác nhau.',50,12,'2020-12-12 00:00:00'),('aa68f751-fb09-4dc3-82f6-af7ee7ac0a66','H1','assets/img/mua_le_hoi/he/H1/img1.jpg','assets/img/mua_le_hoi/he/H1/img2.jpg','assets/img/mua_le_hoi/he/H1/img3.jpg','Vằn đen trắng','Đồ Bơi Bikini Họa Tiết Ngựa Vằn','70000','200000','SALE','Bao gồm: áo ngực + quần. Bikini có form quần chữ nhật, cạp cao. Form áo bikini có 2 áo dây cột, cột cổ để nâng vòng 1 và cột lưng để siết căn vòng ngực. Áo hở lưng nhưng có dây lòng thòng nhìn gợi cảm và đáng yêu!',50,30,'2020-12-13 00:00:00'),('abaa4adc-2924-42b8-bb70-a319868ab2e7','HQ2','assets/img/truyen_thong/han_quoc/HQ2/img1.jpg','assets/img/truyen_thong/han_quoc/HQ2/img2.jpg','assets/img/truyen_thong/han_quoc/HQ2/img3.jpg','Áo xanh quần đỏ','Hanbok nam Hàn Quốc ','170000','600000','TREND','Hanbok nam giúp người mặc toát lên vẻ sang trọng và cao quý nên thường được diện trong các dịp lễ quan trọng.',50,10,'2020-12-12 00:00:00'),('ae84ab10-850c-4efd-9a7e-81a460a8e571','AD2','assets/img/truyen_thong/an_do/AD2/img1.jpg','assets/img/truyen_thong/an_do/AD2/img2.jpg','assets/img/truyen_thong/an_do/AD2/img3.jpg','Cam','Saree Đồ Ấn Độ ','500000','1300000','HOT','Chất liệu: Vải cotton, hàng nhập trực tiếp từ Dubai, Ấn độ chính tông, hoa văn phong cách Ấn độ 100%',50,8,'2020-12-12 00:00:00'),('b149a751-9ba6-4a52-82b1-209920656d57','AD1','assets/img/truyen_thong/an_do/AD1/img1.jpg','assets/img/truyen_thong/an_do/AD1/img2.jpg','assets/img/truyen_thong/an_do/AD1/img2.jpg','Đỏ','Trang Phục Cô Dâu Ấn Độ','120000','450000','SALE','Chất liệu: Vải voan, ren, cườm. Thành phần: Áo + váy + khăn đội đầu + trang sức cài đầu',50,8,'2020-12-12 00:00:00'),('b38c7e5d-ae04-4ad2-8753-579b8263b5a6','CC2','assets/img/cosplay/cong_chua/CC2/img1.jpg','assets/img/cosplay/cong_chua/CC2/img2.jpg','assets/img/cosplay/cong_chua/CC2/img3.jpg','Vàng','Trang Phục Công Chúa Bella - Người Đẹp Và Quái Vật','150000','400000','SALE','Chất liệu: vải phi bóng, ren, voan kin tuyến. Thành phần: đầm xòe',50,6,'2020-12-12 00:00:00'),('b8cabea3-7e3a-415d-850a-bd3dd2314453','VKDC1','assets/img/phu_kien_dao_cu/vu_khi_dao_cu/VKDC1/img1.jpg','assets/img/phu_kien_dao_cu/vu_khi_dao_cu/VKDC1/img2.jpg','assets/img/phu_kien_dao_cu/vu_khi_dao_cu/VKDC1/img3.jpg','Bạc','Đao Kiếm Hải Tặc Cướp Biển','50000','200000','SALE','Nếu bạn còn băn khoăn về chất lượng sản phẩm, chất liệu, size, tình trạng... hãy gọi chúng tôi để được tư vấn.',50,39,'2020-12-13 00:00:00'),('bb3094d0-294a-43f8-8579-8fe5bbe50fea','161','assets/img/mua_le_hoi/1_6/161/img1.jpg','assets/img/mua_le_hoi/1_6/161/img2.jpg','assets/img/mua_le_hoi/1_6/161/img3.jpg','Nâu mũ trắng','Đồ Con Gấu Trúc Panda Dễ Thương Cho Bé','100000','300000','SALE','Chất liệu: Vải lông, mềm, ấm, cực mịn, an toàn cho bé. Thiết kế thời trang và mặc thoải mái. Sản phẩm này rất đẹp và đáng yêu!',50,24,'2020-12-13 00:00:00'),('c2ec3346-16d8-4046-a0e0-295e63456ff4','CTNU2','assets/img/cosplay/co_trang_nu/CTNU2/img1.jpg','assets/img/cosplay/co_trang_nu/CTNU2/img2.jpg','assets/img/cosplay/co_trang_nu/CTNU2/img3.jpg','Xanh ngọc','Đồ Cổ Trang Côn Lôn ','250000','600000','HOT','Bao gồm: Áo voan trắng tích hợp váy + áo khoác',50,2,'2020-12-12 00:00:00'),('c709c839-5929-483e-93af-828115a77c26','DN2','assets/img/mua_le_hoi/dong_noel/DN2/img1.jpg','assets/img/mua_le_hoi/dong_noel/DN2/img2.jpg','assets/img/mua_le_hoi/dong_noel/DN2/img3.jpg','Đỏ','Đầm Noel Cho Bé Gái Kèm Choàng','250000','600000','TREND','Đầm xòe noel nữ có choàng được làm từ vải nhung và lông cao cấp, kiểu dáng phù hợp với nhiều dáng người với nhiều size cho khách lựa chọn. Ngoài ra shop còn cung cấp nhiều phụ kiện cho Noel chắc chắn sẽ làm bạn hài lòng.',50,27,'2020-12-13 00:00:00'),('cd7d517f-8cb4-48d7-af4e-7fb2dd61c0d9','VN2','assets/img/truyen_thong/viet_nam/VN2/img1.jpg','assets/img/truyen_thong/viet_nam/VN2/img2.jpg','assets/img/truyen_thong/viet_nam/VN2/img3.jpg','Trắng','Áo Dài Trắng Nữ Sinh','100000','300000','TREND','Chất liệu: vải voan, phi bóng. Hình ảnh là hình chụp sản phẩm thật do khách hàng gửi tặng.',50,13,'2020-12-12 00:00:00'),('cf64d3c4-81f1-40f6-940f-242d14d99133','NMV1','assets/img/phu_kien_dao_cu/non_mao_vuong/NMV1/img1.jpg','assets/img/phu_kien_dao_cu/non_mao_vuong/NMV1/img2.jpg','assets/img/phu_kien_dao_cu/non_mao_vuong/NMV1/img3.jpg','Đen','Nón Phù Thủy Đen Mỏng Vải Oxford','50000','200000','SALE','Chất liệu: vải dù. Dùng cho halloween, hội hộp, sinh nhật, tiệc tùng..',50,36,'2020-12-13 00:00:00'),('d34add3c-93e1-43c6-ab9a-96aa1f8d8f24','162','assets/img/mua_le_hoi/1_6/162/img1.jpg','assets/img/mua_le_hoi/1_6/162/img2.jpg','assets/img/mua_le_hoi/1_6/162/img3.jpg','Vằn đen trắng','Đồ Cosplay Con Ngựa Vằn Cho Bé','200000','450000','SALE','Thành phần: áo liền quần có nón. Nếu bạn còn băn khoăn về chất lượng sản phẩm, chất liệu, size, tình trạng... hãy gọi chúng tôi để được tư vấn.',50,24,'2020-12-13 00:00:00'),('d98d23fa-a250-4d9a-9656-8fd67d4cb96d','CTNU1','assets/img/cosplay/co_trang_nu/CTNU1/img1.jpg','assets/img/cosplay/co_trang_nu/CTNU1/img2.jpg','assets/img/cosplay/co_trang_nu/CTNU1/img3.jpg','Hồng','Đồ Thôn Nữ Màu Hồng Nhạt','100000','230000','SALE','Đồ Thôn Nữ Nàu Hồng Nhạt được may từ vải kaki mỏng và có thắt lưng đi kèm nên mặc rất thoáng đồng thời rất ôm dáng. ',50,2,'2020-12-12 00:00:00'),('db33e496-f7e0-4d04-8a7b-7dbb85709558','AH2','assets/img/cosplay/anh_hung/AH2/img1.jpg','assets/img/cosplay/anh_hung/AH2/img2.jpg','assets/img/cosplay/anh_hung/AH2/img3.jpg','Đỏ váy xanh','Trang Phục Wonder Woman','150000','300000','SALE','Chất liệu: vải thun. Bao gồm: váy + áo choàng + 2 băng tay + băng trán',50,5,'2020-12-12 00:00:00'),('e140b9f5-0a80-4d8e-a6f4-7b335d722799','GDG2','assets/img/phu_kien_dao_cu/giay_dep_guoc/GDG2/img1.jpg','assets/img/phu_kien_dao_cu/giay_dep_guoc/GDG2/img2.jpg','assets/img/phu_kien_dao_cu/giay_dep_guoc/GDG2/img3.jpg','Trắng','Giày Thêu Hán Phục Đế 6cm Size 38','70000','200000','SALE','Bao gồm: giày thêu hoa. Chất liệu: vải, nhựa. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện.',50,34,'2020-12-13 00:00:00'),('e3ca367f-72e7-495d-b904-8808d423b8f5','NB2','assets/img/truyen_thong/nhat_ban/NB2/img1.jpg','assets/img/truyen_thong/nhat_ban/NB2/img2.jpg','assets/img/truyen_thong/nhat_ban/NB2/img3.jpg','Tím than','Kimono Nhật Umi','350000','1100000','HOT','Kimono là tên gọi 1 loại trang phục truyền thống của Nhật Bản. Điểm đặc biệt của Kimono là có phần tay áo rất rộng (được may hết khổ vải)',50,11,'2020-12-12 00:00:00'),('e497d81b-218a-488a-9271-d3629044af84','AH1','assets/img/cosplay/anh_hung/AH1/img1.jpg','assets/img/cosplay/anh_hung/AH1/img2.jpg','assets/img/cosplay/anh_hung/AH1/img3.jpg','Xanh dương','Trang Phục Captain America Độn Thun Bốn Chiều','250000','700000','TREND','Nếu bạn còn băn khoăn về chất lượng sản phẩm, chất liệu, size, tình trạng... hãy gọi chúng tôi để được tư vấn.',50,5,'2020-12-12 00:00:00'),('e6f614f6-ebf1-4ef9-aa69-bac7a82797e7','ANM1','assets/img/cosplay/anime/ANM1/img1.jpg','assets/img/cosplay/anime/ANM1/img2.jpg','assets/img/cosplay/anime/ANM1/img3.jpg','Áo trắng quần đỏ','Trang Phục Hakama Cosplay Nhật Bản Kikyou - Inuyasha','150000','400000','HOT','Chất liệu: vải kate. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện.',50,7,'2020-12-12 00:00:00'),('e7632680-033d-4b92-ab60-f2438ac4e8fc','GDG1','assets/img/phu_kien_dao_cu/giay_dep_guoc/GDG1/img1.jpg','assets/img/phu_kien_dao_cu/giay_dep_guoc/GDG1/img2.jpg','assets/img/phu_kien_dao_cu/giay_dep_guoc/GDG1/img3.jpg','Đen','Hài Vải Trẻ Em Đen Viền Hồng Thêu Hoa Size 33','200000','400000','HOT','Nếu bạn còn băn khoăn về chất lượng sản phẩm, chất liệu, size, tình trạng... hãy gọi chúng tôi để được tư vấn.',50,34,'2020-12-13 00:00:00'),('eb474bde-fb77-424a-8299-e21b25f5c995','TQ1','assets/img/truyen_thong/trung_quoc/TQ1/img1.jpg','assets/img/truyen_thong/trung_quoc/TQ1/img2.jpg','assets/img/truyen_thong/trung_quoc/TQ1/img3.jpg','Đỏ','Áo Khỏa Nam Sườn Xám Nam','150000','500000','SALE','Áo khỏa nam là kiểu trang phục xuất hiện trong các diễm lễ, cưới, ngày hội truyền thống Trung Hoa. Trang phục thường được mọi người chọn để chụp ảnh, dự tiệc, biểu diễn vì thường rất đứng form, sang trọng và lịch sự.',50,12,'2020-12-12 00:00:00'),('fbc334c6-785d-487f-b1df-711109c1ebb5','HPN1','assets/img/cosplay/han_phuc_nam/HPN1/img1.jpg','assets/img/cosplay/han_phuc_nam/HPN1/img2.jpg','assets/img/cosplay/han_phuc_nam/HPN1/img3.jpg','Xanh quần đen','Hán Phục Nam Cách Tân Hạo Nghiên','400000','1200000','TREND','Chất liệu: vải kaki rũ, thêu rồng, hạc. Hình ảnh là hình chụp thật của sản phẩm do chính shop thực hiện.',50,3,'2020-12-12 00:00:00'),('fd7b5d9f-153c-4c47-b06e-35e9ae4b22f1','GP2','assets/img/mua_le_hoi/gala_party/GP2/img1.jpg','assets/img/mua_le_hoi/gala_party/GP2/img2.jpg','assets/img/mua_le_hoi/gala_party/GP2/img3.jpg','Đỏ','Trang Phục Deadpool Lady','400000','1300000','HOT','Bao gồm: áo liền quần + thắt lưng. Chất liệu: vải thun co dãn',50,28,'2020-12-13 00:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `succes_bill`
--

DROP TABLE IF EXISTS `succes_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `succes_bill` (
  `bill_id` varchar(36) NOT NULL COMMENT 'Id hóa đơn',
  `bill_code` varchar(50) NOT NULL COMMENT 'Mã hóa đơn',
  `prod_id` varchar(36) NOT NULL COMMENT 'Id sản phẩm',
  `prod_amount` int NOT NULL COMMENT 'Số lượng sản phẩm',
  `rental_date` datetime NOT NULL COMMENT 'Ngày cho thuê',
  `received_date` datetime NOT NULL COMMENT 'Ngày nhận hàng',
  `status_refund` int NOT NULL COMMENT 'Trạng thái hoàn tiền (0-Thành công, 1-Chưa hoàn phía khách hàng, 2-Chưa hoàn phía cửa hàng)',
  `bank_id` int NOT NULL COMMENT 'Tên ngân hàng dùng để giao dịch',
  `bank_code` varchar(255) NOT NULL COMMENT 'Tài khoản ngân hàng',
  `customer_id` varchar(36) NOT NULL,
  PRIMARY KEY (`bill_id`,`status_refund`),
  KEY `fk_ss_bill_product_idx` (`prod_id`),
  KEY `fk_customer_idx` (`customer_id`),
  KEY `fk_ss_customer_idx` (`customer_id`),
  CONSTRAINT `fk_ss_bill_product` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  CONSTRAINT `fk_ss_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hóa đơn thành công';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `succes_bill`
--

LOCK TABLES `succes_bill` WRITE;
/*!40000 ALTER TABLE `succes_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `succes_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestion_img`
--

DROP TABLE IF EXISTS `suggestion_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestion_img` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã ảnh',
  `img` varchar(255) NOT NULL COMMENT 'Ảnh ',
  `link` varchar(255) DEFAULT NULL COMMENT 'Link tới sản phẩm',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Danh sách ảnh sản phẩm gợi ý';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestion_img`
--

LOCK TABLES `suggestion_img` WRITE;
/*!40000 ALTER TABLE `suggestion_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestion_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `prod_id` varchar(36) NOT NULL COMMENT 'Id sản phẩm',
  `amount` int NOT NULL COMMENT 'Số lượng sản phẩm còn trong kho',
  `rent_amount` int NOT NULL COMMENT 'Số lượng sản phẩm đang cho thuê',
  `import_price` varchar(255) NOT NULL COMMENT 'Giá tiền nhập',
  `prod_code_partner` varchar(50) DEFAULT NULL COMMENT 'Mã sản phẩm định nghĩa bên đối tác',
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `prod_id_UNIQUE` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Kho hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES ('005343c9-60eb-443b-8507-e68cf7656f29',50,0,'200000','P001'),('06fa7034-60ab-4636-bf15-56cb15bbf293',50,0,'200000','P001'),('103d7eae-ab5e-4b26-aa71-c47b035859cd',50,0,'200000','P001'),('15352980-380c-430d-801c-ea1a2a268562',50,0,'200000','P001'),('1acad782-4c11-45c4-a3f2-16040c0e0bd3',50,0,'200000','P001'),('1de4c7e5-37ab-4564-aaf2-603c01d72b3d',50,0,'200000','P001'),('283fc119-0d61-4b3d-b643-d3f523052b30',50,0,'200000','P001'),('3076be2c-cced-45fc-bd79-469e543aa46f',50,0,'200000','P001'),('33e4babf-3f96-4e9d-83e9-e9308aac4c74',50,0,'200000','P001'),('38ad8eec-3617-42e0-a6a5-5d528213a52c',50,0,'200000','P001'),('38b0cbc4-43e9-481c-bd24-9bf8cc3a2114',50,0,'200000','P001'),('3a10e3d7-15dd-4a46-937d-add37fa2f1c1',50,0,'200000','P001'),('3cce865a-34bb-45e3-87bf-ab771d2ab530',50,0,'200000','P001'),('3f73c9f9-ddbf-4a20-b26a-7526df1aa426',50,0,'200000','P001'),('42e0e810-6a6a-47fd-9d19-e2611f328c4d',50,0,'200000','P001'),('45850e1d-6e1d-4fde-ac6b-507a70d28191',50,0,'200000','P001'),('4f405021-10cc-4142-8940-eb271685ca57',50,0,'200000','P001'),('527cceea-9119-4d10-bd0b-3b98fcd61bb0',50,0,'200000','P001'),('58248d07-ed11-435c-9eea-72ed2138f21d',50,0,'200000','P001'),('5eb77296-61f9-4ec4-8ce3-9d41f6d3973e',50,0,'200000','P001'),('611f6332-3bb7-4d98-8faf-0d5bd56a5dab',50,0,'200000','P001'),('63981aab-3d35-4ccb-8d52-0ebd45bfc2dc',50,0,'200000','P001'),('6e19c87d-3d07-4ea2-b7bc-5b6a7e20924b',50,0,'200000','P001'),('6e640631-2c1f-4b85-8f7c-e5bec90f9072',50,0,'100000','P001'),('721c44b8-7598-43c9-9397-96cfc088b3a3',50,0,'100000','P001'),('7fbe8547-d05f-4858-9459-4d8fc5b039dd',50,0,'200000','P001'),('81a8420c-973c-4b98-81c5-946139f67b56',50,0,'200000','P001'),('82cec41c-616b-4f9b-852a-4aeec7de5d5a',50,0,'200000','P001'),('8821e667-cec3-4a91-b935-0a12f4da95a1',50,0,'200000','P001'),('8a235aa7-ecd8-41a7-a01e-a2ecf5f9206e',50,0,'200000','P001'),('8f1b01a5-cb1a-4e60-9179-9f84475b8028',50,0,'200000','P001'),('9810303e-722f-4378-a7a0-d49c46f7af03',50,0,'200000','P001'),('9949545f-0ae9-4eb7-8a99-614a391c6cb1',50,0,'200000','P001'),('a2b5ecd3-bc7a-4a86-876d-101d2edeb892',50,0,'200000','P001'),('a2fe9181-19e2-45a8-944f-300f602a5b90',50,0,'200000','P001'),('a31b74c5-0af2-42de-ac2a-39164f861148',50,0,'200000','P001'),('a89309d1-2a69-488d-9c75-10b525d76aee',50,0,'200000','P001'),('aa68f751-fb09-4dc3-82f6-af7ee7ac0a66',50,0,'200000','P001'),('abaa4adc-2924-42b8-bb70-a319868ab2e7',50,0,'200000','P001'),('ae84ab10-850c-4efd-9a7e-81a460a8e571',50,0,'200000','P001'),('b149a751-9ba6-4a52-82b1-209920656d57',50,0,'200000','P001'),('b38c7e5d-ae04-4ad2-8753-579b8263b5a6',50,0,'200000','P001'),('b8cabea3-7e3a-415d-850a-bd3dd2314453',50,0,'100000','P001'),('bb3094d0-294a-43f8-8579-8fe5bbe50fea',50,0,'200000','P001'),('c2ec3346-16d8-4046-a0e0-295e63456ff4',50,0,'200000','P001'),('c709c839-5929-483e-93af-828115a77c26',50,0,'200000','P001'),('cd7d517f-8cb4-48d7-af4e-7fb2dd61c0d9',50,0,'200000','P001'),('cf64d3c4-81f1-40f6-940f-242d14d99133',50,0,'100000','P001'),('d34add3c-93e1-43c6-ab9a-96aa1f8d8f24',50,0,'200000','P001'),('d98d23fa-a250-4d9a-9656-8fd67d4cb96d',50,0,'200000','P001'),('db33e496-f7e0-4d04-8a7b-7dbb85709558',50,0,'200000','P001'),('e140b9f5-0a80-4d8e-a6f4-7b335d722799',50,0,'200000','P001'),('e3ca367f-72e7-495d-b904-8808d423b8f5',50,0,'200000','P001'),('e497d81b-218a-488a-9271-d3629044af84',50,0,'200000','P001'),('e6f614f6-ebf1-4ef9-aa69-bac7a82797e7',50,0,'200000','P001'),('e7632680-033d-4b92-ab60-f2438ac4e8fc',50,0,'200000','P001'),('eb474bde-fb77-424a-8299-e21b25f5c995',50,0,'200000','P001'),('f9ec3741-0860-4064-ac4b-4573a499261a',50,0,'200000','P001'),('fbc334c6-785d-487f-b1df-711109c1ebb5',50,0,'200000','P001'),('fd7b5d9f-153c-4c47-b06e-35e9ae4b22f1',50,0,'200000','P001');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Mã danh sách yêu thích',
  `prod_id` varchar(36) NOT NULL COMMENT 'Id sản phẩm',
  `prod_name` varchar(255) NOT NULL COMMENT 'Tên sản phẩm',
  `prod_price` varchar(255) NOT NULL COMMENT 'Giá trên 1 sản phẩm',
  `customer_id` varchar(36) NOT NULL COMMENT 'Id khách hàng',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `wishlist_fk_product_idx` (`prod_id`),
  KEY `wishlist_fk_customer_idx` (`customer_id`),
  CONSTRAINT `wishlist_fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wishlist_fk_product` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Danh sách yêu thích';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quick_rental'
--

--
-- Dumping routines for database 'quick_rental'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15  1:58:40
