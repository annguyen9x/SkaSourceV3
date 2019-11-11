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
<title>Giỏ hàng</title>
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
								<span>Giỏ hàng</span>
							</h2>
						</div>
					</div>
					<!-- kt phần top -->
					<!-- phần nội dung trang -->
					<div class="col-md-12 padding-0 nd_trang">
						<div class="row margin-0">
							<!-- noi dung gio hang -->
							<section class="gio_hang">
								<div class="alert alert-danger">
									<strong>Không có sản phẩm nào trong giỏ hàng.</strong> Nhấn <a href="/SachKyAnh/userTrangChu" class="text-a">"Quay lại"</a> để mua hàng !
								</div>
								<form action="" method="post" id="gioHang" class="form_giohang">
									<table class="table">
										<thead>
											<tr>
												<th>
												Tên sách
												</th>
												<th>
												Hình ảnh
												</th>
												<th>
												Giá
												</th>
												<th>
												Số lượng
												</th>
												<th>
												Thành tiền
												</th>
												<th>
												Xóa
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="ten_sp">
												Tên sách dgfds ágfedg Tên sách dgfds ágfedg Tên sách dgfds ágfedg
												</td>
												<td class="hinh">
													<img src="${url}/static/img/sanpham/c6.jpg" alt="anh">
												</td>
												<td class="tien">
													15.567457 <span class="text_underline">đ</span>
												</td>
												<td class="so_luong">
													<input type="number" name="soLuong">
												</td>
												<td class="tien">
													15.235.235 <span class="text_underline">đ</span>
												</td>
												<td class="trash">
													<a href="#">
														<span class="glyphicon glyphicon-trash"></span>
													</a>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="tong_tien">
										<b>Tổng tiền tạm tính: </b>
										<span class="tien">
											15.235.235 <span class="text_underline">đ</span>
										</span>
									</div>
									<div class="nut">
										<a href="trangchu.jsp" class="btn btn-default mua_them">Mua thêm</a>
										<a href="" class="btn btn-default mua_them">Hủy đơn hàng</a>
										<button type="submit" class="btn  btn-default cap_nhat">Cập nhật</button>
										<a href="dat_hang.jsp" class="btn  btn-default dat_hang">Tiến hành đặt hàng</a>
									</div>
								</form>
						 	</section>
						 	<!-- kt noi dung gio hang -->
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