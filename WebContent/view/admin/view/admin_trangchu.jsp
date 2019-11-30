<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.NguoiNhanHang"%>
<%@page import="model.HoaDon"%>
<%@page import="model.Sach"%>
<%@page import="model.LoaiSach"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
<%
	List dsDonHangVaKhachHang = (List)session.getAttribute("DsDonHangVaKhachHang");
	String dsDonHangChon = (String)session.getAttribute("DsDonHangChon");
	if( dsDonHangChon == null ){
		dsDonHangChon = "Hoàn tất";
	}
	
	if( dsDonHangVaKhachHang != null ){
		int demDHMoi= 0;
		for(int i=0; i< dsDonHangVaKhachHang.size(); i++){
			Map<String, Object> chiTietDonHang = (Map<String, Object>)dsDonHangVaKhachHang.get(i);
			HoaDon hoaDon = (HoaDon)chiTietDonHang.get("HoaDon");
			if( "Đợi xác nhận đơn hàng".equals(hoaDon.getTinhTrangDH()) ){
				demDHMoi ++;
			}
		}
	
%>
	<section class="noidung">
		<div class="container-fluid">
			<div class="row content">
				<jsp:include page="_admin_trangchu_menu_left.jsp"/>
				
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
							<h3 class="tieude_canhbao">Đơn hàng cần xử lý !</h3>
							<%
								if( demDHMoi > 0){
							%>
								<div class="alert alert-danger">
									<strong>Có <span><%=demDHMoi %></span> đơn hàng mới.</strong> Vui lòng xử lý đơn hàng ngay !
								</div>
							<%
								}
								else{
							%>
								<div class="alert alert-success">
									<strong>Không có đơn hàng nào mới.</strong> Tất cả đơn hàng đã được xử lý !
								</div>
							<%
								}
							%>
						</div>
						<hr>
						<div class="noidung_chinh">
							<p class="tieude_bang">Danh sách đơn hàng</p>
							<div class="tim_kiem">
								<form action="/SachKyAnh/AdminTrangChu" method="post" accept-charset="utf-8">
									<div class="col-md-4 col-sm-5 col-xs-12 col-md-offset-3 col-md-offset-3" style="padding:0px; ">
										<select name="DsDonHangChon" id="DsDonHangChon" class="form-control">
											<%
												if( dsDonHangChon.equals("Đợi xác nhận đơn hàng") ){
											%>
													<option value="Đợi xác nhận đơn hàng" selected="selected">Đợi xác nhận đơn hàng</option>
													<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
													<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
													<option value="Đang giao hàng">Đang giao hàng</option>
													<option value="Trả lại hàng">Trả lại hàng</option>
													<option value="Trả lại hàng về kho">Trả lại hàng về kho</option>
													<option value="Hoàn tất">Hoàn tất</option>
											<%
												}
												else if( dsDonHangChon.equals("Đang chuẩn bị hàng") ){
											%>
												<option value="Đợi xác nhận đơn hàng">Đợi xác nhận đơn hàng</option>
												<option value="Đang chuẩn bị hàng" selected="selected">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
												<option value="Trả lại hàng về kho">Trả lại hàng về kho</option>
												<option value="Hoàn tất">Hoàn tất</option>
											<%
												}
												else if( dsDonHangChon.equals("Đợi người giao lấy hàng") ){
											%>
												<option value="Đợi xác nhận đơn hàng">Đợi xác nhận đơn hàng</option>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng" selected="selected">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
												<option value="Trả lại hàng về kho">Trả lại hàng về kho</option>
												<option value="Hoàn tất">Hoàn tất</option>
											<%
												}
												else if( dsDonHangChon.equals("Đang giao hàng") ){
											%>
												<option value="Đợi xác nhận đơn hàng">Đợi xác nhận đơn hàng</option>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng" selected="selected">Đang giao hàng</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
												<option value="Trả lại hàng về kho">Trả lại hàng về kho</option>
												<option value="Hoàn tất">Hoàn tất</option>
											<%
												}
												else if( dsDonHangChon.equals("Trả lại hàng") ){
											%>
												<option value="Đợi xác nhận đơn hàng">Đợi xác nhận đơn hàng</option>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Trả lại hàng" selected="selected">Trả lại hàng</option>
												<option value="Trả lại hàng về kho">Trả lại hàng về kho</option>
												<option value="Hoàn tất">Hoàn tất</option>
											<%
												}
												else if( dsDonHangChon.equals("Trả lại hàng về kho") ){
											%>
												<option value="Đợi xác nhận đơn hàng">Đợi xác nhận đơn hàng</option>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
												<option value="Trả lại hàng về kho" selected="selected">Trả lại hàng về kho</option>
												<option value="Hoàn tất">Hoàn tất</option>
											<%
												}
												else if( dsDonHangChon.equals("Hoàn tất") ){
											%>
												<option value="Đợi xác nhận đơn hàng">Đợi xác nhận đơn hàng</option>
												<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
												<option value="Đợi người giao lấy hàng">Đợi người giao lấy hàng</option>
												<option value="Đang giao hàng">Đang giao hàng</option>
												<option value="Trả lại hàng">Trả lại hàng</option>
												<option value="Trả lại hàng về kho">Trả lại hàng về kho</option>
												<option value="Hoàn tất" selected="selected">Hoàn tất</option>
											<%
												}
											%>
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
										<%
											boolean dhTrongDanhSach = false;
											for(int i=0; i< dsDonHangVaKhachHang.size(); i++){
												Map<String, Object> chiTietDonHang = (Map<String, Object>)dsDonHangVaKhachHang.get(i);
												NguoiNhanHang nguoiNhanHang = (NguoiNhanHang)chiTietDonHang.get("NguoiNhanHang");
												HoaDon hoaDon = (HoaDon)chiTietDonHang.get("HoaDon");
												if (hoaDon != null && nguoiNhanHang != null ){
													if( dsDonHangChon.equals(hoaDon.getTinhTrangDH()) ){
														dhTrongDanhSach = true;
										%>
													<tr>
														<td style="font-weight:bold; "><%=hoaDon.getSoHD() %></td>
														<td><%=nguoiNhanHang.getTenNN() %></td>
														<td><%=hoaDon.getNgayDat() %></td>
														<td><%=hoaDon.getTinhTrangDH() %></td>
														<td><a href="/SachKyAnh/AdminThongTinDH?SoHD=<%=hoaDon.getSoHD()%>&IDNN=<%=nguoiNhanHang.getIdNN()%>">Xem chi tiết</a></td>
													</tr>
										<%	
													}
												}else{
													response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
												}
											}
											if( dhTrongDanhSach == false){
										%>
											<tr>
												<td colspan="5" class="alert alert-warning text-center">Không có đơn hàng nào trong danh sách !</td>
											</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</section>
				<!-- kt phần nội dung chính -->

					<jsp:include page="_admin_footer.jsp"/>
				</div>
			</div>
		</div>
	</section>	
	<%
	}
	else{
		response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
	}
	%>
</body>
</html>