-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2021 at 05:29 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fullface_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `idCat` int(11) NOT NULL,
  `nameCat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`idCat`, `nameCat`) VALUES
(1, 'AGV'),
(2, 'Shoei'),
(3, 'Arai'),
(4, 'TORC'),
(5, 'Yohe'),
(6, 'Kyt'),
(7, 'Royal'),
(8, 'LS2');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `rating` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`idComment`, `content`, `ten`, `email`, `date`, `rating`, `idProduct`) VALUES
(1, 'Nón đẹp', 'quoc huy', 'kenbi.njr@gmail.com', '2021-03-01 20:06:37', 5, 1),
(2, 'Nón xịn quá', 'Trần Quốc Huy', 'huytqps11190@fpt.edu.vn', '2021-03-01 23:03:11', 3, 2),
(3, 'asd', 'asd', 'kenbi.njr@gmail.cm', '2021-03-01 22:32:55', 5, 4),
(4, 'Nón gì mắc vậy', 'Lê Gia Huy', 'lgh@gmail.com', '2021-03-01 22:41:28', 1, 3),
(5, 'Nón shoei quá đẹp', 'Quốc Huy', 'kenbi.njr@gmail.cm', '2021-03-01 22:43:02', 5, 2),
(6, 'Tôi thích màu xanh của nón <3 ', 'Biker', 'biker@gmail.com', '2021-03-01 23:34:15', 5, 28),
(7, 'Nón xấu mà mắc quá', 'Biker', 'biker@gmail.com', '2021-03-01 23:34:54', 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `nameProduct` varchar(50) DEFAULT NULL,
  `amountProduct` int(11) DEFAULT NULL,
  `S` tinyint(1) DEFAULT 1,
  `M` tinyint(1) DEFAULT 1,
  `L` tinyint(1) DEFAULT 1,
  `imgProduct` varchar(250) DEFAULT NULL,
  `priceProduct` double DEFAULT NULL,
  `dateUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `desProduct` varchar(4000) DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  `showHide` tinyint(1) DEFAULT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `nameProduct`, `amountProduct`, `S`, `M`, `L`, `imgProduct`, `priceProduct`, `dateUpdate`, `desProduct`, `idCat`, `showHide`, `views`) VALUES
(1, 'AGV K3 SV Five Continents', 10, 1, 1, 1, 'img/agv1.jpg', 8000000, '2021-02-26 04:30:13', 'Lớp vỏ ngoài của nón AGV K-3 SV Five continents với công nghệ HIR-TH (High Resistance Thermoplastic Resin), vỏ bên trong EPS được tối ưu bằng công nghệ FEM (Finite Elements Analysis).\r\n\r\nKính chắn gió  trong suốt ngoài và kính râm chống nắng bên trong làm từ polycarbonate chống trầy xước, chống sương mù, chống 100% tia UV.', 1, 1, 100),
(2, 'Mũ Bảo Hiểm Fullface Shoei X-14 Aerodyne', 10, 1, 1, 1, 'img/shoei1.jpg', 17800000, '2021-02-26 04:30:24', 'Các đặc tính khí động học được tối đa hóa thông qua hệ thống thông gió rộng rãi.\r\nLớp lót EPS đa mật độ hai lớp giúp tăng cường khả năng hấp thụ và thông gió\r\nBốn kích cỡ vỏ và năm lớp lót EPS có các tùy chọn phù hợp tăng giúp thoải mái phù hợp với hầu hết các kích cỡ đầu', 2, 1, 5),
(3, 'Arai RX-7 GP RC Full Carbon Limited Edition', 10, 1, 1, 1, 'img/arai1.jpg', 90000000, '2021-02-26 04:30:59', 'Vải lót có chất liệu cotton thấm hút khô thoáng vô cùng nhanh chóng, bạn có thể tháo rời giữa lớp vải lót và tấm đệm lót ra để làm vệ sinh mà không cần lo lắng nó sẽ lâu khô, hay bị ẩm ướt.', 3, 1, 50),
(4, 'Nón Bảo Hiểm Fullface Torc T18', 5, 1, 1, 1, 'img/torc1.jpg', 2000000, '2021-02-26 04:31:47', 'Nón trang bị 2 kính, lồng nón có thể tháo rời vệ sinh. Điểm nổi bật của dòng nón này là kiểu dáng thiết kế tính xảo. Phần mũi nón ngoàm xuống kiểu dáng thể thao, phong cách. Đặc biệt hơn lớp mút ôm trọn vòng đầu và chất liệu bên trong êm hơn có phần đàn hồi hơn so với các dòng nón như LS2,Yohe,GXT', 4, 1, 0),
(5, 'Yohe 978 Plus Bản Đặc Biệt Cam Phản Quang', 2, 1, 1, 1, 'img/yohe1.jpg', 1400000, '2021-02-26 04:31:18', 'Yohe 978 Plus Lido Limited Edition là phiên bản phiên bản nón giới hạn chính hãng của YOHE, đặc biệt chỉ có bán tại Yohe Shop. Yohe 978 Plus Lido limited Edtion được nâng cấp đuôi gió zin từ hãng làm tăng thêm vẻ đẹp mạnh mẽ cũng như kiểu dáng khí động học hơn. Yohe 978 là mẫu nón nhập trực tiếp từ nhà máy Yohe Helmet với độ hoàn thiện rất cao và đạt nhiều chuẩn quốc tế như chuẩn DOT Mỹ và chuẩn ECE châu âu', 5, 1, 0),
(6, 'KYT NFR Axel Bassani', 3, 1, 1, 1, 'img/kyt1.jpg', 4600000, '2021-02-26 04:31:26', 'Mũ fullface KYT NF-R Axel Bassani 2 kính với thiết kế hiện đại, góc cạnh cùng mẫu tem từ đường đua Moto2 của tay đua cùng tên Axel Bassani. Với chất liệu nhựa nhiệt dẻo (Thermoplastic), lớp vỏ nón được thiết kế theo công nghệ ADT-Advanced tiên tiến. Form nón đặc biệt được nghiên cứu khá kĩ để tối ưu hiệu suất khí động học tốt nhất. Các lớp mút lót cùng bộ phận hút/thoát khí được tối ưu nhằm đem lại trải nghiệm thoải mái, khô thoáng khi dùng.', 6, 1, 0),
(7, 'MŨ BẢO HIỂM FULLFACE ROYAL M138B DESIGN', 5, 1, 1, 1, 'img/royal1.jpg', 800000, '2021-02-26 04:31:39', 'Nón bảo hiểm Royal M138B do công ty Mafa sản xuất. Thương hiệu nón Royal ra đời năm 2008 do ông Mai Văn Thuận sáng lập. Với mục tiêu sản xuất ra những chiếc nón chất lượng nhất, đáp ứng nhu cầu ngày càng cao không chỉ của người dùng ở Việt Nam và cả ở thị trường thế giới.', 7, 1, 0),
(8, 'Nón fullface LS2 FF320 Stream Evo Kub - Mũ LS2 có ', 6, 1, 1, 1, 'img/ls21.jpg', 2600000, '2021-02-26 04:31:33', 'Nón fullface LS2 FF320 STREAM EVO KUB có mẫu tem cực kỳ thu hút cho các biker đam mê pkl. Hãng mũ LS2 nổi tiếng vì chất lượng tốt, mẫu mã khá đẹp mà giá lại rất hợp lý. LS2 FF320 Stream Evo Kub có thiết kế mạnh mẽ nhất trong model FF320 - nón bảo hiểm fullface có 2 kính.', 8, 1, 0),
(17, 'AGV K3 SV Brazil MORBIDELLI 2018', 10, 0, 1, 1, 'img/agv2.jpg', 8000000, '2021-03-01 16:12:29', 'Một mẫu K-3 SV vừa được AGV ra mắt, kế thừa thiết kế Pista của tay đua vừa vô địch Moto2 Championship 2017 - Franco Morbidelli #FM21. AGV K-3 SV Brazil MORBIDELLI 2018 với thiết kế cờ Brazil nổi bật vừa tri ân tay đua nổi tiếng Morbidelli, vừa kế thừa tính năng đa dụng của model K-3 SV sẽ góp phần làm phong phú bộ sưu tập nón fullface AGV cao cấp.', 1, 1, 7),
(19, 'AGV K1 FLAVUM 46', 4, 0, 1, 1, 'img/agv3.jpg', 7000000, '2021-03-01 16:12:05', 'Hãng AGV vừa tung ra thị trường mẫu nón fullface hoàn toàn mới: AGV K1, có thể nói 1 dòng nón cực kì xuất sắc trước giờ của AGV Helmets.\r\nDòng AGV K1 Brand New sẽ ra mắt vào năm 2018, Tài Đạt tự hào là 1 trong những shop đầu tiên trên thế giới sẽ bán sớm siêu phẩm cực kì hot này.', 1, 1, 2),
(21, 'AGV K3 SV Rossi Misano 2015', 3, 1, 1, 0, 'img/agv4.jpg', 8000000, '2021-03-01 16:14:04', 'Lớp vỏ ngoài của nón AGV K-3 SV Rossi Misano 2015 với công nghệ HIR-TH (High Resistance Thermoplastic Resin), vỏ bên trong EPS được tối ưu bằng công nghệ FEM (Finite Elements Analysis).\r\n\r\n', 1, 1, 8),
(23, 'AGV K1 Đen Nhám MATTE BLACK', 4, 0, 1, 0, 'img/agv5.jpg', 7000000, '2021-03-01 16:15:35', 'Hãng AGV vừa tung ra thị trường mẫu nón fullface hoàn toàn mới: AGV K1, có thể nói 1 dòng nón cực kì xuất sắc trước giờ của AGV Helmets.\r\nDòng AGV K1 Brand New sẽ ra mắt vào năm 2018, Tài Đạt tự hào là 1 trong những shop đầu tiên trên thế giới sẽ bán sớm siêu phẩm cực kì hot này.', 1, 1, 2),
(25, 'Mũ bảo hiểm Arai Samura Spirit Gold (Limited)', 3, 1, 1, 1, 'img/arai2.jpg', 16500000, '2021-03-01 16:19:01', 'Chưa có mô tả', 3, 1, 22),
(26, 'Arai RX-7 Pedrosa Samurai Spirit', 7, 0, 0, 1, 'img/arai3.jpg', 14850000, '2021-03-01 16:20:45', 'Chưa có mô tả', 3, 1, 100),
(27, 'Mũ Fullface Poc Revo Orange', 100, 1, 1, 1, 'img/torc2.jpg', 1600000, '2021-03-01 16:22:17', 'Kiểu dáng nón siêu gọn, trọng lượng nhẹ, đặc biệt mút nón đội cực êm. Dòng nón Poc Revo là phiên bản nón fullface mới nhất của hãng hiện nay.', 4, 1, 300),
(28, 'Nón Bảo Hiểm Fullface Torc T18 Đặc Biệt', 3, 0, 1, 1, 'img/torc3.jpg', 1780000, '2021-03-01 16:27:15', 'Nón trang bị 2 kính, lồng nón có thể tháo rời vệ sinh. Điểm nổi bật của dòng nón này là kiểu dáng thiết kế tính xảo. Phần mũi nón ngoàm xuống kiểu dáng thể thao, phong cách. Đặc biệt hơn lớp mút ôm trọn vòng đầu và chất liệu bên trong êm hơn có phần đàn hồi hơn so với các dòng nón như LS2,Yohe,GXT,…', 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `ho` varchar(50) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` double DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `ho`, `ten`, `email`, `username`, `password`, `phone`, `address`) VALUES
(1, 'Trần', 'Quốc Huy', 'kenbi.njr@gmail.cm', 'admin', '123', 932393401, ''),
(5, 'Trần', 'Quốc', 'kenbi.njr@gmail.cm', 'huy', '$2b$10$CGHZhN5XMekIKk14pFqwjuJ1apYUHmn6v7qbPBisr3v4CzQoci9US', 333964846, 'Vietnam'),
(6, 'Trần', 'Quốc Huy', 'asd@gmail.com', 'superman', '$2b$10$2g4kPt1ok.F0XlHOm9cGLe6YI3c9EjIXTqouZu9ilXwBptDSDwB.q', 333964846, ''),
(7, 'Trần', 'Quốc Huy', 'kenbi.njr@gmail.cm', 'huy123', '$2b$10$CGHZhN5XMekIKk14pFqwjuJ1apYUHmn6v7qbPBisr3v4CzQoci9US', 932393401, 'Tây Ninh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`idCat`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCat` (`idCat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `idCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `catalog` (`idCat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
