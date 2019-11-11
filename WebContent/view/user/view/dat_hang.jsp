<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đặt hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--  start bootstrap -->
<link rel="stylesheet" type="text/css" href="${url}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="${url}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${url}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<!--  end bootstrap -->
<!-- start fontawesome -->
<link rel="stylesheet" href="${url}/static/font/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- start fontawesome -->
<!-- start facebook -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0&appId=2525119214214430&autoLogAppEvents=1"></script>
<!-- end facebook -->
<!-- start my css -->
<link rel="stylesheet" type="text/css" href="${url}/static/css/trangchu.css"/>
<!-- end my css -->
<!-- start my js -->
	<script src="${url}/static/js/menuAnHien.js" type="text/javascript" charset="utf-8"></script>
	<script src="${url}/static/js/formValidation.js" type="text/javascript" charset="utf-8"></script>
<!-- end my js -->

</head>
<body>
<div class="wrapper">
	<!-- header  -->
	<jsp:include page="block/header.jsp" />
	<!-- kt header  -->
	
	<section class="main_center main_sp_cungloai">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 padding-0 main_title_line">
					<!-- phần top -->
					<div class="col-md-12 padding-0 top_nd_trang">
						<div class="top">
							<h2>
								<span>Đặt hàng</span>
							</h2>
						</div>
					</div>
					<!-- kt phần top -->
					<!-- phần nội dung trang -->
					<div class="col-md-12 padding-0 nd_trang">
						<div class="row margin-0">
							<!-- noi dung dat hang -->
							<section class="dat_hang">
								<form action="dathang_hoantat.jsp" method="post" id="datHang" class="form_dathang">
									<div class="col-md-4 col-xs-12 col-xs-12 padding-0 chon_diachi">
										<h5>1. Loại tài khoản giao hàng</h5>
										<div class="noi_dung my_border">
											<p>Chọn tài khoản giao hàng</p>
											<input type="radio" name="loai_diachi" value="dangky"> Địa chỉ tài khoản đã đăng ký<br/>
											<input type="radio" name="loai_diachi" value="chinhsua"> Chỉnh sửa địa chỉ đã đăng ký<br/>
											<input type="radio" name="loai_diachi" value="nguoikhac" checked="checked"> Giao hàng địa chỉ khác<br/>
										</div>
									</div>
									<div class="col-md-4 col-xs-12 col-xs-12 padding-0 chitiet_diachi">
										<h5>2. Thông tin địa chỉ giao hàng</h5>
										<div class="noi_dung my_border">
											<p>Thông tin giao hàng</p>
											<div class="form-group">
												<label for="hoten">Họ tên</label>
												<input class="form-control" type="text" name="ten" id="hoten" placeholder="Họ & tên" required="required">
											</div>
											<div class="form-group">
												<label for="email">Email</label>
												<input class="form-control" type="email" name="email" id="email" placeholder="Email" required="required">
											</div>
											<div class="form-group">
												<label for="dt">Điện thoại</label>
												<input class="form-control" type="number" name="dienthoai" id="dt" placeholder="Số điện thoại" required="required">
											</div>
											<div class="form-group">
												<label for="dc">Địa chỉ</label>
												<input class="form-control" type="text" name="diachi" id="dc" placeholder="Địa chỉ" required="required">
											</div>
										</div>
									</div>
									<div class="col-md-4 col-xs-12 col-xs-12 padding-0 thongtin_donhang">
										<h5>3. Thông tin đơn hàng</h5>
										<div class="noi_dung my_border">
											<table class="table">
												<tr>
													<td class="hinh">
														<img src="${url}/static/img/sanpham/c6.jpg" alt="anhsp">
													</td>
													<td class="tensp">
														Tên sản phẩm x <span>2</span>
													</td>
													<td class="tien">
														200.000 <span class="text_underline">đ</span>
													</td>
												</tr>
												<tr>
													<td class="hinh">
														<img src="${url}/static/img/sanpham/c6.jpg" alt="anhsp">
													</td>
													<td class="tensp">
														Tên sản phẩm x <span>2</span>
													</td>
													<td class="tien">
														200.000 <span class="text_underline">đ</span>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														Tổng tiền sách:
													</td>
													<td class="tien">
														400.000 <span class="text_underline">đ</span>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														Phí vận chuyển:
													</td>
													<td class="tien">
														40.000 <span class="text_underline">đ</span>
													</td>
												</tr>
												<tr class="tong_tien">
													<td colspan="2">
														<b>Tổng tiền: </b>
													</td>
													<td class="tien">
														<b>440.000 <span class="text_underline">đ</span></b>
													</td>
												</tr>
											</table>
											<button type="submit" class="btn">Đặt hàng</button>
										</div>
									</div>
								</form>
						 	</section>
						 	<!-- kt noi dung dat hang -->
						</div>
					</div>
					<!-- kt phần nội dung trang -->
				</div>
			</div>
		</div>
	</section>

	<!-- footer  -->
	<jsp:include page="block/footer.jsp" />
	<!-- kt footer  -->
</div>
</body>
</html>