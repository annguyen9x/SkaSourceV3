<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="model.HoaDonBan" %>
<%@page import="model.KhachHang" %>
<%@page import="model.Sach" %>
<%@page import="model.ChiTietHoaDonBan" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="url" value="/view/user"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Xem đơn hàng</title>
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
		<!-- phần header  -->
		<jsp:include page="block/header.jsp" />
		<!-- kt header  -->

		<section class="main_center">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-offset-3 padding-0 main_title_line">
						<!-- phần top -->
						<div class="col-md-12 padding-0 top_nd_trang">
							<div class="top">
								<h2>
									<span>Xem đơn hàng</span>
								</h2>
							</div>
						</div>
						<!-- kt phần top -->
						<!-- phần nội dung trang -->
						<div class="col-md-12 padding-0 nd_trang">
							<div class="row margin-0">
								<form method="post" action="/SachKyAnh/XemDonHang" class="form-inline">
						            <div class="form-group">
					            		<label>Nhập mã đơn hàng </label>
					            		<input type="text" class="form-control" name="maDH" placeholder="Mã số đơn hàng (VD:10000001)" size="30" required="required">
						            </div>
					            	<button type="submit" class="btn">Xem ngay</button>
								</form>
								<%
									HashMap<String, Object> thongTinDonHang = (HashMap<String, Object>)session.getAttribute("ThongTinDonHang");
									String trangThai = (String)session.getAttribute("TrangThai");
									
									if( (thongTinDonHang != null && thongTinDonHang.size() == 0) && (trangThai != null && trangThai.equals("DaTimKiemDH")) ){
								%>
									<div class="alert alert-danger">
										<strong>Không tìm thấy đơn hàng trong hệ thống.</strong> Vui lòng kiểm tra lại mã đơn hàng của bạn !
									</div> 
								<%
										session.removeAttribute("TrangThai");
									}
									if( thongTinDonHang != null && thongTinDonHang.size() > 0 ){
										HoaDonBan hoaDonBan = (HoaDonBan)thongTinDonHang.get("HoaDonBan");
										List<HashMap> dsChiTietHoaDonBan = (List<HashMap>)thongTinDonHang.get("DanhSachChiTietHoaDonBan");
										NumberFormat numberFormat = new DecimalFormat("###,###,###");
								%>
									<!-- thong_tin_dh -->
									<div class="thong_tin_dh">
										<h4>Thông tin đơn hàng số: <%=hoaDonBan.getSoHD() %></h4>
										<table class="table my_border">
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
												</tr>
											</thead>
											<tbody>
												<%
													for(int i = 0; i < dsChiTietHoaDonBan.size() ; i++){
														HashMap map = dsChiTietHoaDonBan.get(i);
														ChiTietHoaDonBan chiTiet = (ChiTietHoaDonBan)map.get("ChiTiet");
														Sach sach = (Sach)map.get("Sach");
												%>
														<tr>
															<td class="ten_sp">
															<%=sach.getTenSach() %>
															</td>
															<td class="hinh">
																<img src="${url}/static/img/sanpham/<%=sach.getUrlHinh() %>" alt="anh">
															</td>
															<td class="tien">
																<%=numberFormat.format(chiTiet.getDonGia()) %> <span class="text_underline">đ</span>
															</td>
															<td class="so_luong">
																<%=chiTiet.getSoLuong() %>
															</td>
															<td class="tien">
																<%=numberFormat.format(chiTiet.getDonGia()*chiTiet.getSoLuong()) %> <span class="text_underline">đ</span>
															</td>
														</tr>
												<%
													}
												%>
											</tbody>
										</table>
										<div class="thongtin_giaohang_tongtien">
											<div class="tong_tien">
												<p>
													<b>Phí giao hàng: </b>
													<span class="tien">
														<%=numberFormat.format(hoaDonBan.getPhiGiaoHang())%> <span class="text_underline">đ</span>
													</span>
												</p>
												<b>Tổng tiền: </b>
												<span class="tien">
													<%=numberFormat.format(hoaDonBan.getPhiGiaoHang() + hoaDonBan.getTongTien()) %> <span class="text_underline">đ</span>
												</span>
											</div>
											<div class="thongtin_giaohang">
												<h4>Thông tin giao hàng</h4>
												<table class="table">
													<tr>
														<td>
															<b>Tên khách hàng: </b><%=hoaDonBan.getTenNN() %>
														</td>
														<td>
															<b>Số điện thoại: </b><%=hoaDonBan.getDienThoai() %>
														</td>
													</tr>
													<tr>
														<td>
															<b>Ngày đặt: </b>
															<%
																SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
																out.print( simpleDateFormat.format(hoaDonBan.getNgayDat()) );
															%>
														</td>
														<td>
															<b>Email: </b><%=hoaDonBan.getEmail() %>
														</td>
													</tr>
													<tr>
														<td>
															<%
																if( hoaDonBan.getNgayGiao() == null ){
																	Date ngayDat = hoaDonBan.getNgayDat();
																	
											            			Calendar calendar = Calendar.getInstance();
											            			calendar.setTime(ngayDat);
											            			calendar.add(Calendar.DAY_OF_MONTH, 3);
											            			
											            			String ngayGiao = simpleDateFormat.format(calendar.getTime());
											            			
																	out.print("<b>Ngày giao (dự kiến): </b>" +  ngayGiao);
																}else{
																	String ngayGiao = simpleDateFormat.format(hoaDonBan.getNgayGiao());
																	out.print("<b>Ngày giao: </b>" + ngayGiao);
																}
															%>
														</td>
														<td>
															<b>Địa chỉ: </b><%=hoaDonBan.getDiaChi() %>											</td>
													</tr>
													<tr>
														<td>
															<b>Tình trạng đơn hàng: </b><%=hoaDonBan.getTinhTrangDH() %>
														</td>
														<td>
															<%
																if( !hoaDonBan.getTinhTrangDH().equals("Đang giao") && !hoaDonBan.getTinhTrangDH().equals("Đã giao thành công") && !hoaDonBan.getTinhTrangDH().equals("Trả lại hàng")){
																	KhachHang khachHang = (KhachHang)session.getAttribute("TaiKhoan");
																	if( khachHang != null && (khachHang.getEmail()).equals(hoaDonBan.getEmail()) ){
															%>
																		<a href="/SachKyAnh/CapNhatDonHang" class="btn btn-default">Cập nhật đơn hàng?</a>
															<%
																	}else{
															%>
																		<a href="/SachKyAnh/XacNhanEmailDatHang" class="btn btn-default">Cập nhật đơn hàng?</a>
															<%
																	}
																}
															%>
														</td>
													</tr>
												</table>
											</div>
											
										</div>
										<div class="nut" style="margin-top:15px;float: left;">
											<a href="/SachKyAnh/userTrangChu" class="btn btn-default">Trở về trang chủ</a>
										</div>
									</div>
									<!-- kt thong_tin_dh -->
								<%
									}
								%> 
							</div>
						</div>
						<!-- kt phần nội dung trang -->
					</div>
				</div>
			</div>
		</section>

		<!-- phần footer  -->
		<jsp:include page="block/footer.jsp" />
		<!-- kt footer  -->
	</div>
</body>
</html>