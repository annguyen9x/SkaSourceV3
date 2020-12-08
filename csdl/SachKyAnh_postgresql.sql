--﻿Create database SachKyAnh;
--Go
--Use SachKyAnh

Create table KhachHang(
MaKH bigserial primary key,
TenKH varchar(30) not null,
MatKhau varchar(50) not null,
Email varchar(30) unique not null,
DienThoai varchar(10) unique not null,
GioiTinh varchar(10) not null,
NgaySinh date not null,
DiaChi varchar(100) not null
);
--set utf8
SELECT setval('KhachHang_MaKH_seq', 1000);

Insert into KhachHang(TenKH, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Phan Mỹ Tâm','e10adc3949ba59abbe56e057f20f883e','pmtam@gmail.com', '0981246789', N'Nữ', '1991-1-16',N'30 Trần Hưng Đạo, Q.1, TP. Hồ Chí Minh');
Insert into KhachHang(TenKH, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Đàm Vĩnh Hưng','e10adc3949ba59abbe56e057f20f883e','lvhung@gmail.com', '0341238756', N'Nam','1987-12-22', N'P. Hưng lợi, Q. Ninh Kiều, TP. Cần Thơ');
Insert into KhachHang(TenKH, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Nguyễn Văn An','e10adc3949ba59abbe56e057f20f883e','nguyenva09@gmail.com', '0971246469', N'Nam', '1997-10-19',N'P. 10, TP. Đà Lạt, T. Lâm Đồng');
Insert into KhachHang(TenKH, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Bùi Thu Thủy','e10adc3949ba59abbe56e057f20f883e','btthuy@gmail.com', '0241338777', N'Nữ','1999-02-16', N'P. Nam Hà, TP. Hà Tĩnh, T. Hà Tĩnh');
Insert into KhachHang(TenKH, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Lê Anh Minh','e10adc3949ba59abbe56e057f20f883e','laminh@gmail.com', '0123987056', N'Nam','1980-11-25', N'P. Thuận Phước, Q. Hải Châu, TP. Đà Nẵng');

Create table NhanVien(
MaNV bigserial primary key,
TenNV varchar(30) not null,
ChucVu varchar(30) not null,
MatKhau varchar(50) not null,
Email varchar(30) not null unique,
DienThoai varchar(10) not null unique,
GioiTinh varchar(10) not null,
NgaySinh date not null,
DiaChi varchar(100) not null
);
SELECT setval('NhanVien_MaNV_seq', 1000);

Insert into NhanVien(TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Hoàng Thái Vinh', N'Giao Hàng', 'e10adc3949ba59abbe56e057f20f883e', 'giaohang2@gmail.com', '0963455277', N'Nam', '1991-11-15',N'P. Sông Trí, Tx. Kỳ Anh, T. Hà Tĩnh');
Insert into NhanVien(TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Nguyễn Văn An', N'Admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@gmail.com', '0969667709', N'Nam', '1997-11-28',N'P. Thuận Phước, Q. Hải Châu, TP. Đà Nẵng');
Insert into NhanVien(TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Hồ Thị Thảo', N'Kho', 'e10adc3949ba59abbe56e057f20f883e', 'kho2@gmail.com', '0233456666', N'Nữ', '1999-01-19',N'P. Sông Trí, Tx. Kỳ Anh, T. Hà Tĩnh');
Insert into NhanVien(TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Hà Việt Anh', N'Kho', 'e10adc3949ba59abbe56e057f20f883e', 'kho@gmail.com', '0366777899', N'Nữ', '1998-05-10',N'P. Đại Nài, TP. Hà Tĩnh, T. Hà Tĩnh');
Insert into NhanVien(TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) 
Values(N'Nguyễn Trọng Hiếu', N'Giao Hàng', 'e10adc3949ba59abbe56e057f20f883e', 'giaohang@gmail.com', '0123887756', N'Nam', '1996-12-05',N'P. Kỳ Liên, Tx. Kỳ Anh, T. Hà Tĩnh');

Create table LoaiSach(
MaLoaiSach varchar(4) primary key,
TenLoaiSach varchar(100) not null,
);

Insert into LoaiSach Values('LS01', N'Sách Khoa Học, Công Nghệ');
Insert into LoaiSach Values('LS02', N'Sách Tâm Lý');
Insert into LoaiSach Values('LS03', N'Sách Kinh Tế');
Insert into LoaiSach Values('LS04', N'Sách Giáo Khoa');
Insert into LoaiSach Values('LS05', N'Sách Học Ngoại Ngữ');
Insert into LoaiSach Values('LS06', N'Sách Văn Học');
Insert into LoaiSach Values('LS07', N'Sách Thiếu Nhi');

Create table Sach(
MaSach varchar(6) primary key,
TenSach varchar(100),
DonGia decimal(18,2),
SoLuong int not null,
UrlHinh varchar(100),
NoiDung varchar(4000),
TacGia varchar(100) not null,
NamXB int not null,
NXB varchar(100) not null,
MaLoaiSach varchar(4) references LoaiSach(MaLoaiSach)
);
Create index idx_sach on Sach(MaSach, TenSach);

Insert into Sach Values('SKC001', N'Phát triển web cho Smartphone', 155000.00, 50, 'c1.jpg', 
N'<p>
- Khi ngày càng nhiều người truy cập Web từ điện thoại và các thiết bị di động khác, các nhà phát triển Web cần biết cách xây dựng trang Web có khả năng đáp ứng tốt cho các thiết bị này. Muốn vây, họ cần học những kỹ thuật, nghiên cứu những vấn đề mang tính đặ thù liên quan tới việc phân phối nội dung Web cho thiết bị di động. Nếu bạn là nhà phát triển và thiết kế Web đang bắt đầu tìm hiểu về Web trên di ddoonngj thì đây chính là cuốn sách dành cho bạn.
</p>
<p>
- Phát triển Web cho smartphone giới thiệu về cú pháp, ngữ nghĩa và hệ sinh thái của Web trên di động. Cuốn sách hướng dẫn cách xây dựng những trang Web trên di động có khả năng thích ứng, hồi đáp và đạt các tiêu chuẩn giúp đảm bảo trang Web chạy được trên mọi trình duyệt di động. Bạn đọc cũng sẽ nghiên cứu thuộc tính đặc trưng của thiết bị, hệ sinh thái và người dùng di động, từ đó biết cách áp dụng những phương pháp kỹ thuật tốt nhất vào việc phát triển Web cho thiết bị di động.
</p>', 
N'Gail Rahn Frederick, Rajesh Lal', 2019, N'Bách Khoa Hà Nội', 'LS01');
Insert into Sach Values('SKC002', N'Tự học VB.NET Và SQL SERVER 2008', 59000.00, 50, 'c2.jpg', 
N'<p>
- Nội dung sách gồm 2 phần:
</p>
<p>
- Phần 1: Hệ quản trị cơ sở dữ liệu SQL Server 2008
Giới thiệu về phiên bản SQL Server 2008, và một số xử lý trong SQL Server 2008
</p>
<p>
- Phần 2: Xây dựng ứng dụng quản lý với VB.NET
Giới thiệu chung về VB.NET, giới thiệu Dự án  "Quản lý vật tư", xây dựng Form danh mục, xây dựng Form chứng từ, xây dựng các báo cáo thống kê.
</p>', 
N'KS. Hoàng Anh Quang', 2012, N'Hồng Đức', 'LS01');
Insert into Sach Values('SKC003', N'Lập trình với Scratch', 200000.00, 50, 'c3.jpg', 
N'<p>
- Cuốn sách “Lập trình với Scratch” được xuất bản lần đầu tiên vào tháng 12 năm 2016. Với 5000 ấn phẩm đã đến tay của nhiều anh chị giáo viên, quý phụ huynh và các em học sinh. Nhận được nhiều phản ánh tích cực và sự mong đợi của các độc giả trên mọi miền tổ quốc Học viện Vietstem tái bản cuốn sách một cách nhanh chóng.
</p>
<p>
- Cuốn sách được viết theo phong cách trực quan, đồ họa sống động. Hướng dẫn chi tiết cách cài đặt, sử dụng và lập trình nhiều sản phẩm liền tay. Vì vậy cuốn sách rất phù hợp cho người mới bắt đầu học lập trình Scratch và học sinh từ 8 đến 16 tuổi.
Một lưu ý nhỏ để sử dụng sách một cách hiệu quả, đối với học sinh cần có một số kiến thức nhất định về sử dụng chuột và bàn phím máy tính, biết đếm đến 480, hiểu được phép nhân và phép chia. Nhiều khái niệm phức tạp hơn như số âm, phân số, trục tọa độ, số đo góc sẽ được giải thích bổ sung trong cuốn sách.
</p>', 
N'Nguyễn Hữu Hưng (chủ biên)', 2018, N'Đại học Quốc Gia Hà Nội', 'LS01');
Insert into Sach Values('SKC004', N'Cuộc cách mạng Blockchain', 299000.00, 50, 'c4.jpg', 
N'<p>
- Cuộc Cách Mạng Blockchain: Công nghệ có thể tác động lớn đến tương lai của nền kinh tế thế giới đã xuất hiện, đó không phải là ô tô tự lái, là năng lượng mặt trời hay trí thông minh nhân tạo. Đó chính là Blockchain.
</p>
<p>
- Thế hệ thứ nhất của cuộc cách mạng số hóa đã đưa chúng ta đến với kỷ nguyên Internet của thông tin.
Thế hệ thứ hai – được tiếp sức bởi công nghệ blockchain – đang đưa chúng ta đến với Internet của giá trị: một nền tảng phi tập trung mới mẻ, thứ có thể giúp chúng ta tái định hình ngành kinh doanh và thay đổi cách thức hoạt động của con người theo hướng tốt hơn.
</p>', 
N'Don Tapscott, Alex Tapscott', 2018, N'Đại học Kinh Tế Quốc Dân', 'LS01');
Insert into Sach Values('SKC005', N'Các hành tinh (Planets)', 699000.00, 50, 'kh1.jpg', 
N'<p>
- Một quyển sách chứa đầy những thông tin, hình ảnh sắc nét như đem chính chúng ta tới những miền hẻo lánh, xa xôi nhất của Hệ Mặt trời.
Nó cho chúng ta thấy được quang cảnh chi tiết và đem đến cho chúng ta những thông tin mới mẻ nhất về các đặc điểm địa hình, địa chất, khí quyển, các suy đoán cùng toàn bộ lịch sử phát hiện và thám hiểm những thiên thể xa xôi mà con người đã, hoặc chưa thể với tới.  
</p>
<p>
- Đây sẽ là quyển sách dành cho bất kỳ ai có bộ óc phiêu lưu, muốn phá tan các giới hạn và có khát vọng nắm bắt các bí ẩn của vũ trụ nói chung và Hệ Mặt trời nói riêng.
</p>', 
N'Maggie Aderin Pocock', 2018, N'Dân Trí', 'LS01');
Insert into Sach Values('SKC006', N'6 Phát Minh Làm Nên Thời Đại', 165000.00, 50, 'kh2.jpg', 
N'<p>
- Steven Johnson đích thực là chuyên gia bậc thầy của lịch sử ý tưởng. Trong cuốn sách này, ông chỉ tập trung vào sáu công nghệ và khám phá các phân nhánh của chúng, cả mặt tốt lẫn không tốt. Ông đã tạo ra biểu trưng hình ảnh chim ruồi cho các loại hình phát minh mà mình quan tâm: sự đồng tiến hóa của hoa và côn trùng – kẻ không mời từ một trật tự sáng tạo khác.
</p>
<p>
- Johnson nhấn mạnh rằng nhiều phát minh không phải là kết quả của “phút Eureka” mà là sự chín muồi của một tiến trình dài bao gồm một mạng lưới các nhà phát minh và doanh nghiệp. Ông đã cố xoay xở và cuối cùng đã tìm ra cách định nghĩa khoảnh khắc này. Dữ liệu số được truyền dẫn lần đầu tiên năm 1943 qua một đường dây mật SIGSALYY được Alan Turing và Phòng thí nghiệm Bell phát triển: Turing là một nhà sáng chế thiên tài.
</p>', 
N'Steven Johnson', 2018, N'Thế Giới', 'LS01');

Insert into Sach Values('STL007', N'Ngôn ngữ cơ thể trong tình yêu', 128000.00, 50, 't1.jpg', 
N'<p>
- Cuốn sách này, cùng tác giả với cuốn sách đã bán được triệu bản. The Definitive book of body language sẽ cung cấp cho bạn tất cả những điều cần biết về ngôn ngữ cơ thể trong tình yêu để từ đó bạn có thể hiểu rõ: Cuộc chơi hẹn hò;

Nghệ thuật tỏ tình và các tín hiệu tán tỉnh;

Hẹn hò tốc độ, cuộc hẹn đầu tiên, những buổi tiệc tùng, hẹn hò qua mạng và các "sứ mạng cảm từ" khác;

Bí quyết để có những mối quan hệ tình cảm thành công
</p>
<p>
- Thông qua việc hướng dẫn bạn từ cách sử dụng ngôn ngữ cơ thể để gia tăng khả năng tìm được bạn đời đến cách đối phó với các vấn đề nảy sinh trong mối quan hệ tình cảm, cuốn Ngôn ngữ cơ thể trong tình yêu sẽ giúp bạn nhận biết và chỉnh sửa kiểu ngôn ngữ cơ thể gây bất lợi cho bạn.
</p>', 
N'Allan , BPease', 2014, N'Tổng Hợp TP.HCM', 'LS02');
Insert into Sach Values('STL008', N'Tâm lý học và đời sống', 370000.00, 50, 't2.jpg', 
N'<p>
- Tâm lý học và đời sống là cuốn sách đồ sộ, đề cập và đi sâu khai thác rất nhiều chủ đề về tâm lý con người dựa trên kết quả của hàng trăm công trình thực nghiệm do các nhà nghiên cứu tâm lý thực hiện. Đó là những nghiên cứu đáng tin cậy được tập hợp từ nhiều nơi trên khắp thế giới, ở nhiều thời điểm lịch sử cho đến thế kỷ 21, trên nhiều quy mô khác nhau. Các chủ đề tâm lý con người, từ nhận thức đến hành vi chủ quan cũng như tác động của hoàn cảnh, đều được phân tích đầy đủ trong cuốn sách này. Đây sẽ là một tài liệu tổng quát và chuyên sâu giúp bạn nghiên cứu các vấn đề tâm lý học trong đời sống hàng ngày một cách có hệ thống và dễ tiếp thu nhất.
</p>
<p>
- Về các tác giả:
   Richard J. Gerrig là giáo sư tâm lý học Đại học Stony Brook. Trước khi giảng dạy tại Stony Brook, Gerrig giảng dạy tại Đại học Yale, nơi ông nhận giải thưởng The Lex Hixon. Nghiên cứu của Gerrig về các lĩnh vực tâm lý học nhận thức trong việc sử dụng ngôn ngữ được đánh giá cao. Phạm vi nghiên cứu là các hoạt động thần kinh ẩn dưới tiến trình thông tin.
</p>', 
N'Richard J. Gerrig, Philip G. Zimbardo', 2018, N'Tổng Hợp TP.HCM', 'LS02');

Insert into Sach Values('SKT009', N'Kỷ nguyên tiền điện tử', 189000.00, 50, 'kt1.jpg', 
N'<p>
- Từ một ảo ảnh biến thành hiện thực, từ một ý niệm trở thành hành động; và trong chưa đầy một thập kỷ, Bitcoin cùng nhiều loại tiền kỹ thuật số đã khuấy đảo cả hành tinh. Mới hôm trước, mọi thứ vẫn còn bình lặng. Nhưng chỉ sau một đêm, Bitcoin khiến toàn bộ thế giới xung quanh bạn rung chuyển. Từ “Bitcoin” xuất hiện trên mọi tít báo bạn lướt qua, và làm bùng nổ những cuộc tranh luận vô tận.
Người ta có rất nhiều cách gọi tên Bitcoin. Nó là tiền điện tử, tiền ảo, hay tiền mật mã (cryptocurrency). Bạn có thể sử dụng nó để mua bất cứ thứ gì, từ cà phê đến ô tô. Nhưng kể cả khi thế giới đang đổ xô vào cuộc đầu tư qui mô toàn cầu này, vẫn thật khó để trả lời: Bitcoin thực sự là gì, và tại sao mọi người lại cần quan tâm đến Bitcoin, cũng như công nghệ đằng sau nó - công nghệ Blockchain?
</p>
<p>
- “Kỷ nguyên tiền điện tử” đưa chúng ta đến những nơi Bitcoin và Blockchain đang hiện hữu, từ những quốc gia nghèo khó châu Phi tới lãnh địa công nghệ châu Mỹ, từ những nền kinh tế mới nổi ở châu Á tới xứ sở ngân hàng châu Âu - để thấu hiểu thực trạng nền kinh tế thế giới trước sự nổi lên của tiền điện tử, và trả lời câu hỏi hóc búa: Liệu Bitcoin và công nghệ của nó, Blockchain, có thực sự thay đổi cả thế giới như cách Internet đã làm, theo lời tiên đoán của nhiều người hay không?
</p>', 
N'Paul Vigna, Michael J. Casey', 2017, N'Đại Học Kinh Tế Quốc Dân', 'LS03');
Insert into Sach Values('SKT010', N'Một đời quản trị', 135000.00, 50, 'kt2.jpg', 
N'<p>
- Có rất nhiều doanh nhân vĩ đại, những người sáng lập, xây dựng, điều hành những công ty hàng đầu thế giới với doanh thu cả trăm tỷ đô-la Mỹ, những công ty sáng tạo công nghệ và sản phẩm làm thay đổi thế giới, nhưng họ không viết sách dù rằng có nhiều sách viết về họ.
GS. Phan Văn Trường khác họ. Ông đã từng đứng đầu các tập đoàn khổng lồ với doanh thu 60-70 tỷ đô-la Mỹ, hoạt động trên cả trăm quốc gia, với hàng chục nghìn nhân viên đủ các quốc tịch. Và ông viết sách. Chính xác hơn là ông ghi lại những gì tinh túy nhất và lại giản dị nhất của một doanh nhân người Việt tầm cỡ Global.
</p>
<p>
- Có lẽ những điều trên bạn đã gặp ở rất nhiều cuốn sách nhưng ở đây có 2 điều khác biệt:
- Là bài học thực tế, là tinh túy của một doanh nhân tầm cỡ Global
- Hành xử chuyên nghiệp, quyết định sáng suốt, thành công lớn…ở tầm Global  nhưng vẫn mang đậm chất Việt, đậm chất nhân văn.
Và đặc biệt những câu chuyện của ông, những bài học của ông lại được kể bằng những con người thực Ông đã cùng làm việc, bằng những câu chuyện thực của đời mình
</p>', 
N'Phan Văn Trường', 2019, N'Nhà Xuất Bản Trẻ', 'LS03');

Insert into Sach Values('SGK011', N'Tự nhiên và xã hội 1', 6000, 50, 'gk1.jpg', 
N'<p>
- Cuốn sách giáo khoa "tự nhiên và xã hội lớp 1" do Nhà Xuất Bản Giáo Dục ấn hành nhằm giúp các em học sinh lớp 1 làm quen, nhận biết các hiện tượng sự vật xung quanh, giúp các em bước đầu giải thích được các hiện tượng đơn giản diễn ra trong cuộc sống hằng ngày.
</p>
<p>
- Tự Nhiên Và Xã Hội Lớp 1 là sách giáo khoa cơ bản được Bộ Giáo Dục Đào Tạo tổ chức biên soạn và ban hành. Tập sách gồm các nội dung chính như sau: Con người và sức khỏe; Xã hội; Tự nhiên.
</p>', 
N'Bộ Giáo dục và Đào tạo', 2019, N'Nhà Xuất Bản Giáo Dục Việt Nam', 'LS04');
Insert into Sach Values('SGK012', N'Toán 1', 13000, 50, 'gk2.jpg', 
N'<p>
- Cuốn sách giáo khoa "toán lớp 1" do Nhà Xuất Bản Giáo Dục ấn hành nhằm giúp các em học sinh lớp 1 bước đầu làm quen với môn toán </p>
<p>
- Sách giáo khoa Toán lớp 1, gồm các phần: Các số đến 10, hình vuông, hình tròn, hình tam giác. Phép cộng, phép trừ trong phạm vi 10. Các số trong phạm vi 100, đo độ dài. Phép cộng, phép trừ trong phạm vi 100, đo thời gian.
</p>', 
N'Bộ Giáo dục và Đào tạo', 2019, N'Nhà Xuất Bản Giáo Dục Việt Nam', 'LS04');

Insert into Sach Values('SNN013', N'Giải thích ngữ pháp tiếng Anh', 110000, 50, 'n1.jpg', 
N'<p>
- Giải Thích Ngữ Pháp Tiếng Anh Với Bài Tập Và Đáp Án
</p>
<p>
- Giải thích ngữ pháp tiếng Anh gồm 9 chương, trình bày những chủ điểm ngữ pháp tiếng Anh từ cơ bản đến nâng cao, phù hợp với mọi trình độ. Các chủ điểm ngữ pháp trong từng chương được biên soạn chi tiết, giải thích cặn kẽ các cách dùng và quy luật mà người học cần nắm vững. Sau mỗi chủ điểm ngữ pháp là phần bài tập đa dạng nhằm giúp người học củng cố phần lý thuyết.
</p>', 
N'Mai Lan Hương, Hà Thanh', 2019, N'Đà Nẵng', 'LS05');
Insert into Sach Values('SNN014', N'Cambridge IELTS 10 with Answers', 120000.00, 50, 'n2.jpg', 
N'<p>
- Cambridge IELTS 10 là bộ tài liệu IELTS huyền thoại mà bất kể một thí sinh luyện thi IELTS nào cũng biết đến và nên có.
Đây là bộ tài liệu do đại học Cambridge tổng hợp dựa trên đề thi thực tế các năm của kỳ thi Cambridge English Language Assessment. Mỗi tập sách sẽ cung cấp các bài Test IELTS chất lượng với đầy đủ các kĩ năng Speaking – Listening – Writing và Reading, giúp cho thí sinh học IELTS được cọ sát gần nhất với lối ra đề thi IELTS.
</p>
<p>
- Qua các bài test, học viên đánh giá được trình độ IELTS của bản thân ở thời điểm hiện tại và xác định hướng học cho phù hợp để ôn thi tốt nhất.
</p>', 
N'Cambridge English', 2015, N'Cambridge University', 'LS05');

Insert into Sach Values('SVH015', N'Vũ trung tùy bút', 75000.00, 50, 'vh1.jpg', 
N'<p>
- Sách Vũ Trung Tùy Bút là một tác phẩm đặc sắc trong thời kỳ Lê mạt Nguyễn sơ (cuối thế kỷ 18 và thế kỷ 19), độc giả sẽ hiểu được một chặng đường lịch sử và một thể văn sau này thành thể văn sở trường của nhà văn Nguyễn Tuân.
</p>
<p>
- "Các tác phẩm buổi ấy phần nhiều ghi chép những điều các tác giả đã trông nghe thấy theo thể văn tùy bút (theo ngọn bút ý nói gặp cái gì chép cái ấy). Vũ Trung Tùy Bút nghĩa là theo ngọn bút viết trong khi mưa". - Giáo sư Dương Quảng Hàm
</p>
<p>
- "Vũ Trung Tùy Bút là một tác phẩm văn học đặc sắc trong thời kỳ Lê mạt Nguyễn sơ (cuối thế kỷ 18 và thế kỷ 19). Đọc cuốn này, độc giả sẽ hiểu được một chặng đường lịch sử và một thể văn sau này thành thể văn sở trường của nhà văn Nguyễn Tuân." - Giáo sư Hoàng Như Mai
</p>', 
N'Phạm Đình Hổ', 2019, N'Văn Hóa Dân Tộc', 'LS06');
Insert into Sach Values('SVH016', N'Lãng du xứ Huế', 450000.00, 50, 'vh2.jpg', 
N'<p>
- Đọc Lãng Du Xứ Huế, độc giả có thể nhận thấy sự ngẫu hứng, lãng mạn của một lãng tử, nhưng cũng lại rất cẩn thận chỉn chu của một người làm khoa học.
</p>
<p>
- Lãng Du Xứ Huế là một chuyến đi có chủ đích, bắt đầu từ sông Hương – dòng sông tạo nên gương mặt của đất Huế, rồi tới Kinh Thành cổ kính – trọng địa của kinh đô, cùng các vùng phụ cận ở bờ bắc sông Hương, rồi qua bờ nam, đi ra các ngả đường ngoại ô... Cách sắp xếp khá đơn giản nhưng hiệu quả để người ta dễ hình dung ra một xứ Huế từ Bắc tới Nam, từ xưa tới nay, từ sự tĩnh lặng của công trình tới tiếng động của âm thanh cuộc sống... Ở đó còn có những câu chuyện lịch sử hàng trăm năm và cả những câu chuyện đời.
</p>', 
N'Nguyễn Trần Đức Anh', 2019, N'Thế Giới', 'LS06');
Insert into Sach Values('SVH017', N'Làm bạn với bầu trời', 220000.00, 50, 'vh3.jpg', 
N'<p>
- Làm Bạn Với Bầu Trời là một câu chuyện văn học giản dị, chứa đầy bất ngờ cho tới trang cuối cùng. Và đẹp lộng lẫy, vì lòng vị tha và tình yêu thương, khiến mắt rưng rưng vì một nỗi mừng vui hân hoan. Cuốn sách như một đốm lửa thắp lên lòng khát khao sống tốt trên đời.
</p>
<p>
- Viết về điều tốt đã không dễ, viết sao cho người đọc có thể đón nhận đầy cảm xúc tích cực, và muốn  được hưởng, được làm những điều tốt dù nhỏ bé... mới thật là khó. Làm bạn với bầu trời của Nguyễn Nhật Ánh đã làm được điều này, anh đã “mô tả cái tốt thật đẹp để người ta yêu thích nó”, như  anh  từng phát biểu “... điểm mạnh của văn chương nằm ở khả năng thẩm thấu. Bằng hình thức đặc thù của mình, văn chương góp phần mài sắc các ý niệm đạo đức nơi người đọc một cách vô hình. Bồi đắp tâm hồn và nhân cách một cách âm thầm và bền bỉ, đó là chức năng gốc rễ của văn chương, đặc biệt là văn chương viết cho thanh thiếu niên.”
</p>', 
N'Nguyễn Nhật Ánh', 2019, N'Nhà Xuất Bản Trẻ', 'LS06');
Insert into Sach Values('SVH018', N'Thơ văn Hàn Mặc Tử', 200000.00, 50, 'vh4.jpg', 
N'<p>
- Độc giả đọc thơ, học sinh sinh viên học tập, giáo viên bình giảng, nhà nghiên cứu khảo cứu, nhà lý luận khảo luận… hầu hết đều cho rằng thơ Hàn Mạc Tử hay nhưng khó hiểu! 
Còn Hàn Mạc Tử, tác giả của những vần thơ khó hiểu đã nói gì về lối thơ bí hiểm của mình? “Cứ theo như lối thơ tôi làm đó thì phải giảng giải biết bao nhiêu trang giấy mà rốt cuộc chưa chắc người ta đã hiểu được tí gì… Và như thế sự cắt nghĩa đối với thơ là vô ích. Người ta cảm biết một cách tự nhiên”.
</p>
<p>
- Với những nguồn tư liệu phong phú, tác giả đã mạnh dạn biên soạn Thơ Văn Hàn Mạc Tử, không ngoài mục đích giới thiệu riêng phần văn với những bài thơ văn xuôi, những lời tựa, lời bạt và những bài báo lý luận phê bình của nhà thơ thiên tài Hàn Mạc Tử.
</p>', 
N'Trần Quang Chu', 2018, N'Văn Học', 'LS06');
Insert into Sach Values('SVH019', N'Thơ Xuân Quỳnh', 35000.00, 50, 'vh5.jpg', 
N'<p>
- Xuân Quỳnh đã để lại dấu ấn đậm nét trong dòng thơ tình Việt Nam. Thơ của cô là tiếng lòng của một tâm hồn phụ nữ thấm đẫm tình cảm. Cô dành nhiều tâm huyết cho đề tài tình yêu và là một trong những người viết thơ tình hay nhất ở thời đại chúng ta.
</p>
<p>
- Tuyển tập Thơ Xuân Quỳnh giới thiệu tới bạn đọc những bài thơ tình giàu cảm xúc, nồng nàn và dữ dội như Thơ viết cho mình và những người con gái khác, Sóng hay những bài thơ dung dị viết tặng các con trai yêu quý của cô như Chùm thơ xuân cho ba con nhỏ (tặng Tuấn Anh, tặng Minh Vũ, tặng Quỳnh Thơ). Tất cả nhờ tình yêu thương, thấm đẫm nữ tính ấy mà bất chấp mọi khổ đau, buồn phiền của một duyên phận nhiều lận đận, Xuân Quỳnh để lại trong thơ niềm tin vững chắc về sự hiện diện của hạnh phúc có thật giữa trần gian này.
</p>', 
N'Xuân Quỳnh', 2019, N'Văn Học', 'LS06');
Insert into Sach Values('SVH020', N'Tôi thấy hoa vàng trên cỏ xanh', 125000.00, 50, 'vh6.jpg', 
N'<p>
- Đây là một trong các truyện dài của Nguyễn Nhật Ánh, ra đời sau Đảo mộng mơ và trước Lá nằm trong lá. Cuốn sách "tôi thấy hoa vàng trên cỏ xanh" gợi nhớ cho tôi một thế giới đầy những bất ngờ và hương vị thơ ngây cùng những suy nghĩ giản dị đến bình dị nhưng lại toát lên vẻ đẹp và gần gũi đến lạ thường. Câu chuyện "Tôi thấy hoa vàng trên cỏ xanh" có những lúc bấp bênh khúc này, khúc kia nên mỗi ai khi đọc cuốn sách này đều thấy mình trong đó nó mang đậm hương vị của một là thứ tình đầu đời của cu Thiều chẳng hạn... ngây thơ và khờ khạo.
</p>
<p>
- Nhưng "Tôi thấy hoa vàng trên cỏ xanh" không trong trẻo và thuần khuyết như những tác phẩm trước của nhà văn, nó không còn trọn vẹn của một thế giới tuổi thơ nữa. Mặc dù cuốn sách vẫn toát lên sự dí dỏm, ngọt ngào nhưng ẩn sâu trong nó một nỗi buồn phảng phất, về một người cha trốn nhà không muốn các con cơ khổ do bệnh tật.
</p>', 
N'Nguyễn Nhật Ánh', 2019, N'Nhà Xuất Bản Trẻ', 'LS06');

Insert into Sach Values('STN021', N'Thế giới khủng long - những kẻ nguy hiểm', 32000.00, 50, 'tn1.jpg', 
N'<p>
- Bộ sách Thế Giới Khủng Long giúp các em hiểu về những loài khủng long thống trị Trái Đất hơn 165 triệu năm trong suốt Đại Trung Sinh, nhưng chúng đã bị tuyệt chủng vào 65 triệu năm trước. Mỗi cuốn sách trong bộ sách cung cấp những thông tin xúc tích cùng tranh minh họa hấp dẫn sẽ đưa độc giả nhỏ tuổi đi vào chuyến phiêu lưu trở lại thời tiền sử để khám phá và hiểu hơn về loại khủng long cổ xưa.
</p>
<p>
- Bộ sách Thế giới khủng long gồm 4 cuốn: Những kẻ nguy hiểm; Những kẻ khổng lồ; Những kẻ nhỏ bé; Sự tiến hóa và khai quật.
</p>', 
N'Nhiều Tác Giả', 2018, N'Văn Hóa - Văn Nghệ TP.HCM', 'LS07');
Insert into Sach Values('STN022', N'Kid Start-up Khởi nghiệp từ khi lên 7', 99000.00, 50, 'tn2.jpg', 
N'<p>
- Nếu các em đang tìm cách để vừa kiếm ra tiền, vừa giúp đỡ được mọi người, thì tinh thần khởi nghiệp hoàn toàn phù hợp với các em rồi đấy.
</p>
<p>
- Các em có thể chỉ còn đang băn khoăn, không hiểu bắt đầu một công việc kinh doanh ở tuổi thiếu niên có sớm quá không, và liệu các em có thể thành công?
</p>
<p>
- Hiện nay thật dễ dàng tìm được các lớp học dạy cách bắt đầu một sự nghiệp kinh doanh, nhưng chỉ có tự mình trải nghiệm việc khởi sự một doanh nghiệp mới dạy cho các em những điều tuyệt vời nhất về tinh thần khởi nghiệp. Và cuốn sách Kid Start - Up Khởi Nghiệp Từ Khi Lên 7 này sẽ chỉ dẫn các em rất nhiều điều trong hành trình đó!
</p>', 
N'	
Ian McCue, Shaan Patel, Mark Cuban', 2019, N'Thế Giới', 'LS07');
Insert into Sach Values('STN023', N'Doraemon (Tập 11)', 12500, 50, 'tn3.jpg', 
N'<p>
- Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vương tới những tầm cao.
</p>
<p>
- Cuốn sách này tập hợp những câu chuyện vô cùng thú vị về chú mèo máy Doraemon: Viên cảm tình, Câu chuyện cảm động, Mây tạo tuyết...
</p>', 
N'Fujiko-F-Fujio', 2015, N'Nhà Xuất Bản Kim Đồng', 'LS07');
Insert into Sach Values('STN024', N'Doraemon (Tập 11)', 18000, 50, 'tn4.jpg', 
N'<p>
- Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vương tới những tầm cao.
</p>
<p>
- Cuốn sách này tập hợp những câu chuyện vô cùng thú vị về chú mèo máy Doraemon: Viên cảm tình, Câu chuyện cảm động, Mây tạo tuyết...
</p>', 
N'Fujiko-F-Fujio', 2019, N'Nhà Xuất Bản Kim Đồng', 'LS07');

Create table NhapSach(
MaNS varchar(6) primary key,
MaNVKho int references NhanVien(MaNV),
MaSach varchar(6) references Sach(MaSach),
SoLuongNhap int,
NgayNhap date
);

Insert into NhapSach Values('NS0001', 1003, 'SKC001', 10, '2019-09-19');
Insert into NhapSach Values('NS0002', 1004, 'SKC002', 10, '2019-10-19');
Insert into NhapSach Values('NS0003', 1004, 'SKC003', 10, '2019-10-22');
Insert into NhapSach Values('NS0004', 1004, 'SKC004', 10,  '2019-11-25');
Insert into NhapSach Values('NS0005', 1003, 'SKC005', 10,  '2019-12-05');
Insert into NhapSach Values('NS0006', 1003, 'SKC006', 10, '2019-09-19');
Insert into NhapSach Values('NS0007', 1004, 'STL007', 10, '2019-10-19');
Insert into NhapSach Values('NS0008', 1004, 'STL008', 10, '2019-10-22');
Insert into NhapSach Values('NS0009', 1004, 'SKT009', 10,  '2019-11-25');
Insert into NhapSach Values('NS0010', 1003, 'SKT010', 10,  '2019-12-25');

Create table HoaDon(
SoHD bigserial primary key,
ThayDoiNN varchar(10),
TongTien decimal(18,2) default(0),
NgayDat date,
NgayGiao date,
TinhTrangDH varchar(50),
MaNVGiao int references NhanVien(MaNV),
MaKH int references KhachHang(MaKH)
);
SELECT setval('HoaDon_SoHD_seq', 10000000);

Insert into HoaDon(ThayDoiNN,TongTien,NgayDat,NgayGiao,TinhTrangDH,MaNVGiao, MaKH) Values('Co', 414000, '2019-11-20', '2019-11-23', N'Hoàn tất', 1001, 1001);
Insert into HoaDon(ThayDoiNN,TongTien,NgayDat,NgayGiao,TinhTrangDH,MaNVGiao, MaKH) Values('Khong', 214000, '2019-11-20', '2019-11-23', N'Trả lại hàng', 1005, 1002);
Insert into HoaDon(ThayDoiNN,TongTien,NgayDat,NgayGiao,TinhTrangDH,MaNVGiao, MaKH) Values('Khong', 299000, '2019-11-25', null, N'Đang giao hàng', 1005, 1004);
Insert into HoaDon(ThayDoiNN,TongTien,NgayDat,NgayGiao,TinhTrangDH,MaNVGiao, MaKH) Values('Co', 200000, '2019-11-25', null, N'Đợi người giao lấy hàng', 1001, 1003);
Insert into HoaDon(ThayDoiNN,TongTien,NgayDat,NgayGiao,TinhTrangDH,MaNVGiao, MaKH) Values('Co', 365000, '2019-12-01', null, N'Đang chuẩn bị hàng', 1001, 1001);

Create table ChiTietHoaDon(
SoHD int references HoaDon(SoHD),
MaSach varchar(6) references Sach(MaSach),
SoLuong int not null,
DonGia decimal(18,0),
primary key(SoHD, MaSach) 
);

Insert into ChiTietHoaDon Values( 10000001, 'SKC001', 1, 155000.00);
Insert into ChiTietHoaDon Values( 10000001, 'SKC002', 1, 59000.00);
Insert into ChiTietHoaDon Values( 10000001, 'SKC003', 1, 200000.00);
Insert into ChiTietHoaDon Values( 10000002, 'SKC001', 1, 155000.00);
Insert into ChiTietHoaDon Values( 10000002, 'SKC002', 1, 59000.00);
Insert into ChiTietHoaDon Values( 10000003, 'SKC004', 1, 299000.00);
Insert into ChiTietHoaDon Values( 10000004, 'SKC003', 1, 200000.00);
Insert into ChiTietHoaDon Values( 10000005, 'SKC003', 1, 200000.00);
Insert into ChiTietHoaDon Values( 10000005, 'SKC006', 1, 165000.00);

Create table NguoiNhanHang(
SoHD int references HoaDon(SoHD),
TenNN varchar(50),
DienThoai varchar(10),
DiaChi varchar(100),
primary key(SoHD) 
);

Insert into NguoiNhanHang Values(10000001, N'Võ Hoài Linh', '0987655577', N'P. Cam Linh, TP. Cam Ranh, T. Khánh Hòa');
Insert into NguoiNhanHang Values(10000004, N'Nguyễn Anh Quốc', '0966798765', N'P. Hà Huy Tập, TP. Hà Tĩnh, T. Hà Tĩnh');
Insert into NguoiNhanHang Values(10000005 ,N'Hà Anh Tuấn', '0981246789',N'25 Nguyễn Văn Bình, Q.1, TP. Hồ Chí Minh');
