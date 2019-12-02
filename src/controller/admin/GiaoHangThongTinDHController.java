package controller.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChiTietHoaDonDao;
import dao.NguoiNhanHangDao;
import model.NguoiNhanHang;
import util.KiemTraKieuSo;

@WebServlet(name = "GiaoHangThongTinDH", urlPatterns = { "/GiaoHangThongTinDH" })
public class GiaoHangThongTinDHController extends HttpServlet {
	ChiTietHoaDonDao chiTietHoaDonDao = new ChiTietHoaDonDao();
	NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String soHD = request.getParameter("SoHD");
		String idNN = request.getParameter("IDNN");
		HttpSession session = request.getSession();
		if( session.getAttribute("ThongTinDonHang") != null) {
			session.removeAttribute("ThongTinDonHang");
		}
		
		if(KiemTraKieuSo.ktKieuSo(soHD) == true && KiemTraKieuSo.ktKieuSo(idNN) == true ) {
			Map<String, Object> thongTinDonHang = chiTietHoaDonDao.xemThongTinDonHang(Integer.parseInt(soHD));
			NguoiNhanHang nguoiNhanHang = nguoiNhanHangDao.getNguoiNhanHang(Integer.parseInt(idNN));
			thongTinDonHang.put("NguoiNhanHang", nguoiNhanHang);
			session.setAttribute("ThongTinDonHang", thongTinDonHang);
			response.sendRedirect("/SachKyAnh/view/admin/view/giaohang_xem_thongtin_dh.jsp");
		}
		else {
			response.sendRedirect("/SachKyAnh/view/admin/view/giaohang_trangchu.jsp");
		}
	}

}
