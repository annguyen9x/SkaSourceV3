<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Trang quản trị</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--  bootstrap -->
<link rel="stylesheet" type="text/css" href="${url}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="${url}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${url}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<!--  kt bootstrap -->
<!--  fontawesome -->
<link rel="stylesheet" href="${url}/static/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- kt fontawesome -->
<!-- my css -->
<link rel="stylesheet" type="text/css" href="${url}/static/css/quantri.css"/>
<!-- kt my css -->
</head>
<body>
	<section class="noidung">
		<div class="container-fluid">
			<div class="row content">
				<div class="col-md-2 col-sm-3 col-xs-12 sidenav nd_left">
					<h2 class="loainv_icon"><li class="fa fa-th-large"></li><span class="loainv"> Nhân viên Giao hàng</span></h2>
					<div class="tennv_anh">
						<span class="anh">
							<img class="img-circle" alt="hinhNV" src="${url}/static/img/hinhMacdinh.png">
						</span>
						
						<span class="ten_nv">Xin chào, <br/>
							<span class="ten">An Nguyễn</span>
						</span>
					</div>
					<ul class="nav nav-pills nav-stacked">
						<li><a href="giaohang_trangchu.jsp" class="active"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="giaohang_xem_dh_giao.jsp"><i class="fa fa-table"></i> Đơn hàng cần giao</a></li>
						<li><a href="giaohang_cn_tinhtrang_dh.jsp"><i class="fa fa-edit"></i> Cập nhật tình trạng ĐH</a></li>
						<li><a href="giaohang_capnhat_taikhoan.jsp"><i class="fa fa-address-book"></i> Cập nhật tài khoản</a></li>
						<li><a href="/SachKyAnh/quantriDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
					</ul>
					<br>
				</div>

				<div class="col-md-10 col-sm-9 col-xs-12 nd_right">
					<header class="col-md-12 col-sm-12 col-xs-12">
						<div class="col-md-4 col-sm-4 col-xs-12 logo">  
							<img alt="logo" src="${url}/static/img/logo/logo.png">
						</div>
						<div class="col-md-8 col-sm-8 col-xs-12 heading">  
							<h3>Trang quản trị</h3>
						</div>
						<hr>
					</header>

				<!-- Phần nội dung chính -->
					<section class="content">
						<div class="canh_bao">
							<h3 class="tieude_canhbao">Đơn hàng cần giao !</h3>
							<div class="alert alert-danger">
								<strong>Có <span>1</span> đơn hàng mới.</strong> Vui lòng giao hàng ngay !
							</div>
							<div class="alert alert-success">
								<strong>Không có đơn hàng nào mới.</strong> Tất cả đơn hàng đã được giao !
							</div>
						</div>
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Danh sách đơn hàng</p>
							<div class="tim_kiem">
								<form action="" method="get" accept-charset="utf-8">
									<div class="col-md-4 col-sm-5 col-xs-12 col-md-offset-3 col-md-offset-3" style="padding:0px; ">
										<select name="DsDonHang" class="form-control">
											<option value="hoantat">Hoàn tất</option>
											<option value="danggiao">Đang giao</option>
										</select>
									</div>
									<div class="col-md-2 col-sm-3 col-xs-12" style="padding:0px; ">
										<button type="submit" class="btn">Xem danh sách</button>
									</div>
								</form>
							</div>
							<div class="bang">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Mã Đơn Hàng</th>
											<th>Người Nhận</th>
											<th>Ngày Đặt</th>
											<th>Tình Trạng Đơn Hàng</th>
											<th>Chi Tiết</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="font-weight:bold; ">1234567</td>
											<td>Nguyễn Văn An</td>
											<td>23/12/2016</td>
											<td>Đang giao hàng</td>
											<td><a href="#">Xem chi tiết</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</section>
				<!-- kt phần nội dung chính -->

					<jsp:include page="_admin_footer.jsp" />
				</div>
			</div>
		</div>
	</section>	
</body>
</html>