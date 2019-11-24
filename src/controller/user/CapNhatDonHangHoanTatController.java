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

@WebServlet(name = "CapNhatDonHangHoanTat", urlPatterns = { "/CapNhatDonHangHoanTat" })
public class CapNhatDonHangHoanTatController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		if( gioHang != null) {
			response.sendRedirect("/SachKyAnh/view/user/view/capnhat_diachi_dathang.jsp");
		}else {
			response.sendRedirect("/SachKyAnh/userTrangChu");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String loai_taikhoan = request.getParameter("loai_taikhoan");
		String tenNN = null;
		String email = null;
		String dienThoai = null;
		String diaChi = null;
		int maKH = 0;
		
		if( loai_taikhoan.equals("chinhsua")) {
			tenNN = request.getParameter("ten").trim();
			email = request.getParameter("email").trim();
			dienThoai = request.getParameter("dienthoai").trim();
			diaChi = request.getParameter("diachi").trim();
			
			if( tenNN.equals("") || email.equals("") || dienThoai.equals("") || diaChi.equals("") ) {
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Thông tin giao hàng không được rỗng, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
		}
		else if( loai_taikhoan.equals("nguoikhac")) {
			tenNN = request.getParameter("ten2").trim();
			email = request.getParameter("email2").trim();
			dienThoai = request.getParameter("dienthoai2").trim();
			diaChi = request.getParameter("diachi2").trim();
			
			if( tenNN.equals("") || email.equals("") || dienThoai.equals("") || diaChi.equals("") ) {
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Thông tin giao hàng không được rỗng, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
		}
		
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		KhachHang khachHangDonHang = (KhachHang)gioHang.get("KhachHang");
		HoaDon hoaDon =(HoaDon)gioHang.get("HoaDon");
		int soHD = hoaDon.getSoHD();
		if( gioHang != null) {
			
			int idNN = hoaDon.getIdNN();
			NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
			NguoiNhanHang nguoiNhanHang = new NguoiNhanHang(idNN ,tenNN, email, dienThoai, diaChi);
			gioHang.put("NguoiNhanHang", nguoiNhanHang);
			
			if( nguoiNhanHangDao.update(nguoiNhanHang) ) {
				float phiGiaoHang = (float)gioHang.get("PhiGiaoHang");
				float tongTien = (float)gioHang.get("TongTien");
				Date ngayDat = Calendar.getInstance().getTime();
				
				String emailNhan = null;
				if( khachHangDonHang != null ) {
					emailNhan = khachHangDonHang.getEmail();
				}else {
					emailNhan = email;
				}
				String tieuDe = "Hoàn tất cập nhật đơn hàng \"" + soHD + "\" bạn đã đặt mua tại [kyanhbooks.com]";
				NumberFormat numberFormat = new DecimalFormat("###,###,###,###");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-MM-dd");
				Calendar calendar = Calendar.getInstance();
    			calendar.setTime(ngayDat);
    			calendar.add(Calendar.DAY_OF_MONTH, 3);
				String noiDung = "Thông tin đơn hàng đã cập nhật: \n" + "Mã ĐH: " + soHD + "\nTổng tiền thanh toán: "
								+ numberFormat.format(tongTien+phiGiaoHang)+" đ" + "\nNgày đặt: " 
								+ simpleDateFormat.format(ngayDat)
								+ " -----> Ngày giao (dự kiến): " + simpleDateFormat.format(calendar.getTime())
								+ "\nTên người nhận: " + tenNN + ", Email: " + email
								+ ", Điện thoại: " + dienThoai + "\nĐịa chỉ: " + diaChi;
				
				if( GuiMail.guiMail(emailNhan, tieuDe, noiDung) == true ) {
					System.out.println("mail: " + emailNhan + " noi dung: " + noiDung);
					gioHang.put("SoHD", soHD);
					request.setAttribute("HoanTatDonHang", "ThanhCong");
					request.getRequestDispatcher("/view/user/view/dathang_hoantat_capnhat.jsp").forward(request, response);
					return;
				}else {
					request.setAttribute("HoanTatDonHang", "ThatBai");
					PrintWriter writer = response.getWriter();
					writer.print("<script type='text/javascript'>");
					writer.print("alert('Đã cập nhật đơn hàng thành công. Lỗi khi gửi mail thông tin đơn hàng từ server, vui lòng kiểm tra kết nối internet !!!');");
					writer.print("location='userTrangChu'");
					writer.print("</script>");
				}
			}
			else {
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Lỗi server update NguoiNhanHang, vui lòng thử lại !');");
				writer.print("location='userTrangChu';");
				writer.print("</script>");
			}
		}
		else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Lỗi giỏ hàng trống, vui lòng thử lại !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}
	}

}
