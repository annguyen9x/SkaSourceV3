package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChiTietHoaDonDao;
import dao.HoaDonDao;
import dao.NguoiNhanHangDao;
import dao.SachDao;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.KhachHang;
import model.NguoiNhanHang;
import model.Sach;
import util.GuiMail;
import util.KiemTraNgayThang;
import util.RandomSoNguyen;

@WebServlet(name = "DatHang", urlPatterns = { "/DatHang" })
public class DatHangController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		if( gioHang != null) {
			response.sendRedirect("/SachKyAnh/view/user/view/dat_hang.jsp");
		}else {
			response.sendRedirect("/SachKyAnh/userTrangChu");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = req.getSession();
		KhachHang taiKhoan = (KhachHang) session.getAttribute("TaiKhoan");
		String loai_taikhoan = req.getParameter("loai_taikhoan");
		String tenNN = null;
		String email = null;
		String dienThoai = null;
		String diaChi = null;
		int maKH = 0;
		
		if ( loai_taikhoan.equals("dangky")) {
			if( taiKhoan != null ) {
				tenNN = taiKhoan.getTenKH();
				email = taiKhoan.getEmail();
				dienThoai = taiKhoan.getDienThoai();
				diaChi = taiKhoan.getDiaChi();
				maKH = taiKhoan.getMaKH();
			}
			else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Bạn chưa đăng nhập tài khoản, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
		}
		else if( loai_taikhoan.equals("chinhsua")) {
			tenNN = req.getParameter("ten").trim();
			email = req.getParameter("email").trim();
			dienThoai = req.getParameter("dienthoai").trim();
			diaChi = req.getParameter("diachi").trim();
			
			if( tenNN.equals("") || email.equals("") || dienThoai.equals("") || diaChi.equals("") ) {
				PrintWriter writer = resp.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Thông tin giao hàng không được rỗng, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
			if( taiKhoan != null ) {
				maKH = taiKhoan.getMaKH();
			}
			else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Bạn chưa đăng nhập tài khoản, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
		}
		else if( loai_taikhoan.equals("nguoikhac")) {
			tenNN = req.getParameter("ten2").trim();
			email = req.getParameter("email2").trim();
			dienThoai = req.getParameter("dienthoai2").trim();
			diaChi = req.getParameter("diachi2").trim();
			
			if( tenNN.equals("") || email.equals("") || dienThoai.equals("") || diaChi.equals("") ) {
				PrintWriter writer = resp.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Thông tin giao hàng không được rỗng, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
			if( taiKhoan != null ) {
				maKH = taiKhoan.getMaKH();
			}
		}
		
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		if( gioHang != null) {
			
			NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
			NguoiNhanHang nguoiNhanHang = new NguoiNhanHang(tenNN, email, dienThoai, diaChi);
			gioHang.put("NguoiNhanHang", nguoiNhanHang);
			int idNN =  nguoiNhanHangDao.insert(nguoiNhanHang);
			
			if( idNN != -1 ) {
				float phiGiaoHang = (float)gioHang.get("PhiGiaoHang");
				float tongTien = (float)gioHang.get("TongTien");
				Date ngayDat = Calendar.getInstance().getTime();
				String tinhTrangDH = "Đợi xác nhận đơn hàng";
				
				HoaDonDao hoaDonDao = new HoaDonDao();
				HoaDon hoaDon = new HoaDon(idNN, phiGiaoHang, tongTien, ngayDat, tinhTrangDH, maKH);
				int soHD = hoaDonDao.insert(hoaDon);
				
				if( soHD != -1 ) {
					Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
					Iterator iterator = danhSachChiTietGioHang.entrySet().iterator();
					SachDao sachDao = new SachDao();
					ChiTietHoaDonDao chiTietHoaDonDao = new ChiTietHoaDonDao();
					boolean hoanTatThemChiTietDH = false;
					
					while (iterator.hasNext()) {
						Map.Entry mapEntry = (Map.Entry) iterator.next();
						Map<String, Object> chiTietGioHang = (Map<String, Object>)mapEntry.getValue();
						
						Sach sach = sachDao.getSachTheoMaSach((String)mapEntry.getKey());
						int soLuongMua = (int)chiTietGioHang.get("SoLuong");
						if( soLuongMua > sach.getSoLuong() ) {
							soLuongMua = sach.getSoLuong();
						}
						String maSach = (String)mapEntry.getKey();
						float donGia = (float)chiTietGioHang.get("DonGia");
						
						ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon(soHD, maSach, soLuongMua, donGia);
						
						if( chiTietHoaDonDao.insert(chiTietHoaDon) == true) {
							hoanTatThemChiTietDH = true;
						}
						else {
							hoanTatThemChiTietDH = false;
							break;
						}
					}//Kết thúc while
					
					if( hoanTatThemChiTietDH == true ) {
						String emailNhan = null;
						if( taiKhoan != null ) {
							emailNhan = taiKhoan.getEmail();
						}else {
							emailNhan = email;
						}
						String tieuDe = "Thông tin đơn hàng \"" + soHD + "\" bạn đã đặt mua tại [kyanhbooks.com]";
						NumberFormat numberFormat = new DecimalFormat("###,###,###,###");
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-MM-dd");
						Calendar calendar = Calendar.getInstance();
	        			calendar.setTime(ngayDat);
	        			calendar.add(Calendar.DAY_OF_MONTH, 3);
						String noiDung = "Thông tin đơn hàng: \n" + "Mã ĐH: " + soHD + "\nTổng tiền thanh toán: "
										+ numberFormat.format(tongTien+phiGiaoHang)+" đ" + "\nNgày đặt: " 
										+ simpleDateFormat.format(ngayDat)
										+ " -----> Ngày giao (dự kiến): " + simpleDateFormat.format(calendar.getTime())
										+ "\nTên người nhận: " + tenNN + ", Email: " + email
										+ ", Điện thoại: " + dienThoai + "\nĐịa chỉ: " + diaChi;
						
						if( GuiMail.guiMail(emailNhan, tieuDe, noiDung) == true ) {
							System.out.println("mail: " + emailNhan + " noi dung: " + noiDung);
							gioHang.put("SoHD", soHD);
							req.setAttribute("HoanTatDonHang", "ThanhCong");
							req.getRequestDispatcher("/view/user/view/dathang_hoantat.jsp").forward(req, resp);
							return;
						}else {
							PrintWriter writer = resp.getWriter();
							writer.print("<script type='text/javascript'>");
							writer.print("alert('Đã đặt hàng thành công. Lỗi khi gửi mail thông tin đơn hàng từ server, vui lòng kiểm tra kết nối internet !!!');");
							writer.print("location='userTrangChu'");
							writer.print("</script>");
						}
					}else if( hoanTatThemChiTietDH == false) {
						req.setAttribute("HoanTatDonHang", "ThatBai");
						req.getRequestDispatcher("/view/user/view/dathang_hoantat.jsp").forward(req, resp);
						return;
					}
				}
				else {
					PrintWriter writer = resp.getWriter();
					writer.print("<script type='text/javascript'>");
					writer.print("alert('Lỗi server insert HoaDon, vui lòng thử lại !');");
					writer.print("location='userTrangChu';");
					writer.print("</script>");
				}
			}
			else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Lỗi server insert NguoiNhanHang, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
		}
		else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Lỗi giỏ hàng trống, vui lòng thử lại !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}
	}

}
