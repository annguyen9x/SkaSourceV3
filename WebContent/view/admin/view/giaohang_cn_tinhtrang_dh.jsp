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
						<li><a href="giaohang_trangchu.jsp"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="giaohang_xem_dh_giao.jsp"><i class="fa fa-table"></i> Đơn hàng cần giao</a></li>
						<li><a href="giaohang_cn_tinhtrang_dh.jsp" class="active"><i class="fa fa-edit"></i> Cập nhật tình trạng ĐH</a></li>
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
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Cập nhật tình trạng đơn hàng</p>
							<div class="tim_kiem">
								<form action="" method="get" accept-charset="utf-8">
									<div class="col-md-4 col-sm-5 col-xs-12 col-md-offset-3 col-md-offset-3" style="padding:0px; ">
										<select name="DsDonHang" class="form-control">
											<option value="hoantat">Đang chuẩn bị hàng</option>
											<option value="danggiao">Đang giao</option>
										</select>
									</div>
									<div class="col-md-2 col-sm-3 col-xs-12" style="padding:0px; ">
										<button type="submit" class="btn">Xem danh sách</button>
									</div>
								</form>
							</div>
							<div class="bang">
								<form action="" method="get" accept-charset="utf-8">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Mã Đơn Hàng</th>
												<th>Người Nhận</th>
												<th>Nhân Viên Giao Hàng</th>
												<th>Tình Trạng Đơn Hàng</th>
												<th>Ngày Đặt</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="font-weight:bold; ">
													<a href="quantriThongTinDH?SoHD=">1234567</a>
												</td>
												<td>Nguyễn Văn An</td>
												<td>Nguyễn Văn H</td>
												<td>
													<table class="table"  style="border:none; margin:0px;">
														<tr>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang chuẩn bị hàng" checked="checked">Đang chuẩn bị hàng
															</td>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang giao hàng">Đang giao hàng
															</td>
														</tr>
														<tr>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang đợi người giao lấy hàng">Đang đợi người giao lấy hàng
															</td>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang trả hàng về kho">Đang trả hàng về kho
															</td>
														</tr>
													</table>
												</td>
												<td>23/12/2016</td>
											</tr>
											<tr>
												<td style="font-weight:bold; ">
													<a href="quantriThongTinDH?SoHD=">1234567</a>
												</td>
												<td>Nguyễn Văn An</td>
												<td>Nguyễn Văn B</td>
												<td>
													<table class="table"  style="border:none; margin:0px;">
														<tr>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang chuẩn bị hàng" checked="checked">Đang chuẩn bị hàng
															</td>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang giao hàng">Đang giao hàng
															</td>
														</tr>
														<tr>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang đợi người giao lấy hàng">Đang đợi người giao lấy hàng
															</td>
															<td style="border:none; padding:0px;">
																<input type="radio" name="TinhTrangDH" value="Đang trả hàng về kho">Đang trả hàng về kho
															</td>
														</tr>
													</table>
												</td>
												<td>23/12/2016</td>
											</tr>
										</tbody>
									</table>
									<div class="nut" style="text-align:center;">
										<a class="btn btn-default" href="/SachKyAnh/">Thoát</a>
										<button type="submit" class="btn mybtn" style="background:#F47920; color:#fff;">Lưu</button>
									</div>
								</form>
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