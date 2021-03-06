-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2020 at 11:14 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sachkyanh`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE IF NOT EXISTS `chitiethoadon` (
  `SoHD` int(11) NOT NULL,
  `MaSach` varchar(6) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `DonGia` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`SoHD`, `MaSach`, `SoLuong`, `DonGia`) VALUES
(10000001, 'SKC001', 1, 155000),
(10000001, 'SKC002', 1, 59000),
(10000001, 'SKC003', 1, 200000),
(10000002, 'SKC001', 1, 155000),
(10000002, 'SKC002', 1, 59000),
(10000003, 'SKC004', 1, 299000),
(10000004, 'SKC003', 1, 200000),
(10000005, 'SKC003', 1, 200000),
(10000005, 'SKC006', 1, 165000);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE IF NOT EXISTS `hoadon` (
`SoHD` int(11) NOT NULL,
  `ThayDoiNN` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TongTien` decimal(18,2) DEFAULT '0.00',
  `NgayDat` date DEFAULT NULL,
  `NgayGiao` date DEFAULT NULL,
  `TinhTrangDH` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaNVGiao` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10000009 ;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`SoHD`, `ThayDoiNN`, `TongTien`, `NgayDat`, `NgayGiao`, `TinhTrangDH`, `MaNVGiao`, `MaKH`) VALUES
(10000001, 'Co', '414000.00', '2019-11-20', '2019-11-23', 'Hoàn tất', 1001, 1001),
(10000002, 'Khong', '214000.00', '2019-11-20', '2019-11-23', 'Trả lại hàng', 1005, 1002),
(10000003, 'Khong', '299000.00', '2019-11-25', NULL, 'Đang giao hàng', 1005, 1004),
(10000004, 'Co', '200000.00', '2019-11-25', NULL, 'Đợi người giao lấy hàng', 1001, 1003),
(10000005, 'Co', '365000.00', '2019-12-01', NULL, 'Đang chuẩn bị hàng', 1001, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE IF NOT EXISTS `khachhang` (
`MaKH` int(11) NOT NULL,
  `TenKH` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DienThoai` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GioiTinh` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `DiaChi` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1007 ;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `MatKhau`, `Email`, `DienThoai`, `GioiTinh`, `NgaySinh`, `DiaChi`) VALUES
(1001, 'Phan Mỹ Tâm', 'e10adc3949ba59abbe56e057f20f883e', 'pmtam@gmail.com', '0981246789', 'Nữ', '1991-01-16', '30 Trần Hưng Đạo, Q.1, TP. Hồ Chí Minh'),
(1002, 'Đàm Vĩnh Hưng', 'e10adc3949ba59abbe56e057f20f883e', 'lvhung@gmail.com', '0341238756', 'Nam', '1987-12-22', 'P. Hưng lợi, Q. Ninh Kiều, TP. Cần Thơ'),
(1003, 'Nguyễn Văn An', 'e10adc3949ba59abbe56e057f20f883e', 'nguyenva09@gmail.com', '0971246469', 'Nam', '1997-10-19', 'P. 10, TP. Đà Lạt, T. Lâm Đồng'),
(1004, 'Bùi Thu Thủy', 'e10adc3949ba59abbe56e057f20f883e', 'btthuy@gmail.com', '0241338777', 'Nữ', '1999-02-16', 'P. Nam Hà, TP. Hà Tĩnh, T. Hà Tĩnh'),
(1005, 'Lê Anh Minh', 'e10adc3949ba59abbe56e057f20f883e', 'laminh@gmail.com', '0123987056', 'Nam', '1980-11-25', 'P. Thuận Phước, Q. Hải Châu, TP. Đà Nẵng');

-- --------------------------------------------------------

--
-- Table structure for table `loaisach`
--

CREATE TABLE IF NOT EXISTS `loaisach` (
  `MaLoaiSach` varchar(4) NOT NULL,
  `TenLoaiSach` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loaisach`
--

INSERT INTO `loaisach` (`MaLoaiSach`, `TenLoaiSach`) VALUES
('LS01', 'Sách Khoa Học, Công Nghệ'),
('LS02', 'Sách Tâm Lý'),
('LS03', 'Sách Kinh Tế'),
('LS04', 'Sách Giáo Khoa'),
('LS05', 'Sách Học Ngoại Ngữ'),
('LS06', 'Sách Văn Học'),
('LS07', 'Sách Thiếu Nhi');

-- --------------------------------------------------------

--
-- Table structure for table `nguoinhanhang`
--

CREATE TABLE IF NOT EXISTS `nguoinhanhang` (
  `SoHD` int(11) NOT NULL,
  `TenNN` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DienThoai` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nguoinhanhang`
--

INSERT INTO `nguoinhanhang` (`SoHD`, `TenNN`, `DienThoai`, `DiaChi`) VALUES
(10000001, 'Võ Hoài Linh', '0987655577', 'P. Cam Linh, TP. Cam Ranh, T. Khánh Hòa'),
(10000004, 'Nguyễn Anh Quốc', '0966798765', 'P. Hà Huy Tập, TP. Hà Tĩnh, T. Hà Tĩnh'),
(10000005, 'Hà Anh Tuấn', '0981246789', '25 Nguyễn Văn Bình, Q.1, TP. Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE IF NOT EXISTS `nhanvien` (
`MaNV` int(11) NOT NULL,
  `TenNV` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ChucVu` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DienThoai` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GioiTinh` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `DiaChi` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1006 ;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `TenNV`, `ChucVu`, `MatKhau`, `Email`, `DienThoai`, `GioiTinh`, `NgaySinh`, `DiaChi`) VALUES
(1001, 'Hoàng Thái Vinh', 'Giao Hàng', 'e10adc3949ba59abbe56e057f20f883e', 'giaohang2@gmail.com', '0963455277', 'Nam', '1991-11-15', 'P. Sông Trí, Tx. Kỳ Anh, T. Hà Tĩnh'),
(1002, 'Nguyễn Văn An', 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@gmail.com', '0969667709', 'Nam', '1997-11-28', 'P. Thuận Phước, Q. Hải Châu, TP. Đà Nẵng'),
(1003, 'Hồ Thị Thảo', 'Kho', 'e10adc3949ba59abbe56e057f20f883e', 'kho2@gmail.com', '0233456666', 'Nữ', '1999-01-19', 'P. Sông Trí, Tx. Kỳ Anh, T. Hà Tĩnh'),
(1004, 'Hà Việt Anh', 'Kho', 'e10adc3949ba59abbe56e057f20f883e', 'kho@gmail.com', '0366777899', 'Nữ', '1998-05-10', 'P. Đại Nài, TP. Hà Tĩnh, T. Hà Tĩnh'),
(1005, 'Nguyễn Trọng Hiếu', 'Giao Hàng', 'e10adc3949ba59abbe56e057f20f883e', 'giaohang@gmail.com', '0123887756', 'Nam', '1996-12-05', 'P. Kỳ Liên, Tx. Kỳ Anh, T. Hà Tĩnh');

-- --------------------------------------------------------

--
-- Table structure for table `nhapsach`
--

CREATE TABLE IF NOT EXISTS `nhapsach` (
  `MaNS` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaNVKho` int(11) DEFAULT NULL,
  `MaSach` varchar(6) DEFAULT NULL,
  `SoLuongNhap` int(11) DEFAULT NULL,
  `NgayNhap` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nhapsach`
--

INSERT INTO `nhapsach` (`MaNS`, `MaNVKho`, `MaSach`, `SoLuongNhap`, `NgayNhap`) VALUES
('NS0001', 1003, 'SKC001', 10, '2019-09-19'),
('NS0002', 1004, 'SKC002', 10, '2019-10-19'),
('NS0003', 1004, 'SKC003', 10, '2019-10-22'),
('NS0004', 1004, 'SKC004', 10, '2019-11-25'),
('NS0005', 1003, 'SKC005', 10, '2019-12-05'),
('NS0006', 1003, 'SKC006', 10, '2019-09-19'),
('NS0007', 1004, 'STL007', 10, '2019-10-19'),
('NS0008', 1004, 'STL008', 10, '2019-10-22'),
('NS0009', 1004, 'SKT009', 10, '2019-11-25'),
('NS0010', 1003, 'SKT010', 10, '2019-12-25');

-- --------------------------------------------------------

--
-- Table structure for table `sach`
--

CREATE TABLE IF NOT EXISTS `sach` (
  `MaSach` varchar(6) NOT NULL,
  `TenSach` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DonGia` decimal(18,2) DEFAULT NULL,
  `SoLuong` int(11) NOT NULL,
  `UrlHinh` varchar(100) DEFAULT NULL,
  `NoiDung` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TacGia` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NamXB` int(11) NOT NULL,
  `NXB` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaLoaiSach` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` (`MaSach`, `TenSach`, `DonGia`, `SoLuong`, `UrlHinh`, `NoiDung`, `TacGia`, `NamXB`, `NXB`, `MaLoaiSach`) VALUES
('SGK011', 'Tự nhiên và xã hội 1', '6000.00', 50, 'gk1.jpg', '<p>\r\n- Cuốn sách giáo khoa "tự nhiên và xã hội lớp 1" do Nhà Xuất Bản Giáo Dục ấn hành nhằm giúp các em học sinh lớp 1 làm quen, nhận biết các hiện tượng sự vật xung quanh, giúp các em bước đầu giải thích được các hiện tượng đơn giản diễn ra trong cuộc sống hằng ngày.\r\n</p>\r\n<p>\r\n- Tự Nhiên Và Xã Hội Lớp 1 là sách giáo khoa cơ bản được Bộ Giáo Dục Đào Tạo tổ chức biên soạn và ban hành. Tập sách gồm các nội dung chính như sau: Con người và sức khỏe; Xã hội; Tự nhiên.\r\n</p>', 'Bộ Giáo dục và Đào tạo', 2019, 'Nhà Xuất Bản Giáo Dục Việt Nam', 'LS04'),
('SGK012', 'Toán 1', '13000.00', 50, 'gk2.jpg', '<p>\r\n- Cuốn sách giáo khoa "toán lớp 1" do Nhà Xuất Bản Giáo Dục ấn hành nhằm giúp các em học sinh lớp 1 bước đầu làm quen với môn toán </p>\r\n<p>\r\n- Sách giáo khoa Toán lớp 1, gồm các phần: Các số đến 10, hình vuông, hình tròn, hình tam giác. Phép cộng, phép trừ trong phạm vi 10. Các số trong phạm vi 100, đo độ dài. Phép cộng, phép trừ trong phạm vi 100, đo thời gian.\r\n</p>', 'Bộ Giáo dục và Đào tạo', 2019, 'Nhà Xuất Bản Giáo Dục Việt Nam', 'LS04'),
('SKC001', 'Phát triển web cho Smartphone', '155000.00', 50, 'c1.jpg', '<p>\r\n- Khi ngày càng nhiều người truy cập Web từ điện thoại và các thiết bị di động khác, các nhà phát triển Web cần biết cách xây dựng trang Web có khả năng đáp ứng tốt cho các thiết bị này. Muốn vây, họ cần học những kỹ thuật, nghiên cứu những vấn đề mang tính đặ thù liên quan tới việc phân phối nội dung Web cho thiết bị di động. Nếu bạn là nhà phát triển và thiết kế Web đang bắt đầu tìm hiểu về Web trên di ddoonngj thì đây chính là cuốn sách dành cho bạn.\r\n</p>\r\n<p>\r\n- Phát triển Web cho smartphone giới thiệu về cú pháp, ngữ nghĩa và hệ sinh thái của Web trên di động. Cuốn sách hướng dẫn cách xây dựng những trang Web trên di động có khả năng thích ứng, hồi đáp và đạt các tiêu chuẩn giúp đảm bảo trang Web chạy được trên mọi trình duyệt di động. Bạn đọc cũng sẽ nghiên cứu thuộc tính đặc trưng của thiết bị, hệ sinh thái và người dùng di động, từ đó biết cách áp dụng những phương pháp kỹ thuật tốt nhất vào việc phát triển Web cho thiết bị di động.\r\n</p>', 'Gail Rahn Frederick, Rajesh Lal', 2019, 'Bách Khoa Hà Nội', 'LS01'),
('SKC002', 'Tự học VB.NET Và SQL SERVER 2008', '59000.00', 50, 'c2.jpg', '<p>\r\n- Nội dung sách gồm 2 phần:\r\n</p>\r\n<p>\r\n- Phần 1: Hệ quản trị cơ sở dữ liệu SQL Server 2008\r\nGiới thiệu về phiên bản SQL Server 2008, và một số xử lý trong SQL Server 2008\r\n</p>\r\n<p>\r\n- Phần 2: Xây dựng ứng dụng quản lý với VB.NET\r\nGiới thiệu chung về VB.NET, giới thiệu Dự án  "Quản lý vật tư", xây dựng Form danh mục, xây dựng Form chứng từ, xây dựng các báo cáo thống kê.\r\n</p>', 'KS. Hoàng Anh Quang', 2012, 'Hồng Đức', 'LS01'),
('SKC003', 'Lập trình với Scratch', '200000.00', 50, 'c3.jpg', '<p>\r\n- Cuốn sách “Lập trình với Scratch” được xuất bản lần đầu tiên vào tháng 12 năm 2016. Với 5000 ấn phẩm đã đến tay của nhiều anh chị giáo viên, quý phụ huynh và các em học sinh. Nhận được nhiều phản ánh tích cực và sự mong đợi của các độc giả trên mọi miền tổ quốc Học viện Vietstem tái bản cuốn sách một cách nhanh chóng.\r\n</p>\r\n<p>\r\n- Cuốn sách được viết theo phong cách trực quan, đồ họa sống động. Hướng dẫn chi tiết cách cài đặt, sử dụng và lập trình nhiều sản phẩm liền tay. Vì vậy cuốn sách rất phù hợp cho người mới bắt đầu học lập trình Scratch và học sinh từ 8 đến 16 tuổi.\r\nMột lưu ý nhỏ để sử dụng sách một cách hiệu quả, đối với học sinh cần có một số kiến thức nhất định về sử dụng chuột và bàn phím máy tính, biết đếm đến 480, hiểu được phép nhân và phép chia. Nhiều khái niệm phức tạp hơn như số âm, phân số, trục tọa độ, số đo góc sẽ được giải thích bổ sung trong cuốn sách.\r\n</p>', 'Nguyễn Hữu Hưng (chủ biên)', 2018, 'Đại học Quốc Gia Hà Nội', 'LS01'),
('SKC004', 'Cuộc cách mạng Blockchain', '299000.00', 50, 'c4.jpg', '<p>\r\n- Cuộc Cách Mạng Blockchain: Công nghệ có thể tác động lớn đến tương lai của nền kinh tế thế giới đã xuất hiện, đó không phải là ô tô tự lái, là năng lượng mặt trời hay trí thông minh nhân tạo. Đó chính là Blockchain.\r\n</p>\r\n<p>\r\n- Thế hệ thứ nhất của cuộc cách mạng số hóa đã đưa chúng ta đến với kỷ nguyên Internet của thông tin.\r\nThế hệ thứ hai – được tiếp sức bởi công nghệ blockchain – đang đưa chúng ta đến với Internet của giá trị: một nền tảng phi tập trung mới mẻ, thứ có thể giúp chúng ta tái định hình ngành kinh doanh và thay đổi cách thức hoạt động của con người theo hướng tốt hơn.\r\n</p>', 'Don Tapscott, Alex Tapscott', 2018, 'Đại học Kinh Tế Quốc Dân', 'LS01'),
('SKC005', 'Các hành tinh (Planets)', '699000.00', 50, 'kh1.jpg', '<p>\r\n- Một quyển sách chứa đầy những thông tin, hình ảnh sắc nét như đem chính chúng ta tới những miền hẻo lánh, xa xôi nhất của Hệ Mặt trời.\r\nNó cho chúng ta thấy được quang cảnh chi tiết và đem đến cho chúng ta những thông tin mới mẻ nhất về các đặc điểm địa hình, địa chất, khí quyển, các suy đoán cùng toàn bộ lịch sử phát hiện và thám hiểm những thiên thể xa xôi mà con người đã, hoặc chưa thể với tới.  \r\n</p>\r\n<p>\r\n- Đây sẽ là quyển sách dành cho bất kỳ ai có bộ óc phiêu lưu, muốn phá tan các giới hạn và có khát vọng nắm bắt các bí ẩn của vũ trụ nói chung và Hệ Mặt trời nói riêng.\r\n</p>', 'Maggie Aderin Pocock', 2018, 'Dân Trí', 'LS01'),
('SKC006', '6 Phát Minh Làm Nên Thời Đại', '165000.00', 50, 'kh2.jpg', '<p>\r\n- Steven Johnson đích thực là chuyên gia bậc thầy của lịch sử ý tưởng. Trong cuốn sách này, ông chỉ tập trung vào sáu công nghệ và khám phá các phân nhánh của chúng, cả mặt tốt lẫn không tốt. Ông đã tạo ra biểu trưng hình ảnh chim ruồi cho các loại hình phát minh mà mình quan tâm: sự đồng tiến hóa của hoa và côn trùng – kẻ không mời từ một trật tự sáng tạo khác.\r\n</p>\r\n<p>\r\n- Johnson nhấn mạnh rằng nhiều phát minh không phải là kết quả của “phút Eureka” mà là sự chín muồi của một tiến trình dài bao gồm một mạng lưới các nhà phát minh và doanh nghiệp. Ông đã cố xoay xở và cuối cùng đã tìm ra cách định nghĩa khoảnh khắc này. Dữ liệu số được truyền dẫn lần đầu tiên năm 1943 qua một đường dây mật SIGSALYY được Alan Turing và Phòng thí nghiệm Bell phát triển: Turing là một nhà sáng chế thiên tài.\r\n</p>', 'Steven Johnson', 2018, 'Thế Giới', 'LS01'),
('SKT009', 'Kỷ nguyên tiền điện tử', '189000.00', 50, 'kt1.jpg', '<p>\r\n- Từ một ảo ảnh biến thành hiện thực, từ một ý niệm trở thành hành động; và trong chưa đầy một thập kỷ, Bitcoin cùng nhiều loại tiền kỹ thuật số đã khuấy đảo cả hành tinh. Mới hôm trước, mọi thứ vẫn còn bình lặng. Nhưng chỉ sau một đêm, Bitcoin khiến toàn bộ thế giới xung quanh bạn rung chuyển. Từ “Bitcoin” xuất hiện trên mọi tít báo bạn lướt qua, và làm bùng nổ những cuộc tranh luận vô tận.\r\nNgười ta có rất nhiều cách gọi tên Bitcoin. Nó là tiền điện tử, tiền ảo, hay tiền mật mã (cryptocurrency). Bạn có thể sử dụng nó để mua bất cứ thứ gì, từ cà phê đến ô tô. Nhưng kể cả khi thế giới đang đổ xô vào cuộc đầu tư qui mô toàn cầu này, vẫn thật khó để trả lời: Bitcoin thực sự là gì, và tại sao mọi người lại cần quan tâm đến Bitcoin, cũng như công nghệ đằng sau nó - công nghệ Blockchain?\r\n</p>\r\n<p>\r\n- “Kỷ nguyên tiền điện tử” đưa chúng ta đến những nơi Bitcoin và Blockchain đang hiện hữu, từ những quốc gia nghèo khó châu Phi tới lãnh địa công nghệ châu Mỹ, từ những nền kinh tế mới nổi ở châu Á tới xứ sở ngân hàng châu Âu - để thấu hiểu thực trạng nền kinh tế thế giới trước sự nổi lên của tiền điện tử, và trả lời câu hỏi hóc búa: Liệu Bitcoin và công nghệ của nó, Blockchain, có thực sự thay đổi cả thế giới như cách Internet đã làm, theo lời tiên đoán của nhiều người hay không?\r\n</p>', 'Paul Vigna, Michael J. Casey', 2017, 'Đại Học Kinh Tế Quốc Dân', 'LS03'),
('SKT010', 'Một đời quản trị', '135000.00', 50, 'kt2.jpg', '<p>\r\n- Có rất nhiều doanh nhân vĩ đại, những người sáng lập, xây dựng, điều hành những công ty hàng đầu thế giới với doanh thu cả trăm tỷ đô-la Mỹ, những công ty sáng tạo công nghệ và sản phẩm làm thay đổi thế giới, nhưng họ không viết sách dù rằng có nhiều sách viết về họ.\r\nGS. Phan Văn Trường khác họ. Ông đã từng đứng đầu các tập đoàn khổng lồ với doanh thu 60-70 tỷ đô-la Mỹ, hoạt động trên cả trăm quốc gia, với hàng chục nghìn nhân viên đủ các quốc tịch. Và ông viết sách. Chính xác hơn là ông ghi lại những gì tinh túy nhất và lại giản dị nhất của một doanh nhân người Việt tầm cỡ Global.\r\n</p>\r\n<p>\r\n- Có lẽ những điều trên bạn đã gặp ở rất nhiều cuốn sách nhưng ở đây có 2 điều khác biệt:\r\n- Là bài học thực tế, là tinh túy của một doanh nhân tầm cỡ Global\r\n- Hành xử chuyên nghiệp, quyết định sáng suốt, thành công lớn…ở tầm Global  nhưng vẫn mang đậm chất Việt, đậm chất nhân văn.\r\nVà đặc biệt những câu chuyện của ông, những bài học của ông lại được kể bằng những con người thực Ông đã cùng làm việc, bằng những câu chuyện thực của đời mình\r\n</p>', 'Phan Văn Trường', 2019, 'Nhà Xuất Bản Trẻ', 'LS03'),
('SNN013', 'Giải thích ngữ pháp tiếng Anh', '110000.00', 50, 'n1.jpg', '<p>\r\n- Giải Thích Ngữ Pháp Tiếng Anh Với Bài Tập Và Đáp Án\r\n</p>\r\n<p>\r\n- Giải thích ngữ pháp tiếng Anh gồm 9 chương, trình bày những chủ điểm ngữ pháp tiếng Anh từ cơ bản đến nâng cao, phù hợp với mọi trình độ. Các chủ điểm ngữ pháp trong từng chương được biên soạn chi tiết, giải thích cặn kẽ các cách dùng và quy luật mà người học cần nắm vững. Sau mỗi chủ điểm ngữ pháp là phần bài tập đa dạng nhằm giúp người học củng cố phần lý thuyết.\r\n</p>', 'Mai Lan Hương, Hà Thanh', 2019, 'Đà Nẵng', 'LS05'),
('SNN014', 'Cambridge IELTS 10 with Answers', '120000.00', 50, 'n2.jpg', '<p>\r\n- Cambridge IELTS 10 là bộ tài liệu IELTS huyền thoại mà bất kể một thí sinh luyện thi IELTS nào cũng biết đến và nên có.\r\nĐây là bộ tài liệu do đại học Cambridge tổng hợp dựa trên đề thi thực tế các năm của kỳ thi Cambridge English Language Assessment. Mỗi tập sách sẽ cung cấp các bài Test IELTS chất lượng với đầy đủ các kĩ năng Speaking – Listening – Writing và Reading, giúp cho thí sinh học IELTS được cọ sát gần nhất với lối ra đề thi IELTS.\r\n</p>\r\n<p>\r\n- Qua các bài test, học viên đánh giá được trình độ IELTS của bản thân ở thời điểm hiện tại và xác định hướng học cho phù hợp để ôn thi tốt nhất.\r\n</p>', 'Cambridge English', 2015, 'Cambridge University', 'LS05'),
('STL007', 'Ngôn ngữ cơ thể trong tình yêu', '128000.00', 50, 't1.jpg', '<p>\r\n- Cuốn sách này, cùng tác giả với cuốn sách đã bán được triệu bản. The Definitive book of body language sẽ cung cấp cho bạn tất cả những điều cần biết về ngôn ngữ cơ thể trong tình yêu để từ đó bạn có thể hiểu rõ: Cuộc chơi hẹn hò;\r\n\r\nNghệ thuật tỏ tình và các tín hiệu tán tỉnh;\r\n\r\nHẹn hò tốc độ, cuộc hẹn đầu tiên, những buổi tiệc tùng, hẹn hò qua mạng và các "sứ mạng cảm từ" khác;\r\n\r\nBí quyết để có những mối quan hệ tình cảm thành công\r\n</p>\r\n<p>\r\n- Thông qua việc hướng dẫn bạn từ cách sử dụng ngôn ngữ cơ thể để gia tăng khả năng tìm được bạn đời đến cách đối phó với các vấn đề nảy sinh trong mối quan hệ tình cảm, cuốn Ngôn ngữ cơ thể trong tình yêu sẽ giúp bạn nhận biết và chỉnh sửa kiểu ngôn ngữ cơ thể gây bất lợi cho bạn.\r\n</p>', 'Allan , BPease', 2014, 'Tổng Hợp TP.HCM', 'LS02'),
('STL008', 'Tâm lý học và đời sống', '370000.00', 50, 't2.jpg', '<p>\r\n- Tâm lý học và đời sống là cuốn sách đồ sộ, đề cập và đi sâu khai thác rất nhiều chủ đề về tâm lý con người dựa trên kết quả của hàng trăm công trình thực nghiệm do các nhà nghiên cứu tâm lý thực hiện. Đó là những nghiên cứu đáng tin cậy được tập hợp từ nhiều nơi trên khắp thế giới, ở nhiều thời điểm lịch sử cho đến thế kỷ 21, trên nhiều quy mô khác nhau. Các chủ đề tâm lý con người, từ nhận thức đến hành vi chủ quan cũng như tác động của hoàn cảnh, đều được phân tích đầy đủ trong cuốn sách này. Đây sẽ là một tài liệu tổng quát và chuyên sâu giúp bạn nghiên cứu các vấn đề tâm lý học trong đời sống hàng ngày một cách có hệ thống và dễ tiếp thu nhất.\r\n</p>\r\n<p>\r\n- Về các tác giả:\r\n   Richard J. Gerrig là giáo sư tâm lý học Đại học Stony Brook. Trước khi giảng dạy tại Stony Brook, Gerrig giảng dạy tại Đại học Yale, nơi ông nhận giải thưởng The Lex Hixon. Nghiên cứu của Gerrig về các lĩnh vực tâm lý học nhận thức trong việc sử dụng ngôn ngữ được đánh giá cao. Phạm vi nghiên cứu là các hoạt động thần kinh ẩn dưới tiến trình thông tin.\r\n</p>', 'Richard J. Gerrig, Philip G. Zimbardo', 2018, 'Tổng Hợp TP.HCM', 'LS02'),
('STN021', 'Thế giới khủng long - những kẻ nguy hiểm', '32000.00', 50, 'tn1.jpg', '<p>\r\n- Bộ sách Thế Giới Khủng Long giúp các em hiểu về những loài khủng long thống trị Trái Đất hơn 165 triệu năm trong suốt Đại Trung Sinh, nhưng chúng đã bị tuyệt chủng vào 65 triệu năm trước. Mỗi cuốn sách trong bộ sách cung cấp những thông tin xúc tích cùng tranh minh họa hấp dẫn sẽ đưa độc giả nhỏ tuổi đi vào chuyến phiêu lưu trở lại thời tiền sử để khám phá và hiểu hơn về loại khủng long cổ xưa.\r\n</p>\r\n<p>\r\n- Bộ sách Thế giới khủng long gồm 4 cuốn: Những kẻ nguy hiểm; Những kẻ khổng lồ; Những kẻ nhỏ bé; Sự tiến hóa và khai quật.\r\n</p>', 'Nhiều Tác Giả', 2018, 'Văn Hóa - Văn Nghệ TP.HCM', 'LS07'),
('STN022', 'Kid Start-up Khởi nghiệp từ khi lên 7', '99000.00', 50, 'tn2.jpg', '<p>\r\n- Nếu các em đang tìm cách để vừa kiếm ra tiền, vừa giúp đỡ được mọi người, thì tinh thần khởi nghiệp hoàn toàn phù hợp với các em rồi đấy.\r\n</p>\r\n<p>\r\n- Các em có thể chỉ còn đang băn khoăn, không hiểu bắt đầu một công việc kinh doanh ở tuổi thiếu niên có sớm quá không, và liệu các em có thể thành công?\r\n</p>\r\n<p>\r\n- Hiện nay thật dễ dàng tìm được các lớp học dạy cách bắt đầu một sự nghiệp kinh doanh, nhưng chỉ có tự mình trải nghiệm việc khởi sự một doanh nghiệp mới dạy cho các em những điều tuyệt vời nhất về tinh thần khởi nghiệp. Và cuốn sách Kid Start - Up Khởi Nghiệp Từ Khi Lên 7 này sẽ chỉ dẫn các em rất nhiều điều trong hành trình đó!\r\n</p>', '	\r\nIan McCue, Shaan Patel, Mark Cuban', 2019, 'Thế Giới', 'LS07'),
('STN023', 'Doraemon (Tập 11)', '12500.00', 50, 'tn3.jpg', '<p>\r\n- Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vương tới những tầm cao.\r\n</p>\r\n<p>\r\n- Cuốn sách này tập hợp những câu chuyện vô cùng thú vị về chú mèo máy Doraemon: Viên cảm tình, Câu chuyện cảm động, Mây tạo tuyết...\r\n</p>', 'Fujiko-F-Fujio', 2015, 'Nhà Xuất Bản Kim Đồng', 'LS07'),
('STN024', 'Doraemon (Tập 11)', '18000.00', 50, 'tn4.jpg', '<p>\r\n- Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vương tới những tầm cao.\r\n</p>\r\n<p>\r\n- Cuốn sách này tập hợp những câu chuyện vô cùng thú vị về chú mèo máy Doraemon: Viên cảm tình, Câu chuyện cảm động, Mây tạo tuyết...\r\n</p>', 'Fujiko-F-Fujio', 2019, 'Nhà Xuất Bản Kim Đồng', 'LS07'),
('SVH015', 'Vũ trung tùy bút', '75000.00', 50, 'vh1.jpg', '<p>\r\n- Sách Vũ Trung Tùy Bút là một tác phẩm đặc sắc trong thời kỳ Lê mạt Nguyễn sơ (cuối thế kỷ 18 và thế kỷ 19), độc giả sẽ hiểu được một chặng đường lịch sử và một thể văn sau này thành thể văn sở trường của nhà văn Nguyễn Tuân.\r\n</p>\r\n<p>\r\n- "Các tác phẩm buổi ấy phần nhiều ghi chép những điều các tác giả đã trông nghe thấy theo thể văn tùy bút (theo ngọn bút ý nói gặp cái gì chép cái ấy). Vũ Trung Tùy Bút nghĩa là theo ngọn bút viết trong khi mưa". - Giáo sư Dương Quảng Hàm\r\n</p>\r\n<p>\r\n- "Vũ Trung Tùy Bút là một tác phẩm văn học đặc sắc trong thời kỳ Lê mạt Nguyễn sơ (cuối thế kỷ 18 và thế kỷ 19). Đọc cuốn này, độc giả sẽ hiểu được một chặng đường lịch sử và một thể văn sau này thành thể văn sở trường của nhà văn Nguyễn Tuân." - Giáo sư Hoàng Như Mai\r\n</p>', 'Phạm Đình Hổ', 2019, 'Văn Hóa Dân Tộc', 'LS06'),
('SVH016', 'Lãng du xứ Huế', '450000.00', 50, 'vh2.jpg', '<p>\r\n- Đọc Lãng Du Xứ Huế, độc giả có thể nhận thấy sự ngẫu hứng, lãng mạn của một lãng tử, nhưng cũng lại rất cẩn thận chỉn chu của một người làm khoa học.\r\n</p>\r\n<p>\r\n- Lãng Du Xứ Huế là một chuyến đi có chủ đích, bắt đầu từ sông Hương – dòng sông tạo nên gương mặt của đất Huế, rồi tới Kinh Thành cổ kính – trọng địa của kinh đô, cùng các vùng phụ cận ở bờ bắc sông Hương, rồi qua bờ nam, đi ra các ngả đường ngoại ô... Cách sắp xếp khá đơn giản nhưng hiệu quả để người ta dễ hình dung ra một xứ Huế từ Bắc tới Nam, từ xưa tới nay, từ sự tĩnh lặng của công trình tới tiếng động của âm thanh cuộc sống... Ở đó còn có những câu chuyện lịch sử hàng trăm năm và cả những câu chuyện đời.\r\n</p>', 'Nguyễn Trần Đức Anh', 2019, 'Thế Giới', 'LS06'),
('SVH017', 'Làm bạn với bầu trời', '220000.00', 50, 'vh3.jpg', '<p>\r\n- Làm Bạn Với Bầu Trời là một câu chuyện văn học giản dị, chứa đầy bất ngờ cho tới trang cuối cùng. Và đẹp lộng lẫy, vì lòng vị tha và tình yêu thương, khiến mắt rưng rưng vì một nỗi mừng vui hân hoan. Cuốn sách như một đốm lửa thắp lên lòng khát khao sống tốt trên đời.\r\n</p>\r\n<p>\r\n- Viết về điều tốt đã không dễ, viết sao cho người đọc có thể đón nhận đầy cảm xúc tích cực, và muốn  được hưởng, được làm những điều tốt dù nhỏ bé... mới thật là khó. Làm bạn với bầu trời của Nguyễn Nhật Ánh đã làm được điều này, anh đã “mô tả cái tốt thật đẹp để người ta yêu thích nó”, như  anh  từng phát biểu “... điểm mạnh của văn chương nằm ở khả năng thẩm thấu. Bằng hình thức đặc thù của mình, văn chương góp phần mài sắc các ý niệm đạo đức nơi người đọc một cách vô hình. Bồi đắp tâm hồn và nhân cách một cách âm thầm và bền bỉ, đó là chức năng gốc rễ của văn chương, đặc biệt là văn chương viết cho thanh thiếu niên.”\r\n</p>', 'Nguyễn Nhật Ánh', 2019, 'Nhà Xuất Bản Trẻ', 'LS06'),
('SVH018', 'Thơ văn Hàn Mặc Tử', '200000.00', 50, 'vh4.jpg', '<p>\r\n- Độc giả đọc thơ, học sinh sinh viên học tập, giáo viên bình giảng, nhà nghiên cứu khảo cứu, nhà lý luận khảo luận… hầu hết đều cho rằng thơ Hàn Mạc Tử hay nhưng khó hiểu! \r\nCòn Hàn Mạc Tử, tác giả của những vần thơ khó hiểu đã nói gì về lối thơ bí hiểm của mình? “Cứ theo như lối thơ tôi làm đó thì phải giảng giải biết bao nhiêu trang giấy mà rốt cuộc chưa chắc người ta đã hiểu được tí gì… Và như thế sự cắt nghĩa đối với thơ là vô ích. Người ta cảm biết một cách tự nhiên”.\r\n</p>\r\n<p>\r\n- Với những nguồn tư liệu phong phú, tác giả đã mạnh dạn biên soạn Thơ Văn Hàn Mạc Tử, không ngoài mục đích giới thiệu riêng phần văn với những bài thơ văn xuôi, những lời tựa, lời bạt và những bài báo lý luận phê bình của nhà thơ thiên tài Hàn Mạc Tử.\r\n</p>', 'Trần Quang Chu', 2018, 'Văn Học', 'LS06'),
('SVH019', 'Thơ Xuân Quỳnh', '35000.00', 50, 'vh5.jpg', '<p>\r\n- Xuân Quỳnh đã để lại dấu ấn đậm nét trong dòng thơ tình Việt Nam. Thơ của cô là tiếng lòng của một tâm hồn phụ nữ thấm đẫm tình cảm. Cô dành nhiều tâm huyết cho đề tài tình yêu và là một trong những người viết thơ tình hay nhất ở thời đại chúng ta.\r\n</p>\r\n<p>\r\n- Tuyển tập Thơ Xuân Quỳnh giới thiệu tới bạn đọc những bài thơ tình giàu cảm xúc, nồng nàn và dữ dội như Thơ viết cho mình và những người con gái khác, Sóng hay những bài thơ dung dị viết tặng các con trai yêu quý của cô như Chùm thơ xuân cho ba con nhỏ (tặng Tuấn Anh, tặng Minh Vũ, tặng Quỳnh Thơ). Tất cả nhờ tình yêu thương, thấm đẫm nữ tính ấy mà bất chấp mọi khổ đau, buồn phiền của một duyên phận nhiều lận đận, Xuân Quỳnh để lại trong thơ niềm tin vững chắc về sự hiện diện của hạnh phúc có thật giữa trần gian này.\r\n</p>', 'Xuân Quỳnh', 2019, 'Văn Học', 'LS06'),
('SVH020', 'Tôi thấy hoa vàng trên cỏ xanh', '125000.00', 50, 'vh6.jpg', '<p>\r\n- Đây là một trong các truyện dài của Nguyễn Nhật Ánh, ra đời sau Đảo mộng mơ và trước Lá nằm trong lá. Cuốn sách "tôi thấy hoa vàng trên cỏ xanh" gợi nhớ cho tôi một thế giới đầy những bất ngờ và hương vị thơ ngây cùng những suy nghĩ giản dị đến bình dị nhưng lại toát lên vẻ đẹp và gần gũi đến lạ thường. Câu chuyện "Tôi thấy hoa vàng trên cỏ xanh" có những lúc bấp bênh khúc này, khúc kia nên mỗi ai khi đọc cuốn sách này đều thấy mình trong đó nó mang đậm hương vị của một là thứ tình đầu đời của cu Thiều chẳng hạn... ngây thơ và khờ khạo.\r\n</p>\r\n<p>\r\n- Nhưng "Tôi thấy hoa vàng trên cỏ xanh" không trong trẻo và thuần khuyết như những tác phẩm trước của nhà văn, nó không còn trọn vẹn của một thế giới tuổi thơ nữa. Mặc dù cuốn sách vẫn toát lên sự dí dỏm, ngọt ngào nhưng ẩn sâu trong nó một nỗi buồn phảng phất, về một người cha trốn nhà không muốn các con cơ khổ do bệnh tật.\r\n</p>', 'Nguyễn Nhật Ánh', 2019, 'Nhà Xuất Bản Trẻ', 'LS06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
 ADD PRIMARY KEY (`SoHD`,`MaSach`), ADD KEY `FK__ChiTietHo__MaSac__286302EC` (`MaSach`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
 ADD PRIMARY KEY (`SoHD`), ADD KEY `FK__HoaDon__MaNV_NV` (`MaNVGiao`), ADD KEY `FK__HoaDon__MaKH__KH` (`MaKH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
 ADD PRIMARY KEY (`MaKH`), ADD UNIQUE KEY `UQ__KhachHan__1F0318762F4AE563` (`DienThoai`), ADD UNIQUE KEY `UQ__KhachHan__A9D10534F73F748B` (`Email`);

--
-- Indexes for table `loaisach`
--
ALTER TABLE `loaisach`
 ADD PRIMARY KEY (`MaLoaiSach`);

--
-- Indexes for table `nguoinhanhang`
--
ALTER TABLE `nguoinhanhang`
 ADD PRIMARY KEY (`SoHD`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
 ADD PRIMARY KEY (`MaNV`), ADD UNIQUE KEY `UQ__NhanVien__1F0318769AFB27F6` (`DienThoai`), ADD UNIQUE KEY `UQ__NhanVien__A9D10534A1AEC144` (`Email`);

--
-- Indexes for table `nhapsach`
--
ALTER TABLE `nhapsach`
 ADD PRIMARY KEY (`MaNS`), ADD KEY `FK__NhapSach_MaNV_NV` (`MaNVKho`), ADD KEY `FK__NhapSach__MaSach__Sach` (`MaSach`);

--
-- Indexes for table `sach`
--
ALTER TABLE `sach`
 ADD PRIMARY KEY (`MaSach`), ADD KEY `idx_sach` (`MaSach`,`TenSach`), ADD KEY `FK__Sach__MaLoaiSach__1BFD2C07` (`MaLoaiSach`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
MODIFY `SoHD` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10000009;
--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1007;
--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1006;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
ADD CONSTRAINT `FK__ChiTietHo__MaSac__286302EC` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `FK__ChiTietHoa__SoHD__276EDEB3` FOREIGN KEY (`SoHD`) REFERENCES `hoadon` (`SoHD`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
ADD CONSTRAINT `FK__HoaDon__MaKH__KH` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `FK__HoaDon__MaNV_NV` FOREIGN KEY (`MaNVGiao`) REFERENCES `nhanvien` (`MaNV`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `nguoinhanhang`
--
ALTER TABLE `nguoinhanhang`
ADD CONSTRAINT `FK__NNH__SoHD__HD` FOREIGN KEY (`SoHD`) REFERENCES `hoadon` (`SoHD`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `nhapsach`
--
ALTER TABLE `nhapsach`
ADD CONSTRAINT `FK__NhapSach_MaNV_NV` FOREIGN KEY (`MaNVKho`) REFERENCES `nhanvien` (`MaNV`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `FK__NhapSach__MaSach__Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sach`
--
ALTER TABLE `sach`
ADD CONSTRAINT `FK__Sach__MaLoaiSach__1BFD2C07` FOREIGN KEY (`MaLoaiSach`) REFERENCES `loaisach` (`MaLoaiSach`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
