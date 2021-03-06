<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.NhanVien" %>
<%@page import="model.LoaiSach" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/admin"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KyAnhBooks - Trang quản trị xem danh sách đơn hàng</title>
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
<!-- start my js -->
	<script src="${url}/static/js/kiemTraThemSuaLoaiSach.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->
</head>
<body>
	<%
		
		NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
		if( nhanVien != null ){
	%>
	<section class="noidung">
		<div class="container-fluid">
			<div class="row content">
				<div class="col-md-2 col-sm-3 col-xs-12 sidenav nd_left">
					<h2 class="loainv_icon"><li class="fa fa-th-large"></li><span class="loainv"> Nhân viên <% if(nhanVien != null) {out.print(nhanVien.getChucVu());} %></span></h2>
					<div class="tennv_anh">
						<span class="anh">
							<img class="img-circle" alt="hinhNV" src="${url}/static/img/hinhMacdinh.png">
						</span>
						
						<span class="ten_nv">Xin chào, <br/>
							<span class="ten"><% if(nhanVien != null) {out.print(nhanVien.getTenNV());} %></span>
						</span>
					</div>
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/AdminTrangChu"><i class="fa fa-home"></i> Trang chủ</a></li>
						<li><a href="/AdminDanhSachDH"><i class="fa fa-table"></i> Danh sách đơn hàng</a></li>
						<li><a href="/AdminXuLyDonHang"><i class="fa fa-edit"></i> Xử lý đơn hàng</a></li>
						<li class="menu_cha">
							<a href="/AdminCapNhatSach" class="active"><i class="fa fa-book"></i> Cập nhật sách</a>
							<ul class="menu_con">
								<li><a href="/AdminCapNhatLoaiSach">Cập nhật loại sách</a></li>
								<li><a href="/AdminCapNhatSach">Cập nhật sách</a></li>
							</ul>
						</li>
						<li><a href="/AdminCapNhatTaiKhoan"><i class="fa fa-address-book"></i> Cập nhật nhân viên</a></li>
						<li><a href="/AdminSuaMatKhau"><i class="fa fa-key"></i> Thay đổi mật khẩu</a></li>
						<li><a href="/AdminDangXuat"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
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
					<section class="content trang_sua_loaisach">
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Sửa thông tin loại sách</p>
							<div class="bang">
								<form action="/AdminSuaLoaiSach" method="post" onsubmit="return ktThemSuaLoaiSach();" accept-charset="utf-8">
									<table class="table table-bordered">
										<tr>
											<th scope="col">Mã Loại Sách</th>
											<td>
												<input type="text" name="maloaisach" id="maloaisach" class="form-control" value="<%=request.getAttribute("MaLoaiSach") %>" disabled="disabled">
											</td>
										</tr>
										<tr>
											<th scope="col">Tên Loại Sách</th>
											<td>
												<input type="text" name="tenloaisach" id="tenloaisach" class="form-control" value="<%=request.getAttribute("TenLoaiSach") %>">
												<span id="errorTenLoaiSach" class="col-xs-12 error warning"></span>
											</td>
										</tr>
									</table>
									<div class="text-center">
										<button type="submit" class="btn btn-default">Sửa</button>
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
	<%
	}
	else{
		response.sendRedirect("/view/admin/view/quantri_dangnhap.jsp");
	}
	%>
</body>
</html>