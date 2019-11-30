package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminDangXuat", urlPatterns = { "/AdminDangXuat" })
public class AdminDangXuatController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("NhanVien") != null ) {
			session.removeAttribute("NhanVien");
		}
		if( session.getAttribute("DsDonHangVaKhachHang") != null ) {
			session.removeAttribute("DsDonHangVaKhachHang");
		}
		if( session.getAttribute("DsDonHangChon") != null ) {
			session.removeAttribute("DsDonHangChon");
		}
		if( session.getAttribute("DsLoaiSach") != null ) {
			session.removeAttribute("DsLoaiSach");
		}
		if( session.getAttribute("DsSach") != null ) {
			session.removeAttribute("DsSach");
		}
		if( session.getAttribute("DsNhanVienGiaoHang") != null ) {
			session.removeAttribute("DsNhanVienGiaoHang");
		}
		if( session.getAttribute("MapSlSachThuocLoai") != null ) {
			session.removeAttribute("MapSlSachThuocLoai");
		}
		if( session.getAttribute("MapTenLoaiSachTheoMLS") != null ) {
			session.removeAttribute("MapTenLoaiSachTheoMLS");
		}
		
		response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
	}

}
