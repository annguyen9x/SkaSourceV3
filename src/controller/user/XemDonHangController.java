package controller.user;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChiTietHoaDonBanDao;

@WebServlet("/XemDonHang")
public class XemDonHangController extends HttpServlet {
	ChiTietHoaDonBanDao chiTietHoaDonBanDao = new ChiTietHoaDonBanDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession session = request.getSession();
		if( session.getAttribute("ThongTinDonHang") != null ) {
			session.removeAttribute("ThongTinDonHang");
		}
		if( session.getAttribute("TrangThai") != null ) {
			session.removeAttribute("TrangThai");
		}
		response.sendRedirect("/SachKyAnh/view/user/view/xem_donhang.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String maDH = req.getParameter("maDH").trim();
		HttpSession session = req.getSession();
		
		if( session.getAttribute("ThongTinDonHang") != null ) {
			session.removeAttribute("ThongTinDonHang");
		}
		if( session.getAttribute("TrangThai") != null ) {
			session.removeAttribute("TrangThai");
		}
		
		if( maDH != null ) {
			HashMap<String, Object> thongTinDonHang =  chiTietHoaDonBanDao.xemThongTinDonHang(Integer.parseInt(maDH));
			session.setAttribute("ThongTinDonHang", thongTinDonHang);
			session.setAttribute("TrangThai", "DaTimKiemDH");
		}
		req.getRequestDispatcher("/view/user/view/xem_donhang.jsp").forward(req, resp);
	}
}
